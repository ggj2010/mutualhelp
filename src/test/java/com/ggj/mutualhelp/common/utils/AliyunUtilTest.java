package com.ggj.mutualhelp.common.utils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.Bucket;
import com.aliyun.oss.model.PutObjectResult;
import com.ggj.mutualhelp.BaseTest;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.ByteArrayInputStream;
import java.util.List;

import static org.junit.Assert.*;

/**
 * author:gaoguangjin
 * Description:
 * Email:335424093@qq.com
 * Date 2015/12/29 16:20
 */
@Slf4j
public class AliyunUtilTest extends BaseTest {
    @Autowired
    AliyunUtil aliyunUtil;

    @Test
    public void testGetClient() throws Exception {
        OSSClient client = aliyunUtil.getClient();
        assertNotNull(client);
    }


    @Test
    public void testListBuckets() throws Exception {
        List<Bucket> listBuckets=aliyunUtil.listBuckets();
        for (Bucket bucket : listBuckets) {
            log.info("bucket name="+bucket.getName());
        }
    }

    @Test
    public void testPutObject() throws Exception {
        String bucketName="gaoguangjins";
        String key="background_img/test";
        ByteArrayInputStream inpuStream = new ByteArrayInputStream("test".getBytes());
        PutObjectResult putObjectResult = aliyunUtil.putObject(bucketName, key, inpuStream);
        log.info("url="+putObjectResult.getETag());
    }
}