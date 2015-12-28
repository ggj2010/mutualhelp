package com.ggj.mutualhelp.modules.account.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import com.alibaba.fastjson.annotation.JSONField;
import com.ggj.mutualhelp.common.persistence.BaseEntity;

@Getter
@Setter
public class UserInfo extends BaseEntity {
	
	private static final long serialVersionUID = -8131486642652154706L;
	@NotEmpty(message = "邮箱不能为空")
	@Email(message = "邮箱格式填写错误！")
	private String email;
	
	@NotEmpty(message = "用户名不能为空")
	private String name;
	@NotEmpty(message = "密码不能为空")
	@Length(min = 6, message = "密码长度不能少于6位")
	private String password;
	private String salt;
	private int age;
	private char sex;
	// 注册日期
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date registerDate;
	// 最后登录时间
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date lastLoginDate;
	// 是否是黑名单
	private char isBlacklist = '0';
	// 是否邮箱激活
	private char isActive;
	
	// 是否保存密码到cookie
	private boolean rememberMe;
	
	public UserInfo(String email) {
		this.email = email;
	}
	
	public UserInfo() {
	}
	
	public String toString() {
		return "email:" + email + "==" + "name" + name;
	}
}
