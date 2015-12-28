package com.ggj.mutualhelp.common.utils;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ggj.mutualhelp.BaseTest;

/**
 * @ClassName:TestSendMailUtil.java
 * @Description: 测试发送邮件   
 * @author gaoguangjin
 * @Date 2015-9-2 下午2:29:19
 */
public class TestSendMailUtil extends BaseTest {
	@Autowired
	SendMailUtil sendMailUtil;
	
	@Test
	public void test() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("registerDate", DateUtils.getDateTime());
		map.put("verifyUrl", "http://www.baidu.com");
		map.put("invalidTime", "3600");
		map.put("email", "gaoguangjinjava@aliyun.com");
		map.put("name", "ggj2010");
		sendMailUtil.sendFtlMail("335424093@qq.com", "ceshi", "template/email/register.ftl", map);
	}
	
}
