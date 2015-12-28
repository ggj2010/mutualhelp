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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.ggj.mutualhelp.common.utils.PageUtils;
import com.ggj.mutualhelp.modules.base.web.BaseController;
import com.ggj.mutualhelp.modules.sys.entity.DictionaryTable;
import com.ggj.mutualhelp.modules.sys.service.DictionaryTableService;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName:DictionaryTableController.java
 * @Description: 字典表   
 * @author gaoguangjin
 * @Date 2015-9-23 上午10:47:17
 */
@RequestMapping("${adminPath}/sys/dict")
@Controller
@Slf4j
public class DictionaryTableController extends BaseController {
	@Autowired
	private PageUtils pageUtils;
	@Autowired
	private DictionaryTableService dictionaryTableService;
	
	@ModelAttribute
	public DictionaryTable get(@RequestParam(required = false) String id) {
		DictionaryTable dictionaryTable = null;
		if (!StringUtils.isEmpty(id)) {
			dictionaryTable = dictionaryTableService.get(id);
		}
		if (dictionaryTable == null) {
			dictionaryTable = new DictionaryTable();
		}
		return dictionaryTable;
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = "")
	public String list(DictionaryTable dictionaryTable, HttpServletRequest request, HttpServletResponse rep, Model model) {
		pageUtils.setPage(request, rep);
		PageInfo<DictionaryTable> pageInfo = dictionaryTableService.findPage(dictionaryTable);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("typeList", dictionaryTableService.getType(dictionaryTable));
		model.addAttribute("dictionaryTable", dictionaryTable);
		return "sys/dict/sys_dict_list";
	}
	
	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = "form")
	public String form(DictionaryTable dictionaryTable, Model model) {
		model.addAttribute("dictionaryTable", dictionaryTable);
		return "sys/dict/sys_dict_form";
	}
	
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "save")
	public String save(@Valid DictionaryTable dictionaryTable, BindingResult result, HttpServletRequest request, Model model,
		RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "sys/dict/sys_dict_form";
		} else {
			dictionaryTableService.save(dictionaryTable);
			addMessage(redirectAttributes, "字典字段保存成功!");
		}
		return "redirect:" + adminPath + "/sys/dict/";
	}
	
	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "/delete")
	public String delete(DictionaryTable dictionaryTable, RedirectAttributes redirectAttributes) {
		try {
			if (dictionaryTable != null && !StringUtils.isEmpty(dictionaryTable.getId())) {
				dictionaryTable.setFlag('1');
				dictionaryTableService.delete(dictionaryTable);
				addMessage(redirectAttributes, "字典字段删除成功!");
			}
		} catch (Exception e) {
			log.error("删除字典失败！" + e.getLocalizedMessage());
		}
		return "redirect:" + adminPath + "/sys/dict/";
	}
	
	@ResponseBody
	@RequestMapping(value = "ajax/getdicttype")
	public String getDictType(DictionaryTable dictionaryTable) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("value", dictionaryTableService.getLikeType(dictionaryTable));
		return jsonObject.toJSONString();
	}
}
