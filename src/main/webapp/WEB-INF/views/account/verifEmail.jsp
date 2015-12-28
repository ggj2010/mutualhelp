<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML>
<html zh-CN>
<head>
<meta charset="utf-8">
<title>私人定制注册验证邮箱页面</title>
<meta name="keywords" content="私人定制,注册,邮箱">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<link rel="Bookmark" href="${path}/static/image/favicon.ico">
<link rel="Shortcut Icon" href="${path}/static/image/favicon.ico">

<link type="text/css" rel="stylesheet"
	href="${path}/static/css/bootstrap-3.3.5/css/bootstrap.min.css">

</head>
<body>
	<div class="container-fluent">
		<!--navbar 和颜色   navbar-fixed-top在顶部-->
		<div class="navbar navbar-inverse">
			<div class="navbar-header">
				<a class="navbar-brand " href="">私人定制邮箱激活</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
		<c:if test="${flag==true}">
			<h2>验证成功</h2>
			<p>${message}</p>
			<p><a class="btn btn-success btn-lg" href="${ctx}/login" role="button">登陆</a></p>
		</c:if>
		<c:if test="${flag==false}">
			<h2>验证失败</h2>
			<p>${message}</p>
		</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">
	var path = "${path}"
</script>
<!-- 浏览器下载js脚本文件时候，不会启动其他下载任务，放在底部有助于页面加载速度 -->
<script type="text/javascript" src="${path}/static/js/require.js"></script>
<!-- defre js的加载不会阻塞页面的渲染和资源的加载 -->
<script type="text/javascript" src="${path}/static/js/main.js" defer
	async="true"></script>
<script type="text/javascript">
	/*js的amd写法*/
	require([ 'jquery', 'bootstrap','bootbox' ], function($,bootstrap,bootbox) {
	});
</script>
</html>