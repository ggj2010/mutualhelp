<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<a class="navbar-brand " href="">私人定制注册帐号</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="alert alert-success alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>加油!</strong> 还差一步即可完成注册.
		</div>
		<div>
			<blockquote>
				<p>
					我们已经向您的邮箱
					<u>${email}</u>
					发送了一封激活邮件，请点击邮件中的链接完成注册！
				</p>
			</blockquote>
		</div>
		<div class="page-header"></div>

		<ul class="list-group">
			<li class="list-group-item list-group-item-default">1.
				如果您没有收到激活邮件，请检查垃圾邮箱或广告邮箱目录;</li>
			<li class="list-group-item list-group-item-default">2.
				邮件到达可能需要几分钟，如果仍没有收到，点击这里 <a id="sendEmail" class="btn btn-info" >重新发送激活邮件</a></li>
			<li class="list-group-item list-group-item-default">3.
				如果一直没有收到邮件，请您使用注册邮件联系我们:335424093@qq.com</li>
		</ul>
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
		$(function(){
			$("#sendEmail").on("click",function(){
				$.post("${path}/account/sendVerifyEmail",{id:"${id}",email:"${email}",name:"${name}"},function(data){
					bootbox.alert(data);
				});
			})
		})
	});
</script>
</html>