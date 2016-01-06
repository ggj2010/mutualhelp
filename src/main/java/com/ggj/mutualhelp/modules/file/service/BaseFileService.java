package com.ggj.mutualhelp.modules.file.service;

import java.io.File;

/**
 * author:gaoguangjin
 * Description:文件处理父类
 * Email:335424093@qq.com
 * Date 2015/12/29 16:04
 */
public interface BaseFileService {
    int upload(File file);
    int download(String url);
}
