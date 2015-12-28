package com.ggj.mutualhelp.common.redis;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;

import com.ggj.mutualhelp.common.redis.callback.RedisCallback;
import com.ggj.mutualhelp.common.redis.callback.TransactionCallBack;

/**
 * @ClassName:RedisDaoTemplate.java
 * @Description: <K, V>有可能返回式map类型，暂时没用到  ，<T>为泛型 
 * @author gaoguangjin
 * @Date 2015-9-1 下午3:53:49
 */
@Slf4j
@Service
public class RedisDaoTemplate implements RedisOperation {
	private final String DEFAULTTYPE = "defaultType";
	@Autowired
	RedisCacheManager redisCacheManager;
	
	public <T> T execute(RedisCallback<T> rc) {
		Jedis jedis = null;
		List<Object> object = null;
		try {
			// 用默认的db 0;
			jedis = redisCacheManager.getRedisPoolMap().get(RedisDataBaseType.defaultType.toString()).getResource();
			return rc.doInRedis(jedis);
		} catch (Exception e) {
			log.error("执行redis操作异常" + e.getLocalizedMessage());
			return null;
		}
		finally {
			redisCacheManager.returnResource(RedisDataBaseType.defaultType, jedis);
		}
	}
	
	public void execute(TransactionCallBack rc) {
		Jedis jedis = null;
		Transaction transaction;
		List<Object> object = null;
		try {
			// 用默认的db 0;
			jedis = redisCacheManager.getRedisPoolMap().get(RedisDataBaseType.defaultType.toString()).getResource();
			transaction = jedis.multi();
			rc.execute(transaction);
			object = transaction.exec();
		} catch (Exception e) {
			log.error("执行redis操作异常" + e.getLocalizedMessage());
		}
		finally {
			redisCacheManager.returnResource(RedisDataBaseType.defaultType, jedis);
		}
	}
}
