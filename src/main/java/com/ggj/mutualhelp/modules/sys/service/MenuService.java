package com.ggj.mutualhelp.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.common.crud.CrudService;
import com.ggj.mutualhelp.modules.sys.dao.MenuDao;
import com.ggj.mutualhelp.modules.sys.entity.Menu;

@Service
@Transactional(readOnly = true)
public class MenuService extends CrudService<MenuDao, Menu> {
	
	public List<Menu> sortList(List<Menu> sourceList, String parentId, List<Menu> sortList) {
		for (Menu menu : sourceList) {
			if (menu != null && menu.getParentId().equals(parentId)) {
				sortList.add(menu);
				// 是否含有子节点
				for (Menu menuChild : sourceList) {
					if (menuChild != null && menuChild.getParentId().equals(menu.getId())) {
						sortList(sourceList, menu.getId(), sortList);
						break;
					}
				}
			}
		}
		return sortList;
	}
}
