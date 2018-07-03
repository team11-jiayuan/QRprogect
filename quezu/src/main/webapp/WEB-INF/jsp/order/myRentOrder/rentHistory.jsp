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
		<title>待出租</title>
		<style type="text/css">
			div.itemheader{
				border-bottom: rgb(238, 238, 238) 1px solid;
				background-color: #f5f5f5;
				padding: 5px 20px;
			}
			/**链接默认样式**/
			a.link{
				text-decoration: none;
				color: #333;
			}
			/**链接鼠标移入时样式**/
			a.link:hover {
				color: #0282d3;
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
			/**物品详情**/
			function productDetail(orderId){
				top.location.href = "productDetail/"+orderId;
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
						<div>
							<div style="border-right: 1px solid rgb(238, 238, 238); width: 30%; float: left; padding: 15px 0px 15px 20px;">
								<div style="float: left;">
									<c:choose>
										<c:when test="${order.status==11 }">
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.extMap.reservedField}')">
												<img src="/pic/${order.extMap.primaryImg }" style="width: 70px; height: 70px; border: 1px solid rgb(238, 238, 238);">
											</a>
										</c:when>
										<c:otherwise>
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">
												<img src="/pic/${order.extMap.primaryImg }" style="width: 70px; height: 70px; border: 1px solid rgb(238, 238, 238);">
											</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div style="float: left; padding: 0px 15px; width: 67%;">
									<c:choose>
										<c:when test="${order.status==11 }">
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.extMap.reservedField}')">
												<span>${order.extMap.productName }</span>
											</a>
										</c:when>
										<c:otherwise>
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">
												<span>${order.extMap.productName }</span>
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div  style="border-right: 1px solid rgb(238, 238, 238); width: 24%; height:100px; float: left; padding: 15px 20px;">
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
							<div style="width: 19%; border-right: 1px solid rgb(238, 238, 238); height: 100px; float: left; text-align: center;">
								<div style="padding: 40px 0px;">
									<c:choose>
										<c:when test="${order.status==11 }">
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.extMap.reservedField}')">查看物品详情</a>
										</c:when>
										<c:otherwise>
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">查看物品详情</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div style="width: 27%; height: 100px; float: left; text-align: center;">
								<div style="padding-top: 25px;">
									<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</div>
								<c:choose>
									<c:when test="${order.status==10 }">
										<div style="padding-top: 3px;">
											<span>订单已完成</span>
										</div>
									</c:when>
									<c:when test="${order.status==11 }">
										<div style="padding-top: 3px;">
											<span>物主拒绝了您的租赁申请</span>
										</div>
									</c:when>
									<c:when test="${order.status==12 }">
										<div style="padding-top: 3px;">
											<span>订单已取消</span>
										</div>
									</c:when>
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