package com.ggj.mutualhelp.modules.weixin.service;

import java.util.Date;

import com.ggj.mutualhelp.modules.weixin.util.WeiXinUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.modules.weixin.bean.WeiXinSubscribeUser;
import com.ggj.mutualhelp.modules.weixin.dao.WeiXinSubscribeUserDao;
import com.ggj.mutualhelp.modules.weixin.util.XmlExchangeUtil;
import com.ggj.mutualhelp.modules.weixin.vo.InputMessage;

@Service("event")
@Transactional(readOnly = true)
public class EventService implements BaseService {
	@Autowired
	private WeiXinSubscribeUserDao dao;
	
	@Transactional(readOnly = false)
	public String deal(InputMessage inputMessage) {
		WeiXinSubscribeUser wsu = new WeiXinSubscribeUser(inputMessage.getToUserName());
		inputMessage.setMsgType("text");
		if (inputMessage.EVENT_SUBSCRIBE.equals(inputMessage.getEvent())) {
			int count =	 dao.checkIsSubscribe(wsu.getName()); ;
			if (count > 0) {
				inputMessage.setContent("谢谢再次关注【猫与狗的世界 】,此账号正在开发学习阶段");
			} else {
				inputMessage.setContent("谢谢关注【猫与狗的世界 】,此账号正在开发学习阶段");
			}
			insert(wsu);
		} else {
			wsu.setUnsubscribeDate(new Date());
			dao.update(wsu);
			inputMessage.setContent("再见主人~");
		}
		return XmlExchangeUtil.getXmlByObject(inputMessage);
	}

	private  void insert(WeiXinSubscribeUser wsu) {
		wsu.preInsert();
		wsu.setSubscribeDate(new Date());
		dao.insert(wsu);
	}

}
