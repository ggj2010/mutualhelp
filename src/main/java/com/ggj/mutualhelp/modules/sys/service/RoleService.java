package com.ggj.mutualhelp.modules.sys.service;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.common.crud.CrudService;
import com.ggj.mutualhelp.modules.sys.dao.RoleDao;
import com.ggj.mutualhelp.modules.sys.entity.Role;

/**
 * @ClassName:RoleService.java
 * @Description:  角色  
 * @author gaoguangjin
 * @Date 2015-11-2 下午5:34:17
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends CrudService<RoleDao, Role> {
	
	@Transactional(readOnly = false)
	public void save(Role role) {
		if (!StringUtils.isEmpty(role.getId())) {
			dao.deleteRoleMenu(role);
		}
		super.save(role);
		if (!CollectionUtils.isEmpty(role.getMenuIdsList())) {
			dao.saveRoleMenu(role);
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(Role role) {
		super.delete(role);
		dao.deleteRoleMenu(role);
	}
	
}
