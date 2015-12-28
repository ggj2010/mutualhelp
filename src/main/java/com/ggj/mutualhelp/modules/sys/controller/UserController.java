package com.ggj.mutualhelp.modules.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ggj.mutualhelp.common.utils.PageUtils;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.sys.service.UserService;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName:UserController.java
 * @Description:  用户管理  
 * @author gaoguangjin
 * @Date 2015-11-17 下午4:21:51
 */
@Controller
@RequestMapping("${adminPath}/sys/user")
public class UserController {
	@Autowired
	private PageUtils pageUtils;
	@Autowired
	private UserService userService;
	
	@RequiresPermissions("sys:user:list")
	@RequestMapping(value = "")
	public String list(UserInfo userInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		pageUtils.setPage(request, response);
		PageInfo<UserInfo> pageInfo = userService.findPage(userInfo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("userInfo", userInfo);
		return "sys/user/sys_user_list";
	}
}
