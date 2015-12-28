package com.ggj.mutualhelp.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.common.crud.CrudService;
import com.ggj.mutualhelp.modules.account.dao.UserInfoDao;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;

@Service
@Transactional(readOnly = true)
public class UserService extends CrudService<UserInfoDao, UserInfo> {
	
}
