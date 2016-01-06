<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fns" uri="/WEB-INF/tld/fns.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}${fns:getAdminPath()}"/>
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
<!-- sweetalert -->	
<link type="text/css"
	href="${path}/static/css/plugins/sweetalert/sweetalert.css"
	rel="stylesheet">	
	
<!-- pace css/pace-theme-flash.css/pace-theme-corner-indicator.css/pace-theme-big-counter.css/pace-theme-minimal.css -->
<link type="text/css"
	href="${path}/static/css/plugins/pace/themes/pace-theme-flash.css"
	rel="stylesheet">

<link type="text/css" href="${path}/static/css/style.css"
	rel="stylesheet">
	

</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
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
                                <li><a class="J_menuItem" href="${path}/web/account/info">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="${path}/web/account/info">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${path}/web/logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">SRDZ
                        </div>
                    </li>
                    <li>
                        <a href="">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                            <span class="fa arrow"></span>
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
								<a href="#">机构用户
								<span class="fa arrow"></span></a>
									<ul class="nav  nav-third-level collapse">
										<li> <a class="J_menuItem" href="${path}/web/sys/user">用户管理</a></li>
									</ul>
							</li>
                            <li>
                                <a href="${path}/timeline.html" target="_blank">主页示例五</a>
                            </li>
                        </ul>

                    </li>
                    <li>
                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layouts.html"><i class="fa fa-columns"></i> <span class="nav-label">布局</span></a>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#">
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">统计图表</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_echarts.html">百度ECharts</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_flot.html">Flot</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_morris.html">Morris.js</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_rickshaw.html">Rickshaw</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_peity.html">Peity</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_sparkline.html">Sparkline</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/graph_metrics.html">图表组合</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/mailbox.html"><i class="fa fa-envelope"></i> <span class="nav-label">信箱 </span><span class="label label-warning pull-right">16</span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mailbox.html">收件箱</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mail_detail.html">查看邮件</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mail_compose.html">写信</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-edit"></i> <span class="nav-label">表单</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_basic.html">基本表单</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_validate.html">表单验证</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_advanced.html">高级插件</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_wizard.html">表单向导</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">文件上传 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_webuploader.html">百度WebUploader</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_file_upload.html">DropzoneJS</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_avatar.html">头像裁剪上传</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">编辑器 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_editors.html">富文本编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_simditor.html">simditor</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_markdown.html">MarkDown编辑器</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/code_editor.html">代码编辑器</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/suggest.html">搜索自动补全</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layerdate.html">日期选择器layerDate</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-desktop"></i> <span class="nav-label">页面</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/contacts.html">联系人</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/profile.html">个人资料</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">项目管理 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/projects.html">项目</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/project_detail.html">项目详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/teams_board.html">团队管理</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/social_feed.html">信息流</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/clients.html">客户管理</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/file_manager.html">文件管理器</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/calendar.html">日历</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">博客 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/blog.html">文章列表</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/article.html">文章详情</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">时间轴 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/timeline.html">时间轴</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/timeline_v2.html">时间轴v2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/pin_board.html">标签墙</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">单据 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/invoice.html">单据</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/invoice_print.html">单据打印</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/search_results.html">搜索结果</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/forum_main.html">论坛</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">即时通讯 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/chat_view.html">聊天窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/webim.html">layIM</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">登录注册相关 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a href="http://www.zi-han.net/theme/hplus/login.html" target="_blank">登录页面</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/login_v2.html" target="_blank">登录页面v2</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/register.html" target="_blank">注册页面</a>
                                    </li>
                                    <li><a href="http://www.zi-han.net/theme/hplus/lockscreen.html" target="_blank">登录超时</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/404.html">404页面</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/500.html">500页面</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/empty_page.html">空白页</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-flask"></i> <span class="nav-label">UI元素</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/typography.html">排版</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">字体图标 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/fontawesome.html">Font Awesome</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/glyphicons.html">Glyphicon</a>
                                    </li>
                                    <li>
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/iconfont.html">阿里巴巴矢量图标库</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">拖动排序 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/draggable_panels.html">拖动面板</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/agile_board.html">任务清单</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/buttons.html">按钮</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/tabs_panels.html">选项卡 &amp; 面板</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/notifications.html">通知 &amp; 提示</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/badges_labels.html">徽章，标签，进度条</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/grid_options.html">栅格</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/plyr.html">视频、音频</a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">弹框插件 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layer.html">Web弹层组件layer</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/modal_window.html">模态窗口</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/sweetalert.html">SweetAlert</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">树形视图 <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/jstree.html">jsTree</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/tree_view.html">Bootstrap Tree View</a>
                                    </li>
                                    <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/nestable_list.html">nestable</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/toastr_notifications.html">Toastr通知</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/diff.html">文本对比</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/spinners.html">加载动画</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/widgets.html">小部件</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-table"></i> <span class="nav-label">表格</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_basic.html">基本表格</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_data_tables.html">DataTables</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_jqgrid.html">jqGrid</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_foo_table.html">Foo Tables</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/table_bootstrap.html">Bootstrap Table
                                <span class="label label-danger pull-right">推荐</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/basic_gallery.html">基本图库</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/carousel.html">图片切换</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/layerphotos.html">layer相册</a>
                            </li>
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/blueimp.html">Blueimp相册</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/css_animation.html"><i class="fa fa-magic"></i> <span class="nav-label">CSS动画</span></a>
                    </li>
                    <li>
                        <a href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-cutlery"></i> <span class="nav-label">工具 </span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li><a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/form_builder.html">表单构建器</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="http://www.zi-han.net/theme/hplus/#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="http://www.zi-han.net/theme/hplus/#">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a href="http://www.zi-han.net/theme/hplus/profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="http://www.zi-han.net/theme/hplus/img/a7.jpg">
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>小四</strong> 这个在日本投降书上签字的军官，建国后一定是个不小的干部吧？
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="http://www.zi-han.net/theme/hplus/profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>国民岳父</strong> 如何看待“男子不满自己爱犬被称为狗，刺伤路人”？——这人比犬还凶
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/mailbox.html">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="http://www.zi-han.net/theme/hplus/#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="http://www.zi-han.net/theme/hplus/mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="http://www.zi-han.net/theme/hplus/profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="http://www.zi-han.net/theme/hplus/notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="http://www.zi-han.net/theme/hplus/index_v1.html" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i> 购买</a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="http://www.zi-han.net/theme/hplus/javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${path}/web/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${path}/timeline.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right"><strong>Copyright</strong> 私人定制 © 2015 <a href="http://www.ggjlovezjy.com:1314/forever" target="_blank">ggj</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="http://www.zi-han.net/theme/hplus/#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                       			 固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="http://www.zi-han.net/theme/hplus/#" class="s-skin-0">
                           	  默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="http://www.zi-han.net/theme/hplus/#" class="s-skin-1">
                          	  蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="http://www.zi-han.net/theme/hplus/#" class="s-skin-3">
                           	 黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a1.jpg">

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
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a2.jpg">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a3.jpg">

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
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a4.jpg">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="#">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a7.jpg">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a3.jpg">

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
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="http://www.zi-han.net/theme/hplus/img/a4.jpg">
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
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-cube"></i> 最新任务</h3>
                            <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">
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
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>可行性报告研究报上级批准 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司

                                    <div class="small">已完成： 14%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 14%;" class="progress-bar progress-bar-info"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <span class="label label-primary pull-right">NEW</span>
                                    <h4>设计阶段</h4>
                                    <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                                    项目进度报告(Project Progress Report)
                                    <div class="small">已完成： 22%</div>
                                    <div class="small text-muted m-t-xs">项目截止： 4:00 - 2015.10.01</div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">
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
                                <a href="http://www.zi-han.net/theme/hplus/#">
                                    <div class="small pull-right m-t-xs">9小时以后</div>
                                    <h4>建设阶段 </h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的 开发进度作出一个合理的比对

                                    <div class="small">已完成： 48%</div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="http://www.zi-han.net/theme/hplus/#">
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
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->  
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
		require([ 'bootstrap', 'sweetalert','contabs', 'metisMenus','layer','Pace','slimscroll'], function() {
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