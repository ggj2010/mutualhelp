package com.ggj.mutualhelp.modules.sys.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import com.ggj.mutualhelp.common.crud.CrudService;
import com.ggj.mutualhelp.common.redis.RedisDaoTemplate;
import com.ggj.mutualhelp.common.redis.callback.RedisCallback;
import com.ggj.mutualhelp.common.redis.callback.TransactionCallBack;
import com.ggj.mutualhelp.modules.sys.dao.DictionaryTableDao;
import com.ggj.mutualhelp.modules.sys.entity.DictionaryTable;

/**
 * @ClassName:DictionaryTableService.java
 * @Description:  字典表服务层  
 * @author gaoguangjin
 * @Date 2015-9-23 下午1:24:00
 */
@Service
@Transactional(readOnly = true)
public class DictionaryTableService extends CrudService<DictionaryTableDao, DictionaryTable> {
	
	@Autowired
	RedisDaoTemplate redisTemplate;
	
	@Value("${dictionaryTableTypeKey}")
	String dictionaryTableTypeKey;
	
	/**
	 * @Description:  获取类型
	 * @return:List<String>
	 */
	public List<String> getType(final DictionaryTable dictionaryTable) {
		return redisTemplate.execute(new RedisCallback<List<String>>() {
			public List<String> doInRedis(Jedis jedis) {
				Set<String> set = jedis.smembers(dictionaryTableTypeKey);
				List<String> list = new ArrayList<String>(set);
				if (list != null && list.size() > 0) {
					return list;
				} else {
					List<String> lists = dao.getType(dictionaryTable);
					for (String string : lists) {
						jedis.sadd(dictionaryTableTypeKey, string);
					}
					return lists;
				}
			}
		});
	}
	
	@Override
	@Transactional(readOnly = false)
	public void save(final DictionaryTable entity) {
		super.save(entity);
		redisTemplate.execute(new TransactionCallBack() {
			public void execute(Transaction t) {
				// 将type放到redis
				t.sadd(dictionaryTableTypeKey, entity.getType());
			}
		});
	}
	
	@Override
	@Transactional(readOnly = false)
	public void delete(DictionaryTable entity) {
		super.delete(entity);
		redisTemplate.execute(new TransactionCallBack() {
			public void execute(Transaction t) {
				// 将type放到redis
				t.del(dictionaryTableTypeKey);
			}
		});
	}
	
	/**
	 * @Description:  like查询
	 * @param dictionaryTable
	 * @return:List<String>
	 */
	public List<String> getLikeType(DictionaryTable dictionaryTable) {
		return dao.getType(dictionaryTable);
	}
	
}
