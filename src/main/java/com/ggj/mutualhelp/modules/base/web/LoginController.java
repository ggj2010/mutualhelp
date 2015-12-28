package com.ggj.mutualhelp.modules.base.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ggj.mutualhelp.common.shiro.authc.FormAuthenticationFilter;
import com.ggj.mutualhelp.common.shiro.authc.Principal;
import com.ggj.mutualhelp.common.shiro.authc.SystemAuthorizingRealm;
import com.ggj.mutualhelp.modules.account.utils.UserUtils;

/**
 * @ClassName:LoginController.java
 * @Description:    用户登陆登陆登出
 * @author gaoguangjin
 * @Date 2015-9-8 下午5:29:40
 */
@Controller
@Slf4j
@RequestMapping("${adminPath}/account/")
public class LoginController {
	@Autowired
	SystemAuthorizingRealm ream;
	
	@Autowired
	private UserUtils userUtils;
	
	@RequestMapping(value = "login", method = { RequestMethod.GET })
	public String redirectToLogin(HttpServletRequest request, HttpServletResponse response, Model model) {
		// 已经登陆过，就直接跳转到主界面
		if (SecurityUtils.getSubject().getPrincipal() != null) {
			return "redirect:index";
		}
		return "account/login";
	}
	
	/**
	 * @Description:Shiro登陆验证失败跳转到此页面
	 * @param request
	 * @param response
	 * @param model
	 * @return:String
	 */
	@RequestMapping(value = "login", method = { RequestMethod.POST })
	public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
		// 登陆失败需要将错误信息打印出来哦
		String exception = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		String message = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);
		
		model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
		model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);
		
		return "account/login";
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		//
		// model.addAttribute("userName", attributeValue);
		//
		// userUtils.getCachedUserInfo(email)
		
		Principal principal = userUtils.getPrincipal();
		model.addAttribute("userName", principal.getName());
		return "index";
	}
	
	/****************************shiro相关的内容****************************/
	/**
	 * @Description: 自定义退出 
	 * @return:String
	 */
	@RequestMapping(value = "logouts")
	public String logouts() {
		// TODO 清楚一些缓存，session啊等到
		
		SecurityUtils.getSubject().logout();
		return "redirect:/index.html";
	}
	
	/**
	 * @Description: 切换权限，在企业级项目里面可能有这样的需求就是，不重新登陆情况下切换当前用户到别的role，那么shiro的权限也需要跟着变化
	 * @return:String
	 */
	@RequestMapping(value = "changerole")
	public String changeRole() {
		ream.changePermission();
		return "redirect:/web/account/index";
	}
	
}
