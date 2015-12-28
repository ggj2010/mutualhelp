package com.ggj.mutualhelp.modules.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggj.mutualhelp.common.utils.PageUtils;
import com.ggj.mutualhelp.modules.base.web.BaseController;
import com.ggj.mutualhelp.modules.sys.entity.Role;
import com.ggj.mutualhelp.modules.sys.service.RoleService;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName:RoleController.java
 * @Description:   角色 
 * @author gaoguangjin
 * @Date 2015-11-2 下午5:33:37
 */
@Controller
@Slf4j
@RequestMapping("${adminPath}/sys/role")
public class RoleController extends BaseController {
	@Autowired
	private PageUtils pageUtils;
	@Autowired
	private RoleService roleService;
	
	@ModelAttribute
	public Role get(@RequestParam(required = false) String id) {
		Role Role = null;
		if (!StringUtils.isEmpty(id)) {
			Role = roleService.get(id);
		}
		if (Role == null) {
			Role = new Role();
		}
		return Role;
	}
	
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "")
	public String list(Role role, HttpServletRequest request, HttpServletResponse rep, Model model) {
		pageUtils.setPage(request, rep);
		PageInfo<Role> pageInfo = roleService.findPage(role);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("role", role);
		return "sys/role/sys_role_list";
	}
	
	@RequiresPermissions("sys:role:view")
	@RequestMapping(value = "form")
	public String form(Role role, Model model) {
		model.addAttribute("role", role);
		return "sys/role/sys_role_form";
	}
	
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "save")
	public String save(@Valid Role role, BindingResult result, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "sys/role/sys_role_form";
		} else {
			roleService.save(role);
		}
		addMessage(redirectAttributes, "角色保存成功!");
		return "redirect:" + adminPath + "/sys/role/";
	}
	
	@RequiresPermissions("sys:role:edit")
	@RequestMapping(value = "delete")
	public String delete(Role role, RedirectAttributes redirectAttributes) {
		try {
			if (role != null && !StringUtils.isEmpty(role.getId())) {
				role.setFlag('1');
				roleService.delete(role);
				addMessage(redirectAttributes, "角色删除成功!");
			}
		} catch (Exception e) {
			log.error("删除角色失败！" + e.getLocalizedMessage());
		}
		return "redirect:" + adminPath + "/sys/role/";
	}
}
