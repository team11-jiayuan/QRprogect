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
		<title>欢迎登录</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#loginForm").submit(function(){
					var userName = $("#userName").val();
					var password = $("#password").val();
					var flag = false;
					$.ajax({
						url: "loginCheck",
						data: {userName: userName, password: password},
						async: false,
						type: "POST",
						success: function(result){
							if(result.message == "ok"){
								flag = true;
							}else{
								$("#warningSpan").html("<img width='12px' src='img/warning.png' style='padding-bottom: 3px'>  "+result.message);
								$("#warningSpan").show();
							}
						}
					});
					return flag;
				});
			});
		</script>
	</head>
	<body>
		<div class="container" style="padding: 0px; margin-bottom: 90px;">
			<!-- 上方logo -->
			<div class="row" style="padding: 20px 0px 25px 0px;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<a href="index"><img src="img/logo.png" class="img-responsive" /></a>
				</div>
			</div>
			<!-- 中间区域 -->
			<div class="row">
				<!-- 左侧图片 -->
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
					<img src="img/login.png" class="img-responsive" />
				</div>
				<!-- 右侧登录框 -->
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding: 35px 15px; margin-top: 5%; border: 1px solid #dddddd;">
					<div style="float: left;">
						<p style="color: #333; font-size: 18px; margin-bottom: 25px;">用户登录</p>
					</div>
					<div style="float: right; padding-top: 1%;">
						<a href="register" style="text-decoration: none; padding-right: 1px;">免费注册</a>
					</div>
					<div style="clear: both;"></div>
					<!-- 表单区域 -->
					<form id="loginForm" action="toLogin" method="post">
						<div class="form-group">
							<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="password" name="password" placeholder="密码" />
						</div>
						<span id="warningSpan" style="padding-left: 115px; color: #dd2727; display: none; font-size: 14px;"></span>
						<div style="float: right;">
							<a href="javascript:void(0)" style="text-decoration: none; padding-right: 1px;">忘记密码</a>
						</div>
						<div style="clear: both;"></div>
						<div class="form-group" style="text-align: center; padding-top: 10px;">
							<input type="submit" class="btn btn-primary" style="width: 100%;" value="登&nbsp;&nbsp;&nbsp;录" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- footer start -->
		<jsp:include page="footer.jsp" />
		<!-- footer end -->
	</body>
</html>