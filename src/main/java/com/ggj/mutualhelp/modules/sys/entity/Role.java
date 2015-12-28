package com.ggj.mutualhelp.modules.sys.entity;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

import org.apache.commons.lang3.StringUtils;

import com.ggj.mutualhelp.common.persistence.BaseEntity;

/**
 * @ClassName:Role.java
 * @Description:    角色
 * @author gaoguangjin
 * @Date 2015-11-2 下午5:00:15
 */
@Getter
@Setter
public class Role extends BaseEntity {
	private static final long serialVersionUID = -2034069739195743884L;
	
	private String name;
	
	private String menuIds;
	private List<Menu> menuList = new ArrayList<Menu>();;
	
	private List<String> menuIdsList = new ArrayList<String>();
	
	public void setMenuIds(String menuIds) {
		// 防止重复赋值
		menuList = new ArrayList<Menu>();
		if (menuIds != null) {
			String[] ids = StringUtils.split(menuIds, ",");
			for (String id : ids) {
				menuList.add(new Menu(id));
			}
		}
	}
	
	public String getMenuIds() {
		return StringUtils.join(getMenuIdList(), ",");
	}
	
	/* 根据list获取menuId */
	public List<String> getMenuIdList() {
		menuIdsList = new ArrayList<String>();
		for (Menu menu : menuList) {
			menuIdsList.add(menu.getId());
		}
		return menuIdsList;
	}
	
}
