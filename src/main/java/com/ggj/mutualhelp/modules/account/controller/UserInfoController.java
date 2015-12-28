package com.ggj.mutualhelp.modules.account.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggj.mutualhelp.common.security.useraccount.UserSecurity;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.account.service.UserInfoService;
import com.ggj.mutualhelp.modules.account.utils.UserUtils;

/**
 * @ClassName:UserInfoController.java
 * @Description: 用户信息   
 * @author gaoguangjin
 * @Date 2015-9-24 上午10:44:06
 */
@Slf4j
@Controller
public class UserInfoController {
	
	@Autowired
	private UserSecurity userSecurity;
	@Autowired
	private UserUtils userUtils;
	@Autowired
	private UserInfoService userInfoService;
	
	@Value("${repeatRegisterError}")
	private String repeatRegisterError;
	
	@Value("${verifyEmailError}")
	private String verifyEmailError;
	
	@RequestMapping(value = "account/register")
	public String registerView(Model model, UserInfo userInfo) {
		model.addAttribute("userInfo", userInfo);
		return "account/register";
	}
	
	@RequestMapping(value = "account/register/save")
	public String registerSave(@Valid UserInfo userInfo, BindingResult result, HttpServletRequest request, Model model) throws Exception {
		try {
			if (result.hasErrors()) {
				return "account/register";
			}
			// 防止暴力注册
			if (!userSecurity.checkRegisterTimes(request)) {
				// result.rejectValue("password", "", repeatRegisterError);
				model.addAttribute("messages", repeatRegisterError);
				return "account/register";
			}
			// 保存用户信息
			userInfoService.save(userInfo);
			
			model.addAttribute("id", userInfo.getId());
			model.addAttribute("email", userInfo.getEmail());
			model.addAttribute("name", userInfo.getName());
		} catch (Exception e) {
			log.error("保存失败！" + e.getLocalizedMessage());
		}
		return "account/checkEmail";
	}
	
	/**
	 * @Description: jquery validate remote参数返回值必须是true/false
	 * @param email
	 * @return:String
	 */
	@ResponseBody
	@RequestMapping(value = "account/checkemail")
	public String checkEmailIsExist(String email) {
		return userInfoService.checkEmail(email) == true ? "false" : "true";
	}
	
	/**
	 * @Description: 发送验证邮件 
	 * @param email
	 * @return:String
	 */
	@ResponseBody
	@RequestMapping(value = "account/sendVerifyEmail")
	public String sendVerifyEmail(UserInfo userInfo) {
		try {
			userInfoService.sendVerifyEmail(userInfo, false);
		} catch (Exception e) {
			log.error("发送验证邮件失败！" + e.getLocalizedMessage());
			return "发送失败";
		}
		return "发送成功";
	}
	
	/**
	 * @Description:  邮箱验证激活
	 * @param token
	 * @return:String
	 */
	@RequestMapping(value = "account/emailverify")
	public String verifyEmail(String token, Model model) {
		try {
			boolean flag = false;
			String message = verifyEmailError;
			if (!StringUtils.isEmpty(token) && userInfoService.verifyEmailByToken(token)) {
				flag = true;
				message = "激活成功！点击下面登陆";
			}
			model.addAttribute("flag", flag);
			model.addAttribute("message", message);
		} catch (Exception e) {
			log.error("邮箱验证激活失败！" + e.getLocalizedMessage());
		}
		return "account/verifEmail";
	}
	
	/**
	 * @Description:  用户信息
	 * @param model
	 * @param userInfo
	 * @return:String
	 */
	@RequestMapping(value = "account/info")
	public String accountInfo(Model model, UserInfo userInfo) {
		model.addAttribute("userInfo", userUtils.getCachedUserInfo(userInfo.getEmail()));
		return "account/info";
	}
	
}
