package com.ggj.mutualhelp.common.redis;

import com.ggj.mutualhelp.common.redis.callback.RedisCallback;
import com.ggj.mutualhelp.common.redis.callback.TransactionCallBack;

public interface RedisOperation {
	
	<T> T execute(RedisCallback<T> rc);
	
	/**
	 * @Description:事务的不带返回值，一次性提交  
	 * @param rc     
	 * @return:void
	 */
	void execute(TransactionCallBack rc);
}
