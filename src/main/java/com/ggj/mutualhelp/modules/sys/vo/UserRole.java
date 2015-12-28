package com.ggj.mutualhelp.modules.sys.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

import com.ggj.mutualhelp.common.persistence.BaseEntity;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.sys.entity.Role;

@Getter
@Setter
public class UserRole extends BaseEntity {
	private static final long serialVersionUID = 2693422935129817505L;
	private Role role;
	private List<UserInfo> userLsit;
}
