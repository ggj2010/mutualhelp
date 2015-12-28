package com.ggj.mutualhelp.modules.sys.controller;

import lombok.extern.slf4j.Slf4j;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggj.mutualhelp.modules.sys.entity.Role;
import com.ggj.mutualhelp.modules.sys.service.UserRoleService;

/**
 * @ClassName:UserRoleController.java
 * @Description: 用户权限   
 * @author gaoguangjin
 * @Date 2015-11-9 下午4:16:20
 */
@Controller
@Slf4j
@RequestMapping("${adminPath}/sys/userrole")
public class UserRoleController {
	@Autowired
	private UserRoleService userRoleService;
	
	@RequiresPermissions("sys:userrole:view")
	@RequestMapping(value = "form")
	public String form(Role role, Model model) {
		
		return "sys/role/sys_user_role";
	}
	
	@RequiresPermissions("sys:userrole:edit")
	@RequestMapping(value = "save")
	public String save(Role role, Model model) {
		
		return "sys/role/sys_user_role";
	}
	
}
