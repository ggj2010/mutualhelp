package com.ggj.mutualhelp.common.utils;

import junit.framework.Assert;
import lombok.extern.slf4j.Slf4j;

import org.junit.Before;
import org.junit.Test;

import redis.clients.jedis.Jedis;

/**
 * @ClassName:TestRedis.java
 * @Description:  redis测试类，命令总是忘记~~~  
 * @author gaoguangjin
 * @Date 2015-9-2 下午5:15:45
 */
@Slf4j
public class TestRedis {
	private Jedis jedis;
	
	@Before
	public void init() {
		// 连接redis linux服务器
		jedis = new Jedis("123.56.118.135", 6379);
		// 权限认证
		jedis.auth("gaoguangjin");// 密码最好越长越好，防止暴力破解
	}
	
	// 如果某个key不存在返回的null
	@Test
	public void testNull() throws InterruptedException {
		String key = "aa";
		// 删除key
		jedis.del(key);
		String a = jedis.get(key);
		
		Assert.assertNull(a);
		
		// incr自动递增,会默认生成key
		jedis.incr(key);
		
		// 1秒 key消失
		jedis.expire("aa", 1);
		log.info(jedis.get(key));
		Thread.sleep(2000);
		
		Assert.assertNull(a);
		jedis.del(key);
	}
}
