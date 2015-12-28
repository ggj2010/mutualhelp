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
<title>私人定制注册页面</title>
<meta name="keywords" content="私人定制,注册">
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
span {
	color: white
}

/**重写为了后台验证后的判断**/
.has-error {
	color: #a94442;
	border-color: #a94442;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.form-control-feedback {
	display: none
}

.has-error+.form-control-feedback {
	color: #a94442;
	display: block;
}

.nav>li>a {
	position: relative;
	padding: 10px 15px;
	display:  inline-block;
}
</style>
</head>
<body>
	<div class="container-fluent">
		<!--navbar 和颜色   navbar-fixed-top在顶部-->
		<div class="navbar navbar-inverse">
			<div class="navbar-header">
				<a class="navbar-brand " href="">私人定制注册帐号</a>
			</div>
			<div id="navbar-title" class="collapse navbar-collapse">
				<ul class="nav navbar-form navbar-right">
					<li>
						<span>我已注册，现在就</span> <a class="btn btn-default" href="${ctx}/account/login"> <strong>登陆</strong>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<form:form id="registerForm" action="${path}/account/register/save"
			method="post" modelAttribute="userInfo"
			cssClass="form-horizontal has-feedback">
			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10 has-feedback">
					<form:input path="email" cssErrorClass="form-control has-error"
						cssClass="form-control" placeholder="邮箱" />
					<form:errors path="email" cssClass="has-error" />
					<span class="glyphicon  glyphicon-remove form-control-feedback" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10 has-feedback">
					<form:input path="name" cssErrorClass="form-control has-error"
						cssClass="form-control" placeholder="用户名" />
					<form:errors path="name" cssClass="has-error" />
					<span class="glyphicon  glyphicon-remove form-control-feedback" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10 has-feedback">
					<div class="radio radio-info radio-inline">
						<input id="boy" type="radio" name="sex" value="0"
							checked="checked">
						<label for="boy">男</label>
					</div>
					<label class="radio radio-info radio-inline">
						<input id="girl" type="radio" name="sex" value="1">
						<label for="girl">女</label>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10 has-feedback">
					<form:password path="password"
						cssErrorClass="form-control has-error" cssClass="form-control"
						placeholder="密码" />
					<form:errors path="password" cssClass="has-error" />
					<span class="glyphicon  glyphicon-remove form-control-feedback" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">注册</button>
				</div>
			</div>
			<div class="form-group has-feedback">
				<div class="col-sm-offset-2 col-sm-10">
					<span class="has-error">${messages}</span>
				</div>
			</div>
	</div>
	</form:form>
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
        require([ 'jquery' ], function($) {
	        require([ 'jqueryValidateMessages', 'bootstrap','staps'], function() {
	            $(function() {
	                $.validator.setDefaults({
	                    highlight : function(element) {
	                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	                    },
	                    success : function(element) {
	                        element.closest('.form-group').removeClass('has-error').addClass('has-success');
	                        //去除后台校验错误的标签
	                        $(element).closest('.form-group').find('.has-error').removeClass('has-error');
	                    },
	                    errorElement : "span",
	                    errorClass : "help-block m-b-none",
	                    validClass : "help-block m-b-none"
	                });
	                
	                 $("#registerForm").validate({
	                	//去除onkey验证
	                	// onkeyup:false,
	                 rules:{
	                     name:"required",
	                     email:{
	                         required:true,
	                         email:true,
	                          remote:{
	                                url: "${path}/account/checkemail",
	                                type: "get",
	                                dataType: 'json',
	                                data: {
	                                    'email': function(){return $('input[name="email"]').val();}
	                                      },
	                                   }
	                     },
	                     password: {
	                         required:true,
	                         minlength:6,
	                         }
	                 },
	                 messages:{
	                     name:"请输入您的用户名" ,
	                     password:{
	                         required:"请输入您的密码",
	                         minlength:"密码不能少于6位"
	                     },
	                     email:{
	                         required:"请输入您的E-mail",
	                         remote:"该账户已被注册"
	                     }
	                  }
	               });
	            })
	        });
        });
    </script>
</html>