package com.ggj.mutualhelp.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.common.crud.CrudService;
import com.ggj.mutualhelp.modules.sys.dao.UserRoleDao;
import com.ggj.mutualhelp.modules.sys.vo.UserRole;

/**
 * @ClassName:UserRoleService.java
 * @Description:用户权限service层    
 * @author gaoguangjin
 * @Date 2015-11-9 下午4:24:05
 */
@Service
@Transactional(readOnly = true)
public class UserRoleService extends CrudService<UserRoleDao, UserRole> {
	
}
