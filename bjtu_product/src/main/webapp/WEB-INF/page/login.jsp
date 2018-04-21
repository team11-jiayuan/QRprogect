<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link
	href="js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<body>
<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="product_index.do">快租网</a></li>
					<li><a href="product_index.do">首页</a></li>
					<li><a href="toregist.do">注册</a></li>

					<li class="dropdown pull-right"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">下拉<strong
							class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">操作</a></li>
							<li><a href="#">设置栏目</a></li>
							<li><a href="#">更多设置</a></li>
							<li class="divider"></li>
							<li><a href="#">分割线</a></li>
						</ul></li>
				</ul>
				<div class="row-fluid">
					<div class="span6">
						<div class="span6">
							<div style="float: left; width: 1250px; height: 500px;">
							   <img src="image/background.jpg"
								class="img-rounded" style="width: 1250px; height: 500px" />							  
						    </div>
						</div>
					</div>
					<div class="span6">
						<h3>用户登陆</h3>
						<form action="login.do" method="post" class="form-horizontal">
							<fieldset>
								<div id="legend" class=""></div>
								<br>

								<div class="control-group">

									<!-- 用户名-->
									<label class="control-label" for="input01">用户名</label>
									<div class="controls">
										<input name="yh_nch" type="text" placeholder="" class="input-xlarge">
										<p class="help-block">${errors}</p>
									</div>
								</div>

								<div class="control-group">

									<!-- 密码-->
									<label class="control-label" for="input01">密码</label>
									<div class="controls">
										<input name="yh_mm" type="password" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label"></label>

									<!-- 登陆按钮 -->
									<div class="controls">
										<button type="submit" class="btn btn-success">登陆</button>
									</div>
								</div>

							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>