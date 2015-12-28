package com.ggj.mutualhelp.modules.account.utils;

import java.util.Arrays;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Slf4j
@RunWith(Parameterized.class)
public class UserUtilsTest {
	private UserUtils userUtils;
	private String email;
	
	public UserUtilsTest(String email) {
		this.email = email;
	}
	
	// 多个参数,方法必须是static
	@Parameters
	public static List<String[]> getParameters() {
		return Arrays.asList(new String[][] { { "335424093@qq.com" }, { "1056639226@qq.com" } });
		
	}
	
	@Before
	public void before() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring/spring*.xml");
		userUtils = context.getBean(UserUtils.class);
	}
	
	/**
	 * @Description:多少个@Parameters  执行多少次这个方法  
	 * @return:void
	 */
	@Test
	public void cycleTest() {
		log.info(userUtils.getCachedUserInfo(email) + "");
	}
	
}
