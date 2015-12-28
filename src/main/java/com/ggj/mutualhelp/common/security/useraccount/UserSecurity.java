package com.ggj.mutualhelp.common.security.useraccount;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.ggj.mutualhelp.common.redis.RedisDaoTemplate;
import com.ggj.mutualhelp.common.redis.callback.RedisCallback;

/**
 * @ClassName:UserSecurity.java
 * @Description: 系统安全类  
 * @author gaoguangjin
 * @Date 2015-9-24 上午10:42:55
 */
@Service
public class UserSecurity {
	
	@Autowired
	private RedisDaoTemplate redisDao;
	
	@Value("${checkRegisterIPKey}")
	private String checkRegisterIPKey;
	// 同一ip重复注册时间限制
	@Value("${repeatRegisterSeconds}")
	private int repeatRegisterSeconds;
	
	// 账户锁定key
	@Value("${pwdWrongLockedKey}")
	private String pwdWrongLockedKey;
	
	// 密码允许最多错误次数
	@Value("${passwordMaxRetryCount}")
	private int passwordMaxRetryCount;
	// 账户锁定时间
	@Value("${accountLockTime}")
	private int accountLockTime;
	
	// 登陆密码错误次数key
	@Value("${pwdWrongTimesKey}")
	private String pwdWrongTimesKey;
	
	/**
	 * @Description:1分钟同一个ip只能注册一次，防止暴力注册导致垃圾数据
	 * @param request
	 * @return:boolean true 表示允许注册，false不允许
	 */
	public boolean checkRegisterTimes(HttpServletRequest request) {
		final String ipKey = checkRegisterIPKey + request.getRemoteAddr();
		return redisDao.execute(new RedisCallback<Boolean>() {
			public Boolean doInRedis(Jedis jedis) {
				// 是空就允许注册
				if (StringUtils.isEmpty(jedis.get(ipKey))) {
					jedis.incr(ipKey);
					jedis.expire(ipKey, repeatRegisterSeconds);
					return true;
				}
				return false;
			}
		});
	}
	
	/**
	 * @Description: 判断当前账户是否被锁定
	 * @param email
	 * @return:boolean
	 */
	public boolean checkAccountIsLocked(final String email) {
		return redisDao.execute(new RedisCallback<Boolean>() {
			public Boolean doInRedis(Jedis jedis) {
				// 检查当前登陆emai是否被锁定
				Set<String> set = jedis.keys(pwdWrongLockedKey + email);
				if (CollectionUtils.isEmpty(set)) {
					return false;
				}
				return true;
			}
		});
	}
	
	/**
	 * @Description: 检查密码输入错误次数，次数达到一定锁定账户 。成功登陆就清空以前的错误次数
	 * @param email     
	 * @param matches 
	 * @return:void
	 */
	public void checkLoginErrorTimes(final String email, final boolean matches) {
		redisDao.execute(new RedisCallback<Object>() {
			public Object doInRedis(Jedis jedis) {
				String key = pwdWrongTimesKey + email;
				String lockedKey = pwdWrongLockedKey + email;
				// 登陆成功，删除以前登陆失败次数
				if (matches) {
					jedis.del(key);
					return null;
				}
				jedis.incr(key);
				// 错误次数达到一定 锁定账户
				if (Integer.parseInt(jedis.get(key)) > passwordMaxRetryCount) {
					jedis.set(lockedKey, "");
					jedis.expire(lockedKey, accountLockTime);
				}
				return null;
			}
		});
	}
}
