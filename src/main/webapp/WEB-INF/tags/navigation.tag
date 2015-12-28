<%@ tag pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<header id="header" style="display:none">
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar-title"
				aria-expanded="false">
				<span class="icon-bar"></span><span class="icon-bar"></span><span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand " href="">私人定制</a>
		</div>
		<!-- title名称不能修改 -->
		<div id="navbar-title" class="collapse navbar-collapse">
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="寻找你需要的服务">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="${ctx}/account/login" class="btn"> <span><strong>登陆</strong></span></a>
				</li>
				<li>
					<a href="${path}/account/register" class="btn"> <span><strong>注册</strong></span></a>
				</li>
			</ul>
		</div>
	</div>
</header>