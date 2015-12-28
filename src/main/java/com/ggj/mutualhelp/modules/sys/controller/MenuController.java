package com.ggj.mutualhelp.modules.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ggj.mutualhelp.modules.base.web.BaseController;
import com.ggj.mutualhelp.modules.sys.entity.DictionaryTable;
import com.ggj.mutualhelp.modules.sys.entity.Menu;
import com.ggj.mutualhelp.modules.sys.service.DictionaryTableService;
import com.ggj.mutualhelp.modules.sys.service.MenuService;

@Slf4j
/**
 * @ClassName:MeunController.java
 * @Description:   系统菜单
 * @author gaoguangjin
 * @Date 2015-10-12 下午8:17:06
 */
@Controller
@RequestMapping("${adminPath}/sys/menu")
public class MenuController extends BaseController {
	
	@Autowired
	private DictionaryTableService dictionaryTableService;
	
	@Autowired
	private MenuService menuService;
	
	@ModelAttribute
	public Menu get(@RequestParam(required = false) String id) {
		if (!StringUtils.isEmpty(id)) {
			return menuService.get(id);
		} else {
			return new Menu();
		}
	}
	
	@RequiresPermissions("sys:menu:view")
	@RequestMapping(value = "")
	public String list(Menu menu, HttpServletRequest request, HttpServletResponse rep, Model model) {
		List<Menu> sortList = new ArrayList<Menu>();
		menuService.sortList(menuService.findList(menu), "1", sortList);
		model.addAttribute("list", sortList);
		return "sys/menu/sys_menu_list";
	}
	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "form")
	public String form(Menu menu, HttpServletRequest request, HttpServletResponse rep, Model model) {
		model.addAttribute("menu", menu);
		// model.addAttribute("targetList", dictionaryTableService.get());
		model.addAttribute("typeList", dictionaryTableService.findList(new DictionaryTable("target")));
		return "sys/menu/sys_menu_form";
	}
	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "delete")
	public String delete(Menu menu, RedirectAttributes redirectAttributes) {
		try {
			// if (dictionaryTable != null && !StringUtils.isEmpty(dictionaryTable.getId())) {
			// dictionaryTable.setFlag('1');
			// dictionaryTableService.delete(dictionaryTable);
			// addMessage(redirectAttributes, "删除成功!");
			// }
		} catch (Exception e) {
			// log.error("删除字典失败！" + e.getLocalizedMessage());
		}
		return "redirect:" + adminPath + "/sys/dict/";
	}
	
	@RequiresPermissions("sys:menu:edit")
	@RequestMapping(value = "save")
	public String save(@Valid Menu menu, BindingResult result, HttpServletRequest request, Model model) {
		if (result.hasErrors()) {
			return "sys/menu/sys_menu_form";
		} else {
			menuService.save(menu);
		}
		return "redirect:" + adminPath + "/sys/menu/";
	}
	
	@ResponseBody
	@RequiresPermissions("user")
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> getMenuTreeData(Menu menu) {
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		List<Menu> list = menuService.findList(menu);
		for (Menu menus : list) {
			if (menus != null && (menus.getId().equals(menu.getExtId()) || menus.getParentId().equals(menu.getExtId())))
				continue;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", menus.getId());
			map.put("pId", menus.getParentId());
			map.put("name", menus.getName());
			map.put("open", true);
			mapList.add(map);
		}
		return mapList;
	}
}
