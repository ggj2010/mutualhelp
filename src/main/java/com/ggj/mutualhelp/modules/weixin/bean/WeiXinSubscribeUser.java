package com.ggj.mutualhelp.modules.weixin.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

import com.ggj.mutualhelp.common.persistence.BaseEntity;

/**
 * @ClassName:WeiXinSubscribeUser.java
 * @Description:  微信关注用户  
 * @author gaoguangjin
 * @Date 2015-11-19 下午5:44:24
 */
@Getter
@Setter
public class WeiXinSubscribeUser extends BaseEntity {
	private static final long serialVersionUID = -5999956208567052737L;
	private String name;
	// 取消关注日期
	private Date unsubscribeDate;
	// 关注日期
	private Date subscribeDate;
}
