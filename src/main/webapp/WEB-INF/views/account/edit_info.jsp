<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<html zh-CN>
<head>
    <title>个人信息修改</title>
    <%@ include file="/static/common/header.jsp"%>
</head>
<body>
<mutualhelp:navigation></mutualhelp:navigation>

<div class="panel panel-default">
    <div class="panel-heading">个人信息</div>
    <div class="panel-body">

        <div id="uploader" class="wu-example">
            <!--用来存放文件信息-->
            <div id="thelist" class="uploader-list"></div>
            <div class="btns">
                <div id="picker">选择文件</div>
                <button id="ctlBtn" class="btn btn-default">开始上传</button>
            </div>
        </div>
        初始

    </div>
</div>
</body>

<script type="text/javascript">
    require([ 'jquery', 'bootstrap'], function() {
        require([  'jqueryValidateMessages', 'suggest'], function() {
            require(['sys'], function() {

                });


            })
        })

    })
</script>
</html>