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
					<span style="font-size: 22px; cursor: default;">我的租赁</span>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row" style="padding: 30px 30px;">
				<c:choose>
					<c:when test="${toPage=='toMyCurrentRent' }">
						<div style="float:left; margin-right: 40px;">
							<a id="link1" class="nav visited" href="myCurrentRent"><span id="span1" class="nav visited">正在出租</span></a>
						</div>
					</c:when>
					<c:otherwise>
						<div style="float:left; margin-right: 40px;">
							<a id="link1" class="nav" href="myCurrentRent"><span id="span1" class="nav">正在出租</span></a>
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${toPage=='toRentHistory' }">
						<div style="float:left; margin-right: 40px;">
							<a id="link2" class="nav visited" href="rentHistory"><span id="span2" class="nav visited">历史记录</span></a>
						</div>
					</c:when>
					<c:otherwise>
						<div style="float:left; margin-right: 40px;">
							<a id="link2" class="nav" href="rentHistory"><span id="span2" class="nav">历史记录</span></a>
						</div>
					</c:otherwise>
				</c:choose>
				<div style="clear: both;"></div>
			</div>
			<div  class="row" style="padding: 0px 30px; margin-bottom: 30px;">
				<iframe id="innerIframe" class="myiframe" src="${toPage }" scrolling="no" name="innerContent" width="100%" onload="changeFrameHeight()"></iframe>
			</div>
		</div>
	</body>
</html>