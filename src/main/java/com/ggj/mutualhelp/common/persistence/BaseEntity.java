package com.ggj.mutualhelp.common.persistence;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.annotation.JSONField;
import com.ggj.mutualhelp.common.utils.IdGen;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.account.utils.UserUtils;

/**
 * @ClassName:BaseEntity.java
 * @Description:所有entity父类    
 * @author gaoguangjin
 * @Date 2015-9-24 上午10:43:44
 */
@Getter
@Setter
public abstract class BaseEntity implements Serializable {
	private static final long serialVersionUID = -3585903986953379399L;
	
	protected String id;
	
	// 删除标记【 0：正常】；【1：删除】
	protected char flag = '0';
	
	// 创建日期
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	protected Date createDate;
	
	// 更新日期
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	protected Date updateDate;
	
	// 创建者
	protected UserInfo createUser;
	// 更新者
	protected UserInfo updateUser;
	
	protected String remarks;
	
	/**
	 * @Description: crud保存
	 * @return:void
	 */
	public void preInsert() {
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (StringUtils.isEmpty(id)) {
			setId(IdGen.uuid());
		}
		this.createDate = new Date();
		
		// 登陆之后才有创建者
		UserInfo currentUserInfo = UserUtils.getCurrentUserInfo();
		if (currentUserInfo != null)
			this.createUser = currentUserInfo;
	}
	
	/**
	 * @Description: crud更新 
	 * @return:void
	 */
	public void preUpdate() {
		this.updateDate = new Date();
		// 登陆之后才有更新者
		UserInfo currentUserInfo = UserUtils.getCurrentUserInfo();
		if (currentUserInfo != null)
			this.updateUser = currentUserInfo;
	}
}
