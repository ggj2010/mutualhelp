package com.ggj.mutualhelp.common.config;

import com.ggj.mutualhelp.common.utils.PropertiesLoader;

public class Global {
	
	/**
	 * 属性文件加载对象
	 */
	private static PropertiesLoader loader = new PropertiesLoader("properties/system-config.properties");
	
	public static String getAdminPath() {
		return loader.getProperty("adminPath");
	}
}
