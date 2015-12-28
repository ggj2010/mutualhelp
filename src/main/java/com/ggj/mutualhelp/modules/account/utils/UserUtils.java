package com.ggj.mutualhelp.modules.account.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;

import com.alibaba.fastjson.JSON;
import com.ggj.mutualhelp.common.redis.RedisDaoTemplate;
import com.ggj.mutualhelp.common.redis.callback.RedisCallback;
import com.ggj.mutualhelp.common.shiro.authc.Principal;
import com.ggj.mutualhelp.modules.account.dao.UserInfoDao;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;

/**
 * @ClassName:UserUtils.java
 * @Description:用户信息工具类    
 * @author gaoguangjin
 * @Date 2015-9-24 上午10:44:46
 */
@Service
public class UserUtils {
	@Autowired
	private UserInfoDao dao;
	
	@Autowired
	RedisDaoTemplate redisDaoTemplate;
	
	@Value("${userInfoKey}")
	private String userInfoKey;
	
	/**
	 * @Description: 根据登录名去缓存里面查询信息，没有再去数据库查询
	 * @param email
	 * @return:UserInfo
	 */
	public UserInfo getCachedUserInfo(final String email) {
		return redisDaoTemplate.execute(new RedisCallback<UserInfo>() {
			public UserInfo doInRedis(Jedis jedis) {
				String key = userInfoKey + email;
				String jsonObject = jedis.get(key);
				if (jsonObject != null) {
					// 缓存里面存放的是null字符串值
					if (jsonObject.equals("null"))
						return null;
					return JSON.parseObject(jsonObject, UserInfo.class);
				} else {
					UserInfo userInfo = dao.get(new UserInfo(email));
					// 数据库里面查询不到 也要放到缓存里面，只不过赋值为null
					jedis.set(key, userInfo == null ? "null" : JSON.toJSONString(userInfo));
					return userInfo;
				}
			}
		});
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal) subject.getPrincipal();
			if (principal != null) {
				return principal;
			}
			// subject.logout();
		} catch (UnavailableSecurityManagerException e) {
		} catch (InvalidSessionException e) {
		}
		return null;
	}
	
	/**
	 * @Description:  获取当前用户登陆信息
	 * @return:UserInfo
	 */
	public static UserInfo getCurrentUserInfo() {
		Principal currentUser = getPrincipal();
		if (currentUser != null)
			return currentUser.getUserInfo();
		return null;
	}
	
	public static Session getSession() {
		try {
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null) {
				session = subject.getSession();
			}
			if (session != null) {
				return session;
			}
			// subject.logout();
		} catch (InvalidSessionException e) {
			
		}
		return null;
	}
	
}
