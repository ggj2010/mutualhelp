<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML>
<html zh-CN>
<head>
<meta charset="utf-8">
<title>私人定制-主界面</title>
<meta name="keywords" content="私人定制,用户后台">
<meta name="description" content="私人定制，定制你的个性服务！">

<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<link rel="Bookmark" href="${path}/static/image/favicon.ico">
<link rel="Shortcut Icon" href="${path}/static/image/favicon.ico">

<!--[if lt IE 8]>
    <script>
        alert('私人定制已不支持IE6-8，请使用谷歌、火狐等浏览器\n或360、QQ等国产浏览器的极速模式浏览本页面！');
    </script>
    <![endif]-->

<!-- rtlbootstrap -->

<link type="text/css" rel="stylesheet"
	href="${path}/static/css/bootstrap-3.3.5/css/bootstrap.min.css">
<!--字体  -->
<link type="text/css"
	href="${path}/static/css/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!--动画库 animated bounceOutUp shake  -->
<link type="text/css"
	href="${path}/static/css/plugins/animate/animate.min.css"
	rel="stylesheet">
<!-- layer弹出框css -->
<link type="text/css"
	href="${path}/static/js/lib/plugins/layer/skin/layer.css"
	rel="stylesheet">
	
<!-- pace css/pace-theme-flash.css/pace-theme-corner-indicator.css/pace-theme-big-counter.css/pace-theme-minimal.css -->
<link type="text/css"
	href="${path}/static/css/plugins/pace/themes/pace-theme-flash.css"
	rel="stylesheet">

<link type="text/css" href="${path}/static/css/style.css"
	rel="stylesheet">
	

</head>
<body class="fixed-sidebar full-height-layout gray-bg">

	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle"
									src="${path}/static/image/profile_small.jpg" /></span> <a
								data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="clear"> <span class="block m-t-xs"><strong
										class="font-bold">${userName}</strong></span> <span
									class="text-muted text-xs block">个人信息<b class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li>
									<a class="J_menuItem" href="form_avatar.html">修改头像</a>
								</li>
								<li>
									<a class="J_menuItem" href="profile.html">个人资料</a>
								</li>
								<li>
									<a class="J_menuItem" href="contacts.html">联系我们</a>
								</li>
								<li>
									<a class="J_menuItem" href="mailbox.html">信箱</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="${path}/web/logout">安全退出</a>
								</li>
							</ul>
						</div>
						<div class="logo-element">SRDZ</div>
					</li>
					<li>
						<a href="#"> <i class="fa fa-home"></i> <span
							class="nav-label">主页</span> <span class="fa arrow"></span>
						</a>
						<ul class="nav nav-second-level">
							<li>
								<a class="J_menuItem" href="${path}/timeline.html">开发时间轴</a>
							</li>
							<li>
								<a class="J_menuItem" href="${path}/web/sys/dict/">数据字典</a>
							</li>
								<li>
								<a href="#">系统设置
								<span class="fa arrow"></span></a>
									<ul class="nav  nav-third-level collapse">
										<li> <a class="J_menuItem" href="${path}/web/sys/dict">数据字典</a></li>
										<li> <a class="J_menuItem" href="${path}/web/sys/menu">菜单设置</a></li>
										<li> <a class="J_menuItem" href="${path}/web/sys/role">角色设置</a></li>
									</ul>
							</li>
							<li>
								<a class="J_menuItem" href="index_v4.html">主页示例四</a>
							</li>
							<li>
								<a  href="index_v5.html" target="_blank">主页示例五</a>
							</li>
						</ul>

					</li>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->

		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<form role="search" class="navbar-form-custom" method="post"
							action="${path}/">
							<div class="form-group">
								<input type="text" placeholder="请输入您需要查找的内容 …"
									class="form-control" name="top-search" id="top-search">
							</div>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown">
							<a class="dropdown-toggle count-info" data-toggle="dropdown"
								href="#"> <i class="fa fa-envelope"></i> <span
								class="label label-warning">16</span>
							</a>
							<ul class="dropdown-menu dropdown-messages">
								<li class="m-t-xs">
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
												class="img-circle" src="${path}/static/image/a7.jpg">
										</a>
										<div class="media-body">
											<small class="pull-right">46小时前</small>
											<strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？ <br>
											<small class="text-muted">3天前 2014.11.8</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
												class="img-circle" src="${path}/static/image/a4.jpg">
										</a>
										<div class="media-body ">
											<small class="pull-right text-navy">25小时前</small>
											<strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶 <br>
											<small class="text-muted">昨天</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="mailbox.html"> <i
											class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
										</a>
									</div>
								</li>
							</ul>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle count-info" data-toggle="dropdown"
								href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">8</span>
							</a>
							<ul class="dropdown-menu dropdown-alerts">
								<li>
									<a href="mailbox.html">
										<div>
											<i class="fa fa-envelope fa-fw"></i> 您有16条未读消息 <span
												class="pull-right text-muted small">4分钟前</span>
										</div>
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="profile.html">
										<div>
											<i class="fa fa-qq fa-fw"></i> 3条新回复 <span
												class="pull-right text-muted small">12分钟钱</span>
										</div>
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a class="J_menuItem" href="notifications.html"> <strong>查看所有
										</strong> <i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul>
						</li>
						
						<li class="dropdown">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i>
                            </a>
                        </li>
						
						<li>
                                <a href="${path}/web/logout"> <i class="fa fa-sign-out"></i> 退出 </a>
                            </li>
					</ul>
				</nav>
			</div>
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:;" class="active J_menuTab"
							data-id="${path}/timeline.html">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<button class="roll-nav roll-right dropdown J_tabClose">
					<span class="dropdown-toggle" data-toggle="dropdown">关闭操作<span
						class="caret"></span></span>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive">
							<a>定位当前选项卡</a>
						</li>
						<li class="divider"></li>
						<li class="J_tabCloseAll">
							<a>关闭全部选项卡</a>
						</li>
						<li class="J_tabCloseOther">
							<a>关闭其他选项卡</a>
						</li>
					</ul>
				</button>
				<a href="login.html" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="${path}/timeline.html" frameborder="0" data-id="${path}/timeline.html" seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">
					<strong>Copyright</strong> 私人定制 © 2015 <a href="http://www.ggjlovezjy.com:1314/forever" target="_blank">ggj</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->

		
		<div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active"><a data-toggle="tab" href="#tab-1">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-2">
                        项目进度
                    </a>
                    </li>
                    <li class="">
                        <a data-toggle="tab" href="#tab-3">
                            <i class="fa fa-gear"></i>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a1.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a1.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">

                                        据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a2.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        写的好！与您分享
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a8.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a8.jpg">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a7.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a3.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a3.jpg">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        最近在补追此剧，特别喜欢这段表白。
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="img/a4.jpg" tppabs="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                    </div>
                                    <div class="media-body">
                                        我发起了一个投票 【你认为下午大盘会翻红吗？】
                                        <br>
                                        <small class="text-muted">星期一 8:37</small>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>

                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>市场调研</h4> 按要求接收教材；

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:

                                    <div class="small">已完成： 22%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>

                        </ul>

                    </div>

                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3><i class="fa fa-gears"></i> 设置</h3>
                        </div>

                        <div class="setings-item">
                            <span>
                        显示通知
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example">
                                    <label class="onoffswitch-label" for="example">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        隐藏聊天窗口
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" checked class="onoffswitch-checkbox" id="example2">
                                    <label class="onoffswitch-label" for="example2">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        清空历史记录
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example3">
                                    <label class="onoffswitch-label" for="example3">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        显示聊天窗口
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example4">
                                    <label class="onoffswitch-label" for="example4">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        显示在线用户
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example5">
                                    <label class="onoffswitch-label" for="example5">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        全局搜索
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" checked name="collapsemenu" class="onoffswitch-checkbox" id="example6">
                                    <label class="onoffswitch-label" for="example6">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>
                        每日更新
                    </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="example7">
                                    <label class="onoffswitch-label" for="example7">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-content">
                            <h4>设置</h4>
                            <div class="small">
                                你可以从这里设置一些常用选项，当然啦，这个只是个演示的示例。
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
		


		<div class="theme-config">
			<div class="theme-config-box">
				<div class="spin-icon">
					<i class="fa fa-cog fa-spin"></i>
				</div>
				<div class="skin-setttings">
					<div class="title">主题设置</div>
					<div class="setings-item">
						<span> 收起左侧菜单 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="collapsemenu"
									class="onoffswitch-checkbox" id="collapsemenu">
								<label class="onoffswitch-label" for="collapsemenu">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="setings-item">
						<span> 固定侧边栏 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="fixedsidebar"
									class="onoffswitch-checkbox" id="fixedsidebar">
								<label class="onoffswitch-label" for="fixedsidebar">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="setings-item">
						<span> 固定顶部 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="fixednavbar"
									class="onoffswitch-checkbox" id="fixednavbar">
								<label class="onoffswitch-label" for="fixednavbar">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="setings-item">
						<span> 固定宽度 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="boxedlayout"
									class="onoffswitch-checkbox" id="boxedlayout">
								<label class="onoffswitch-label" for="boxedlayout">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="setings-item">
						<span> 固定底部 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="fixedfooter"
									class="onoffswitch-checkbox" id="fixedfooter">
								<label class="onoffswitch-label" for="fixedfooter">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="setings-item">
						<span> RTL模式 </span>

						<div class="switch">
							<div class="onoffswitch">
								<input type="checkbox" name="RTLmode"
									class="onoffswitch-checkbox" id="RTLmode">
								<label class="onoffswitch-label" for="RTLmode">
									<span class="onoffswitch-inner"></span> <span
										class="onoffswitch-switch"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="title">皮肤选择</div>
					<div class="setings-item default-skin">
						<span class="skin-name "> <a href="#" class="s-skin-0">
								默认皮肤 </a>
						</span>
					</div>
					<div class="setings-item blue-skin">
						<span class="skin-name "> <a href="#" class="s-skin-1">
								蓝色主题 </a>
						</span>
					</div>
					<div class="setings-item yellow-skin">
						<span class="skin-name "> <a href="#" class="s-skin-3">
								黄色/紫色主题 </a>
						</span>
					</div>
					<div class="setings-item ultra-skin">
						<span class="skin-name "> <a href="#" class="s-skin-2">
								灰色主题 </a>
						</span>
					</div>
				</div>
			</div>
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

require([ 'jquery' ], function($) {
		require([ 'bootstrap', 'contabs', 'metisMenus','layer','Pace','slimscroll'], function() {
			require([ 'base' ], function() {
				$(function() {
					//layer.alert('酷毙了', {icon: 1});
					
					Pace.start({
					/* 	ajax: false, 
					    document: false,
					    elements: false */
					   /*  elements: {
						    selectors: ['.setings-item']
						  } */
					  });
					
					
					});
				 });
		});
	}); 
	


</script>
</html>