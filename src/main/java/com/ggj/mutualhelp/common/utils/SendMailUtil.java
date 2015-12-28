package com.ggj.mutualhelp.common.utils;

import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * @ClassName:SendMailUtil.java
 * @Description:    发送邮件util
 * @author gaoguangjin
 * @Date 2015-9-2 下午2:10:04
 */

@Service
public class SendMailUtil {
	
	private final String charSet = "utf-8";
	@Value("${adminEmailName}")
	private String from;
	// 发件人别名
	@Value("${adminEmailFromName}")
	private String fromName;
	
	@Value("${adminEmailName}")
	private String adminEmailName;
	@Value("${adminEmailPassword}")
	private String adminEmailPassword;
	
	private Map<String, String> hostMap = new HashMap<String, String>();
	{
		// 126
		hostMap.put("smtp.126", "smtp.126.com");
		// qq
		hostMap.put("smtp.qq", "smtp.qq.com");
		// 163
		hostMap.put("smtp.163", "smtp.163.com");
		// sina
		hostMap.put("smtp.sina", "smtp.sina.com.cn");
		// tom
		hostMap.put("smtp.tom", "smtp.tom.com");
		// 263
		hostMap.put("smtp.263", "smtp.263.net");
		// yahoo
		hostMap.put("smtp.yahoo", "smtp.mail.yahoo.com");
		// hotmail
		hostMap.put("smtp.hotmail", "smtp.live.com");
		// gmail
		hostMap.put("smtp.gmail", "smtp.gmail.com");
		hostMap.put("smtp.port.gmail", "465");
		
		hostMap.put("smtp.aliyun", "smtp.aliyun.com");
	}
	
	public String getHost(String email) throws Exception {
		Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
		Matcher matcher = pattern.matcher(email);
		String key = "unSupportEmail";
		if (matcher.find()) {
			key = "smtp." + matcher.group(1);
		}
		if (hostMap.containsKey(key)) {
			return hostMap.get(key);
		} else {
			throw new Exception("unSupportEmail");
		}
	}
	
	public int getSmtpPort(String email) throws Exception {
		Pattern pattern = Pattern.compile("\\w+@(\\w+)(\\.\\w+){1,2}");
		Matcher matcher = pattern.matcher(email);
		String key = "unSupportEmail";
		if (matcher.find()) {
			key = "smtp.port." + matcher.group(1);
		}
		if (hostMap.containsKey(key)) {
			return Integer.parseInt(hostMap.get(key));
		} else {
			return 25;
		}
	}
	
	/**
	 * 发送模板邮件
	 * 
	 * @param toMailAddr
	 *            收信人地址
	 * @param subject
	 *            email主题
	 * @param templatePath
	 *            模板地址
	 * @param map
	 *            模板map
	 */
	public void sendFtlMail(String toMailAddr, String subject, String templatePath, Map<String, Object> map) {
		HtmlEmail hemail = new HtmlEmail();
		try {
			hemail.setHostName(getHost(from));
			hemail.setSmtpPort(getSmtpPort(from));
			hemail.setCharset(charSet);
			hemail.addTo(toMailAddr);
			hemail.setFrom(from, fromName);
			hemail.setAuthentication(adminEmailName, adminEmailPassword);
			hemail.setSubject(subject);
			
			StringWriter result = new StringWriter();
			Template t = new Template("", new InputStreamReader(new ClassPathResource(templatePath).getInputStream(), "utf-8"), new Configuration());
			t.process(map, result);
			hemail.setMsg(result.toString());
			hemail.send();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("email send error!");
		}
	}
	
	/**
	 * 发送普通邮件
	 * 
	 * @param toMailAddr
	 *            收信人地址
	 * @param subject
	 *            email主题
	 * @param message
	 *            发送email信息
	 */
	public void sendCommonMail(String toMailAddr, String subject, String message) {
		HtmlEmail hemail = new HtmlEmail();
		try {
			hemail.setHostName(getHost(from));
			hemail.setSmtpPort(getSmtpPort(from));
			hemail.setCharset(charSet);
			hemail.addTo(toMailAddr);
			hemail.setFrom(from, fromName);
			hemail.setAuthentication(adminEmailName, adminEmailPassword);
			hemail.setSubject(subject);
			hemail.setMsg(message);
			hemail.send();
			System.out.println("email send true!");
		} catch (Exception e) {
			System.out.println("email send error!");
		}
	}
	
}