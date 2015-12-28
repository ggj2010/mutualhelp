package com.ggj.mutualhelp.common.shiro.authc;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.account.utils.UserUtils;

/**
 * @ClassName:Principal.java
 * @Description:存放用户信息    
 * @author gaoguangjin
 * @Date 2015-9-15 下午4:18:04
 */
@Getter
@Setter
public class Principal implements Serializable {
	private UserInfo userInfo;
	
	private String id; // 编号
	private String loginName; // 登录名
	private String name; // 姓名
	
	public Principal(String email, UserInfo userInfo) {
		this.loginName = email;
		this.userInfo = userInfo;
		this.name = userInfo.getName();
		this.id = userInfo.getId();
	}
	
	public String getSessionid() {
		try {
			return (String) UserUtils.getSession().getId();
		} catch (Exception e) {
			return "";
		}
	}
	
	public String toString() {
		return id;
	}
}
