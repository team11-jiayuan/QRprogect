<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<title>历史记录</title>
		<style type="text/css">
			div.itemheader{
				border-bottom: rgb(238, 238, 238) 1px solid;
				background-color: #f5f5f5;
				padding: 5px 20px;
			}
			/**导航链接默认样式**/
			a.link{
				text-decoration: none;
				color: #999;
			}
			/**导航链接鼠标移入时样式**/
			a.link:hover {
				color: #0282d3;
			}
			div.itemBody{
			}
		</style>
		<script type="text/javascript">
			function mouseoverStyle(element){
				element.style.border="RGB(200,200,200) 1px solid";
				element.style.backgroundColor="RGB(252,252,252)";
			}
			function mouseoutStyle(element){
				element.style.border="1px solid rgb(230, 230, 230)";
				element.style.backgroundColor="RGB(255,255,255)";
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<c:if test="${orderList.size()==0 }">
				<span style="display: block; text-align: center; margin: 40px 0px 20px 0px; font-size: 16px; cursor: default;">没有历史订单</span>
			</c:if>
			<c:forEach items="${orderList}" var="order">
				<div class="row" style="border: rgb(230, 230, 230) 1px solid; border-radius: 3px; margin-bottom: 20px;" onmouseover="mouseoverStyle(this)" onmouseout="mouseoutStyle(this)">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
						<div class="itemheader">
							<div style="float: left;">
								<span>发布时间：<fmt:formatDate value="${order.extMap.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="itemBody">
							<div style="border-right: 1px solid rgb(238, 238, 238); width: 30%; float: left; padding: 15px 0px 15px 20px;">
								<div style="float: left;">
									<img src="/pic/${order.extMap.primaryImg }" style="width: 70px; height: 70px; border: 1px solid rgb(238, 238, 238);"></img>
								</div>
								<div style="float: left; padding: 0px 15px; width: 67%;">
									<span>${order.extMap.productName }</span>
								</div>
							</div>
							<div  style="border-right: 1px solid rgb(238, 238, 238); width: 25%; height:100px; float: left; padding: 15px 20px;">
								<!-- 租赁方式 -->
								<div>
									租赁方式：
									<c:choose>
										<c:when test="${order.extMap.rentMode=='daily' }">
											日租
										</c:when>
										<c:otherwise>
											月租
										</c:otherwise>
									</c:choose>
								</div>
								<div style="margin: 5px 0px;">
									押金：￥${order.extMap.deposit }
								</div>
								<div style="margin: 5px 0px;">
									租金：￥${order.extMap.rent } /
									<c:choose>
										<c:when test="${order.extMap.rentMode=='daily' }">
											天
										</c:when>
										<c:otherwise>
											月
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div style="width: 20%; border-right: 1px solid rgb(238, 238, 238); height: 100px; float: left; text-align: center;">
								<div style="padding: 40px 0px;">查看订单</div>
							</div>
							<div style="width: 25%; height: 100px; float: left; text-align: center;">
								<c:choose>
									<c:when test="${order.status=='0' }">
										<div style="padding: 40px 0px;">订单已取消</div>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>