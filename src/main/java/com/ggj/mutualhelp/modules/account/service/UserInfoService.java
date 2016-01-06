package com.ggj.mutualhelp.modules.account.service;

import java.util.HashMap;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import redis.clients.jedis.Jedis;

import com.ggj.mutualhelp.common.redis.RedisDaoTemplate;
import com.ggj.mutualhelp.common.redis.callback.RedisCallback;
import com.ggj.mutualhelp.common.utils.DateUtils;
import com.ggj.mutualhelp.common.utils.IdGen;
import com.ggj.mutualhelp.common.utils.SendMailUtil;
import com.ggj.mutualhelp.modules.account.dao.UserInfoDao;
import com.ggj.mutualhelp.modules.account.entity.UserInfo;
import com.ggj.mutualhelp.modules.account.utils.UserUtils;

@Service
@Slf4j
@Transactional(readOnly = true)
public class UserInfoService {

    @Value("${checkEmailKey}")
    private String checkEmailKey;

    @Value("${verifyEmailUrl}")
    private String verifyEmailUrl;

    @Value("${chekEmailTokenKey}")
    private String chekEmailTokenKey;

    @Value("${verifyEmailTokenExpireTime}")
    private int verifyEmailTokenExpireTime;

    @Value("${hashAlgorithmName}")
    private String hashAlgorithmName;

    @Value("${hashIterations}")
    private int hashIterations;

    @Autowired
    private RedisDaoTemplate redisDao;
    @Autowired
    private UserInfoDao dao;

    @Autowired
    IdGen idGen;
    @Autowired
    SendMailUtil sendMailUtil;
    @Autowired
    UserUtils userUtils;

    @Transactional(readOnly = false)
    public void save(final UserInfo userInfo) throws Exception {
        prepareRegisterUserinfo(userInfo);
        dao.insert(userInfo);
        // 发送验证邮件
        sendVerifyEmail(userInfo, true);
    }

    /**
     * @param userInfo
     * @Description: 将密码加密后保存
     * @return:void
     */
    private void prepareRegisterUserinfo(UserInfo userInfo) {
        userInfo.preInsert();
        String salt = idGen.getSalt(userInfo.getName());
        String enyCrptPassword = new SimpleHash(hashAlgorithmName, userInfo.getPassword(), ByteSource.Util.bytes(salt), hashIterations).toHex();
        userInfo.setPassword(enyCrptPassword);
        userInfo.setSalt(salt);
        // 1是没有激活
        userInfo.setIsActive('1');
        userInfo.setRegisterDate(userInfo.getCreateDate());
    }

    /**
     * @param userInfo
     * @param isRegister 是否是第一次注册时候发送验证码
     * @Description: 发送注册验证邮件地址。
     * @return:String 返回随机码token
     */
    public void sendVerifyEmail(UserInfo userInfo, boolean isRegisterSend) {
        String token = idGen.getNextId();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("registerDate", DateUtils.getDateTime());
        map.put("verifyUrl", verifyEmailUrl + token);
        map.put("email", userInfo.getEmail());
        map.put("name", userInfo.getName());
        map.put("invalidTime", verifyEmailTokenExpireTime);
        sendMailUtil.sendFtlMail(userInfo.getEmail(), "注册邮箱验证", "template/email/register.ftl", map);
        // 存token到redis
        saveTokenToRedis(token, userInfo, isRegisterSend);
    }

    /**
     * @param token
     * @param userInfo
     * @Description:将token存入redis
     * @return:void
     */
    private void saveTokenToRedis(final String token, final UserInfo userInfo, final boolean isRegisterSend) {
        redisDao.execute(new RedisCallback<String>() {
            public String doInRedis(Jedis jedis) {
                String key = chekEmailTokenKey + token;
                jedis.set(key, userInfo.getId());
                jedis.expire(key, verifyEmailTokenExpireTime);
                // 注册帐号，防止重复注册
                if (isRegisterSend)
                    jedis.sadd(checkEmailKey, userInfo.getEmail());
                return null;
            }
        });
    }

    /**
     * @param email
     * @Description: 检验redis里面是否存在以及注册过的邮箱
     * @return:void
     */
    public boolean checkEmail(final String email) {
        return redisDao.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(Jedis jedis) {
                return jedis.sismember(checkEmailKey, email);
            }
        });
    }

    /**
     * @param token
     * @Description: 激活邮箱
     * @return:boolean
     */
    @Transactional(readOnly = false)
    public boolean verifyEmailByToken(final String token) {
        return redisDao.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(Jedis jedis) {
                String key = chekEmailTokenKey + token;
                String id = jedis.get(key);
                if (!StringUtils.isEmpty(id)) {
                    dao.activeEamil(id, '0');
                    jedis.del(key);
                    return true;
                }
                return false;
            }
        });
    }

    public UserInfo getUserInfo(String email) {
        return userUtils.getCachedUserInfo(email);
    }

    @Transactional(readOnly = false)
    public void updateImage(UserInfo userInfo, String iamge) {
        dao.updateImge(userInfo.getId(), iamge);
        userUtils.removeCachedUserInfo(userInfo.getEmail());
    }
}
