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
		<title>个人中心首页</title>
		<style type="text/css">
			a#userName_link{
				text-decoration: none;
				color: #333;
				font-size: 24px;
			}
			a#userName_link:hover{
				color: #0282d3;
			}
			.default_cursor{
				cursor: default
			}
			span.mybtn{
				display: block;
				float:left;
				padding: 0px 10px;
				border-radius: 20px;
				background-color: RGB(53,155,220);
				color: #fff;
				font-size: 13px;
			}
		</style>
		<script type="text/javascript">
			function userName_onclick(){
				window.parent.document.getElementById("link1").click();
			}
			$(document).ready(function(){
				$("#alterInformation").mouseover(function(){
					$("#alterInformation").css("background-color", "RGB(70,180,250)");
				});
				$("#alterInformation").mouseout(function(){
					$("#alterInformation").css("background-color", "RGB(53,155,220)");
				});
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 10px 30px;">
					<h4 class="default_cursor">个人信息</h4>
				</div>
			</div>
			<div class="row" style="margin-bottom: 20px; margin-top: 5px;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-left: 30px;">
					<img class="img-responsive" width="75px" src="img/${sessionScope.currentUser.photograph }">
				</div>
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
					<div class="row" style="margin-bottom: 10px;">
						<div style="float:left">
							<span class="default_cursor" style="color: #333; font-size: 20px;">用户名：</span>
							<a id="userName_link" href="javascript:void(0)" onclick="userName_onclick()">${sessionScope.currentUser.userName }</a>
						</div>
						<a href="javascript:void(0)" onclick="userName_onclick()">
							<span id="alterInformation" class="mybtn" style="margin: 7px 0px 0px 25px;">修改个人信息</span>
						</a>
						<div style="clear: both;"></div>
					</div>
					<div class="row">
						<div style="float: left">
							<img width="12px" src="img/phone.png">
						</div>
						<div style="float: left; margin-left: 5px;">
							<span style="color: #888; font-size: 16px;">${sessionScope.currentUser.phoneNumber }</span>
						</div>
						<div style="clear: both;"></div>
					</div>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 20px 30px; height: 200px;">
					<h4>我的订单</h4>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 20px 30px; height: 200px;">
					<h4>我的关注</h4>
				</div>
			</div>
		</div>
	</body>
</html>