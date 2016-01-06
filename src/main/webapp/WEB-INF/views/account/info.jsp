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
				<div class="form-group">
					<label class="col-sm-2 control-label" for="image">头像</label>
					<div class="col-sm-2" >
						<div id="fileList" class="uploader-list"></div>
						<div class="file-item thumbnail" id="imageHidden">
							<img src="${userInfo.image}" class="img-circle">
						</div>
							<div id="filePicker">更换头像</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
					<a class="btn btn-default" href="javaScript:history.go(-1)">返回</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	require([ 'jquery', 'bootstrap','sweetalert'], function() {
		require([ 'webuploader'], function(WebUploader) {
			require(['sys' ], function() {

				var $list = $('#fileList'),
					// 优化retina, 在retina下这个值是2
						ratio = window.devicePixelRatio || 1,
					// 缩略图大小
						thumbnailWidth = 100 * ratio,
						thumbnailHeight = 100 * ratio,
						state = 'pending',
					// Web Uploader实例
						uploader;

				// 初始化Web Uploader
				uploader = WebUploader.create({
					// 自动上传。
					auto: true,
					// 文件接收服务端。
					server: '${path}/web/account/info/uploadimg',
					// 选择文件的按钮。可选。
					pick: '#filePicker',
				 fileSingleSizeLimit: 1 * 1024 * 1024 ,   // 1 M
					fileNumLimit: 1,
					// 只允许选择文件，可选。
					accept: {
						title: 'Images',
						extensions: 'gif,jpg,jpeg,bmp,png',
						mimeTypes: 'image/!*'
					}

				});


				// 当有文件添加进来的时候
				uploader.on( 'fileQueued', function( file ) {
					var $li = $('<div id="' + file.id + '" class="file-item thumbnail">' + '<img class="img-circle"></div>'
							),
							$img = $li.find('img');
					$list.append( $li );

					// 创建缩略图
					uploader.makeThumb( file, function( error, src ) {
						if ( error ) {
							$img.replaceWith('<span>不能预览</span>');
							return;
						}
						$img.attr( 'src', src );
					}, thumbnailWidth, thumbnailHeight );

					$("#filePicker").on("click",function(){
						uploader.removeFile( file );
						$("#"+file.id).remove();
					})
				});

				// 文件上传成功，给item添加成功class, 用样式标记上传成功。
				uploader.on( 'uploadSuccess', function( file ,data) {
					var result= $.parseJSON(data._raw);
					if(result.success){
						$("#imageHidden").hide();
						swal(result.message);
					}else{
						sweetAlert('错误','网络异常，请稍候再试','error');
					}
				});

				uploader.onError = function( code ) {
					sweetAlert('错误','请上传正确格式的图片','error');
				};
			})
	})
	
	})
</script>
</html>