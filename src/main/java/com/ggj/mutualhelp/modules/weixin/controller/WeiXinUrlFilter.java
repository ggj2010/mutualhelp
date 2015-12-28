package com.ggj.mutualhelp.modules.weixin.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ggj.mutualhelp.common.utils.SpringContextHolder;
import com.ggj.mutualhelp.modules.weixin.service.BaseService;
import com.ggj.mutualhelp.modules.weixin.util.SHA1;
import com.ggj.mutualhelp.modules.weixin.util.WeiXinUtil;
import com.ggj.mutualhelp.modules.weixin.util.XmlExchangeUtil;
import com.ggj.mutualhelp.modules.weixin.vo.InputMessage;

/**
 * @ClassName:WeiXinUrlFilter.java
 * @Description:   重新搞起微信噢
 * @author gaoguangjin
 * @Date 2015-11-19 下午4:15:39
 */
@Slf4j
@Controller
public class WeiXinUrlFilter {
	@Value("${weixinToken}")
	private String weiXinToken;
	
	@RequestMapping(value = "/weixin", method = { RequestMethod.GET })
	public void check(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException, IOException {
		try {
			log.info("开始校验");
			verifyServer(req, resp);
		} catch (Exception e) {
			log.error("微信验证服务器地址的有效性失败！" + e.getLocalizedMessage());
		}
		
	}
	
	@RequestMapping(value = "/weixin", method = { RequestMethod.POST })
	public void delMessage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		OutputStream os = null;
		try {
			InputMessage inputMsg = XmlExchangeUtil.getObjectByXml(request);
			os = response.getOutputStream();
			os.write(getCallBackContent(inputMsg, response).getBytes("UTF-8"));
		} catch (Exception e) {
			log.error("微信处理信息失败！" + e.getLocalizedMessage());
		}
		finally {
			os.flush();
			os.close();
		}
	}
	
	/**
	 * @Description:  暂时不用filter方式
	 * @param req
	 * @param resp
	 * @param chain
	 * @throws IOException
	 * @throws ServletException     
	 * @return:void
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		boolean isGet = request.getMethod().toLowerCase().equals("get");
		OutputStream os = null;
		try {
			if (isGet) {
				verifyServer(request, response);
			} else {
				InputMessage inputMsg = XmlExchangeUtil.getObjectByXml(request);
				os = response.getOutputStream();
				os.write(getCallBackContent(inputMsg, resp).getBytes("UTF-8"));
			}
		} catch (Exception e) {
			log.error("微信处理信息失败！" + e.getLocalizedMessage());
		}
		finally {
			if (null != os) {
				os.flush();
				os.close();
			}
		}
	}
	
	/**
	 * @Description:  处理用户传过来的信息
	 * @param inputMsg
	 * @param resp     
	 * @return:void
	 */
	private String getCallBackContent(InputMessage inputMessage, ServletResponse resp) {
		//转换接受和发送对象
		WeiXinUtil.changeInputMessage(inputMessage);
		// 1、判断类型
		String msgType = inputMessage.getMsgType();
		BaseService service = SpringContextHolder.getBean(msgType);
		return service.deal(inputMessage);
	}
	
	/**
	 * @Description:微信绑定认证，会校验token的值，验证服务器地址的有效性
	 * @param req
	 * @param resp     
	 * @return:void
	 * @throws Exception 
	 */
	private void verifyServer(HttpServletRequest request, HttpServletResponse resp) throws Exception {
		String signature = request.getParameter("signature");// 微信加密签名
		String timestamp = request.getParameter("timestamp");// 时间戳
		String nonce = request.getParameter("nonce");// 随机数
		String echostr = request.getParameter("echostr");// 随机字符串
		
		String temp = SHA1.encode(WeiXinUtil.getCheckServerParam(timestamp, nonce, weiXinToken));
		if (temp.equals(signature)) {
			log.info(echostr);
			resp.getWriter().write(echostr);
		} else {
			log.error("微信验证验证服务器地址的有效性失败！！！");
		}
	}
	
}
