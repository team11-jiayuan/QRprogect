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
		<title>基本信息</title>
		<style type="text/css">
			label.control-label{
				font-weight: normal;
			}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					<!-- 表单区域 -->
					<form class="form-horizontal">
						<div class="form-group">
							<label for="userName" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">用户名：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="userName" name="userName" value="${sessionScope.currentUser.userName }" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="realName" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">真实姓名：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="realName" name="realName" value="${sessionScope.currentUser.realName }">
							</div>
						</div>
						<div class="form-group">
							<label for="sex" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">性别：</label>
							<div class="col-sm-9">
								<label class="radio-inline">
									<input type="radio" name="sex" id="male" value="male" checked> 男
								</label>
								<label class="radio-inline">
									<input type="radio" name="sex" id="female" value="female"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="IDNumber" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">身份证号:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="IDNumber" name="IDNumber" value="${sessionScope.currentUser.IDNumber }">
							</div>
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">手机号:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.currentUser.phoneNumber }">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">邮箱：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="email" name="email" value="${sessionScope.currentUser.email }">
							</div>
						</div>
						<!-- <div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div> -->
					</form>
					<!-- <form id="loginForm" action="toLogin" method="post">
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
					</form> -->
				</div>
			</div>
		</div>
	</body>
</html>