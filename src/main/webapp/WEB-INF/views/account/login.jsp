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
<title>私人定制登陆</title>
<meta name="keywords" content="私人定制,登陆">
<meta name="description" content="网站描述，字数尽量空制在80个汉字，160个字符以内！">

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<link rel="Bookmark" href="${path}/static/image/favicon.ico">
<link rel="Shortcut Icon" href="${path}/static/image/favicon.ico">

<link type="text/css" rel="stylesheet"
	href="${path}/static/css/bootstrap-3.3.5/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${path}/static/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css">
<style>
body {
	background-color: rgba(0, 0, 0, 0.8);
}

.navbar-inverse .navbar-nav>li>a:hover,.navbar-inverse .navbar-nav>li>a:focus
	{
	color: #fff;
	/*背景透明*/
	background-color: rgba(0, 0, 0, 0.2)
}

#navbar-title a {
	padding-left: 20px;
	padding-right: 40px;
}

.login {
	background: rgba(255, 255, 255, .2);
	color: #ccc;
	padding: 30px;
	border: 1px solid rgba(255, 255, 255, .3);
	box-shadow: 0 3px 0 rgba(12, 12, 12, .03);
	border-radius: 3px;
	margin: 0 25px;
}

.login-padding {
	margin: 10% auto 0;
}

a:hover {
	color: grey;
	text-decoration: none;
}

.footer-text {
	padding: 15px
}
</style>


</head>
<body>
	<header class="header">
		<!--navbar 和颜色   navbar-fixed-top在顶部-->
		<div class="navbar navbar-inverse ">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-title"
					aria-expanded="false">
					<span class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand " href="">私人定制注册帐号</a>
			</div>
			<div id="navbar-title" class="navbar-collapse collapse in">
				<ul class="nav  navbar-nav navbar-right">
					<li>
						<a href="${ctx}/account/login"> <span><strong>登陆</strong></span></a>
					</li>
					<li>
						<a href="${path}/account/register"> <span><strong>注册</strong></span></a>
					</li>
				</ul>
			</div>
		</div>
	</header>

	<div class="container login-padding">
		<div class="row">
			<div class="col-sm-4 login">
				<form id="loginForm" action="${ctx}/account/login" class="form-horizontal" method="post">
					<div class="form-group ">
						<div class="input-group">
							<span class="input-group-addon "> <span
								class="glyphicon glyphicon-user"></span>
							</span>
							<input type="email" class="form-control" name="email" placeholder="email">
							  <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"> <span
								class="glyphicon glyphicon-lock"></span>
							</span>
							<input type="password" class="form-control" name="password" placeholder="passwod">
							  <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox checkbox-info checkbox-circle col-xs-6 ">
							<input id="rememberMe" type="checkbox" name="rememberMe">
							<label for="rememberMe">自动登陆</label>
						</div>
						<label class="col-xs-5 control-label">
							<a href="#"><span>忘记密码了？</span></a>
						</label>
					</div>

					<div class="form-group">
						<button type="submit" id="loginButton"
							class="btn btn-primary btn-lg btn-block"
							data-loading-text="登录中...." autocomplete="off" >登陆</button>
					</div>
					
					<c:if test="${message!=null}">
					<div class="form-group">
						<div class="alert alert-warning alert-dismissible" role="alert" id="errorMessage">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong>${message}</strong> 
						</div>
					</div>
					</c:if>
				</form>
			</div>
			<div class="col-sm-1 hidden-xs"></div>
			<div class="col-sm-6 hidden-xs">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h5>私人定制</h5>
					</div>
					<div class="panel-body">
						<blockquote class="blockquote-reverse">
							<p>做人如果没有梦想,咁同条咸鱼有什么区别呢</p>
							<footer>
								《少林足球》
								<cite title="Source Title">周星驰</cite>
							</footer>
						</blockquote>
					</div>
				</div>
			</div>
		</div>
		<div class="page-header"></div>
		<p class="bg-success footer-text">© 2015 All Rights Reserved. 私人定制</p>
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
	require([ 'jquery', 'jqueryValidateMessages', 'bootstrap' ],
			function() {
				$(function() {
					 $.validator.setDefaults({
		                    highlight : function(element) {
		                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error').addClass('has-feedback');
		                     	$(element).parent('.input-group').children('span').last().addClass('glyphicon-remove').removeClass('glyphicon-ok');
		                    },
		                   
		                    success : function(element) {
		                    	 $(element).closest('.form-group').removeClass('has-error').addClass('has-success').addClass('has-feedback');
		                        $(element).closest('span').next('span').removeClass('glyphicon-remove').addClass('glyphicon-ok');
		                  
		                    	$("#errorMessage").alert('close');
		                    },
		                    errorElement : "span",
		                    errorClass : "control-label",
		                    validClass : "m-b-none"
		                });
		                
					   $("#loginForm").validate({
							submitHandler: function(form){
								$('#loginButton').button('loading');
								form.submit();
							},
						   rules:{
							   email:{
								   required:true,
								   email:true
							   },
							   password:{
								   required:true,
								   minlength:6
							   }
						   },
					   messages:{
						   email:{
							   required:"登陆帐号不能为空"
						   },
						   password:{
							   required:"密码不能为空",
							   minlength:"密码长度不能少于6位"
						   }
					   }
					   
					   })
				})
			});
</script>
</html>