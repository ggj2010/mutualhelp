package com.ggj.mutualhelp.common.shiro.authc;

import java.util.HashSet;
import java.util.Set;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ggj.mutualhelp.common.security.useraccount.UserSecurity;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.account.service.UserInfoService;

@Service
@Slf4j
public class SystemAuthorizingRealm extends AuthorizingRealm {
	@Autowired
	public UserSecurity userSecurity;
	
	@Autowired
	public UserInfoService userInfoService;
	
	@Value("${accountLockedError}")
	private String accountLockedError;
	@Value("${accountNotExistError}")
	private String accountNotExistError;
	@Value("${accountEmailNullError}")
	private String accountEmailNullError;
	
	// [2]授权(Authorization) 这个是显示调用的，当我们调用具体的hasRole()才会调用这个
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		log.info("" + principals);
		// 认证成功之后就进行授权
		Principal principal = (Principal) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		
		/********常规的这一步是从根据用户名 从数据库查询出来对应的角色和权限 然后放到simpleAuthorizeation里面*******/
		// 自定义两个角色student teacher
		Set<String> roleSet = new HashSet<String>();
		roleSet.add("student");
		roleSet.add("teacher");
		sai.setRoles(roleSet);
		
		Set<String> permissionsSet = new HashSet<String>();
		permissionsSet.add("student:find");
		// restful风格（GET=read, POST=create,PUT=update,DELETE=delete,HEAD=read,TRACE=read,OPTIONS=read, MKCOL=create
		permissionsSet.add("student:read");
		
		// permissionsSet.add("student:create");
		// permissionsSet.add("student:update");
		// permissionsSet.add("student:delete");
		permissionsSet.add("teacher:insert");
		permissionsSet.add("teacher:update");
		permissionsSet.add("teacher:delete");
		
		permissionsSet.add("sys:dict:view");
		permissionsSet.add("sys:dict:edit");
		permissionsSet.add("sys:menu:view");
		permissionsSet.add("sys:menu:edit");
		permissionsSet.add("sys:role:view");
		permissionsSet.add("sys:role:edit");
		permissionsSet.add("sys:user:list");
		permissionsSet.add("sys:user:edit");
		sai.setStringPermissions(permissionsSet);
		sai.addStringPermission("user");
		log.info("授权成功");
		return sai;
	}
	
	// [1]认证(authentication) 我们认证时候获取的密码应该是加密之后的密码。
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String email = (String) token.getPrincipal();
		// 防止注入检查
		if (StringUtils.isEmpty(email))
			throw new AuthenticationException(accountEmailNullError);
		
		// 监测账户是否锁定
		if (userSecurity.checkAccountIsLocked(email))
			throw new AuthenticationException(accountLockedError);
		
		UserInfo userinfo = userInfoService.getUserInfo(email);
		if (userinfo == null)
			throw new AuthenticationException(accountNotExistError);
		return new SimpleAuthenticationInfo(new Principal(email, userinfo), userinfo.getPassword(), ByteSource.Util.bytes(userinfo.getSalt()),
				getName());
	}
	
	/**
	 * @Description:  更换用户权限
	 * @return:void
	 */
	public void changePermission() {
		Subject subject = SecurityUtils.getSubject();
		PrincipalCollection principal = subject.getPrincipals();
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		// info.addStringPermission("user");
		cache.put(principal, info);
	}
}
