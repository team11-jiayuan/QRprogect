<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<base href="<%=basePath%>" />
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<title>我的出租</title>
		<style type="text/css">
			/**导航栏样式**/
			span.nav{
				display: block;
				font-size: 18px;
				padding-bottom: 2px;
			}
			.nav_border{
				border-bottom: #0282d3 2px solid;
			}
			/**导航链接访问后边框样式**/
			span.visited{
				border-bottom: #0282d3 2px solid;
			}
			/**导航链接默认样式**/
			a.nav{
				text-decoration: none;
				color: #333;
			}
			/**导航链接鼠标移入时样式**/
			a.nav:hover {
				color: #0282d3;
			}
			/**导航链接访问后样式**/
			a.visited{
				color: #0282d3;
			}
			/**iframe样式**/
			.myiframe{
				border-width: 0px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#link1").mouseover(function(){
					$("#span1").addClass("nav_border");
				});
				$("#link1").mouseout(function(){
					$("#span1").removeClass("nav_border");
				});
				$("#link2").mouseover(function(){
					$("#span2").addClass("nav_border");
				});
				$("#link2").mouseout(function(){
					$("#span2").removeClass("nav_border");
				});
				$("#link3").mouseover(function(){
					$("#span3").addClass("nav_border");
				});
				$("#link3").mouseout(function(){
					$("#span3").removeClass("nav_border");
				});
				/**导航栏鼠标点击后样式**/
				$("#link1").click(function(){
					//移除已访问的超链接样式
					$("#link2").removeClass("visited");
					$("#link3").removeClass("visited");
					//移除已访问的超链接边框样式
					$("#span2").removeClass("nav_border");
					$("#span2").removeClass("visited");
					$("#span3").removeClass("nav_border");
					$("#span3").removeClass("visited");
					//添加超链接已访问的边框样式
					$("#link1").addClass("visited");
					//添加超链接已访问样式
					$("#span1").addClass("visited");
				});
				/**导航栏鼠标点击后样式**/
				$("#link2").click(function(){
					//移除已访问的超链接样式
					$("#link1").removeClass("visited");
					$("#link3").removeClass("visited");
					//移除已访问的超链接边框样式
					$("#span1").removeClass("nav_border");
					$("#span1").removeClass("visited");
					$("#span3").removeClass("nav_border");
					$("#span3").removeClass("visited");
					//添加超链接已访问的边框样式
					$("#link2").addClass("visited");
					//添加超链接已访问样式
					$("#span2").addClass("visited");
				});
				/**导航栏鼠标点击后样式**/
				$("#link3").click(function(){
					//移除已访问的超链接样式
					$("#link1").removeClass("visited");
					$("#link2").removeClass("visited");
					//移除已访问的超链接边框样式
					$("#span1").removeClass("nav_border");
					$("#span1").removeClass("visited");
					$("#span2").removeClass("nav_border");
					$("#span2").removeClass("visited");
					//添加超链接已访问的边框样式
					$("#link3").addClass("visited");
					//添加超链接已访问样式
					$("#span3").addClass("visited");
				});
			});
			/**iframe高度自适应**/
			function changeFrameHeight(){
				document.getElementById("innerIframe").height=0;  
			    document.getElementById("innerIframe").height=document.getElementById("innerIframe").contentWindow.document.body.scrollHeight;
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4" style="padding: 15px; text-align: center">
					<span style="font-size: 22px; cursor: default;">我的出租</span>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row" style="padding: 30px 0px 10px 30px;">
				<div style="float:left; margin-right: 40px;">
					<a id="link1" class="nav visited" href="readyForRent" target="innerContent"><span id="span1" class="nav visited">待出租</span></a>
				</div>
				<div style="float:left; margin-right: 40px;">
					<a id="link2" class="nav" href="javascript:void(0)"><span id="span2" class="nav">正在出租</span></a>
				</div>
				<div style="float:left; margin-right: 40px;">
					<a id="link3" class="nav" href="javascript:void(0)"><span id="span3" class="nav">历史记录</span></a>
				</div>
				<div style="clear: both;"></div>
			</div>
			<div  class="row" style="padding: 20px 30px;">
				<iframe id="innerIframe" class="myiframe" src="readyForRent" name="innerContent" width="100%" onload="changeFrameHeight()"></iframe>
			</div>
		</div>
	</body>
</html>