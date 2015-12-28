<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/static/common/taglibs.jsp"%>
<html zh-CN>
<head>
<title>树选择</title>
<%@ include file="/static/common/header.jsp"%>
</head>
<body>
	<ul  class="ztree" id="treeId">
	</ul>
</body>

<script type="text/javascript">
	require([ 'jquery', 'bootstrap','jquerytree'], function($) {
		var setting = {
				callback : {
					onDblClick: function(){
						parent.window.setValue();
					}
				},
				check:{
						nocheckInherit: true,
						enable:${checked}
					},
				data : {
					simpleData : {
						enable : true,
						idKey : "id",
						pIdKey : "pId"
					}
				}
			};
		$(function() {
			$.get("${ctx}${url}?t="+ new Date().getTime()+"&extId=${extId}", function(zNodes){
				var treeObj= $.fn.zTree.init($("#treeId"), setting, zNodes);
				 var node = treeObj.getNodeByParam("id", "${selectIds}");
				if(!${checked}){
					 treeObj.selectNode(node,true,true);
				}else{
					 treeObj.checkNode(node,true);
				}
				
			})
		})
	
		
		
		
		
	})
</script>
</html>