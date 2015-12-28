<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<html zh-CN>
<head>
<title>个人信息</title>
<%@ include file="/static/common/header.jsp"%>
</head>
<body>
	<mutualhelp:navigation></mutualhelp:navigation>
	<div class="panel panel-default">
		<div class="panel-heading">个人信息</div>
		<div class="panel-body">
			<form:form id="entityForm" modelAttribute="userInfo"
				action="${ctx}/account/info/save" method="post"
				cssClass="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label" for="type">邮箱号</label>
					<div class="col-sm-8" >
						<form:input path="email" cssClass="form-control required" id="type" maxlength="255"/>
						 <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="name">名称</label>
					<div class="col-sm-8">
						<form:input path="name" cssClass="form-control required" id="name" maxlength="255"/>
						 <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="value">键值</label>
					<div class="col-sm-8">
						<form:input path="value" cssClass="form-control required" id="value" maxlength="255"/>
						 <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="sort">排序</label>
					<div class="col-sm-8">
						<form:input path="sort" cssClass="form-control  number" id="sort" maxlength="10"/>
						 <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="description">描述</label>
					<div class="col-sm-8">
						<form:textarea path="description" cssClass="form-control" maxlength="255"
							id="description" rows="3" />
							 <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-info" type="submit">保存</button>
					<a class="btn btn-default" href="javaScript:history.go(-1)">返回</a>
					</div>
				</div>
				<form:errors path="*" cssClass="alert-danger"></form:errors>
			</form:form>
		</div>
	</div>
</body>

<script type="text/javascript">
	require([ 'jquery', 'bootstrap'], function() {
		require([  'jqueryValidateMessages'], function() {
			require(['sys' ], function() {
				$("#entityForm").validate();
			})
	})
	
	})
</script>
</html>