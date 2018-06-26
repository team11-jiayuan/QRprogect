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
		<title>待出租</title>
		<style type="text/css">
			div.itemNav{
				border-bottom: rgb(238, 238, 238) 1px solid;
				background-color: #f5f5f5;
			}
		</style>
		<script type="text/javascript">
			function mouseoverStyle(element){
				element.style.border="#e0e0e0 1px solid";
				element.style.backgroundColor="RGB(250,250,250)";
			}
			function mouseoutStyle(element){
				element.style.border="1px solid rgb(238, 238, 238)";
				element.style.backgroundColor="RGB(255,255,255)";
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<c:forEach items="${orderList}" var="order">
				<div class="row item" style="border: rgb(238, 238, 238) 1px solid; border-radius: 3px;" onmouseover="mouseoverStyle(this)" onmouseout="mouseoutStyle(this)">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
						<div class="itemNav">
							<div>
								${order.id }
								${order.extMap.productName }
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>