package com.ggj.mutualhelp.common.shiro.authc;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.ggj.mutualhelp.common.redis.RedisDaoTemplate;
import com.ggj.mutualhelp.common.security.useraccount.UserSecurity;

public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher {
	@Autowired
	UserSecurity userSecurity;
	
	@Autowired
	private RedisDaoTemplate redisDao;
	
	// 账户锁定key
	@Value("${pwdWrongLockedUserKey}")
	private String pwdWrongLockedUserKey;
	
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
		final String email = (String) token.getPrincipal();
		// 检查密码是否匹配
		boolean matches = super.doCredentialsMatch(token, info);
		// 处理密码错误次数
		userSecurity.checkLoginErrorTimes(email, matches);
		return matches;
	}
}
