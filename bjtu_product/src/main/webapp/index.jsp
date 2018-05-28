<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<%-- <jsp:forward page="product_index.do"></jsp:forward> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


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
				<div class="navbar">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a data-target=".navbar-responsive-collapse"
								data-toggle="collapse" class="btn btn-navbar"><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span></a> <a href="#" class="brand">快租网</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li class="active"><a href="#">主页</a></li>
									<li><a href="#">链接</a></li>
									<li><a href="#">链接</a></li>
									<li class="dropdown"><a data-toggle="dropdown"
										class="dropdown-toggle" href="#">下拉菜单<strong class="caret"></strong></a>
										<ul class="dropdown-menu">
											<li><a href="#">下拉导航1</a></li>
											<li><a href="#">下拉导航2</a></li>
											<li><a href="#">其他</a></li>
											<li class="divider"></li>
											<li class="nav-header">标签</li>
											<li><a href="#">链接1</a></li>
											<li><a href="#">链接2</a></li>
										</ul></li>
								</ul>
								<ul class="nav pull-right">
									<li><a href="#">右边链接</a></li>
									<li class="divider-vertical"></li>
									<li class="dropdown"><a data-toggle="dropdown"
										class="dropdown-toggle" href="#">下拉菜单<strong class="caret"></strong></a>
										<ul class="dropdown-menu">
											<li><a href="#">下拉导航1</a></li>
											<li><a href="#">下拉导航2</a></li>
											<li><a href="#">其他</a></li>
											<li class="divider"></li>
											<li><a href="#">链接3</a></li>
										</ul></li>
								</ul>
							</div>

						</div>
					</div>

				</div>
				<div class="row-fluid">
					<div class="span2">
						<ul class="nav nav-list">
							<li class="nav-header"></li>
							<li class="active"><a href="#">发布闲置</a></li>
						
							<li class="nav-header"><a href="#">我的闲置</a></li>
							
						</ul>
					</div>
					<div class="span10">
						<ul class="breadcrumb">
							<li><a href="#">尚未出租</a> <span class="divider">/</span></li>
							<li><a href="#">正在出租</a> <span class="divider">/</span></li>
							<li class="active">出租记录</li>
						</ul>
						<div class="row-fluid">
							<div class="span12">
							  出租记录
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>