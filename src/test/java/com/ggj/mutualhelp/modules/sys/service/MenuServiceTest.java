package com.ggj.mutualhelp.modules.sys.service;

import java.util.ArrayList;
import java.util.List;

import lombok.extern.slf4j.Slf4j;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.ggj.mutualhelp.BaseTest;
import com.ggj.mutualhelp.modules.sys.entity.Menu;

@Slf4j
public class MenuServiceTest extends BaseTest {
	
	@Autowired
	MenuService service;
	
	@Test
	public void list() {
		List<Menu> sourceList = service.findList(new Menu());
		// display(sourceList);
		
		List<Menu> sortList = new ArrayList<Menu>();
		sortList = service.sortList(sourceList, "1", sortList);
		display(sortList);
	}
	
	private void display(List<Menu> list) {
		for (Menu menu : list) {
			log.info("" + menu);
		}
	}
	
}
