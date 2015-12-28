package com.ggj.mutualhelp.modules.weixin.dao;

import com.ggj.mutualhelp.modules.weixin.bean.WeiXinSubscribeUser;

public interface WeiXinSubscribeUserDao {
	int checkIsSubscribe(String name);
	
	void insert(WeiXinSubscribeUser user);
	
	void update(WeiXinSubscribeUser user);
	
}
