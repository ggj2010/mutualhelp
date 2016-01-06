package com.ggj.mutualhelp.modules.account.dao;

import org.apache.ibatis.annotations.Param;

import com.ggj.mutualhelp.common.crud.CrudDao;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;

public interface UserInfoDao extends CrudDao<UserInfo> {
	
	/**
	 * 	@Description:激活帐号
	 * @param tokenExists
	 * @return:void
	 */
	public void activeEamil(@Param("id") String id, @Param("isActive") char isActive);

	/**
	 * 更新图像
	 * @param id
	 * @param updateImge
     */
	public void updateImge(@Param("id") String id, @Param("image") String image);

}
