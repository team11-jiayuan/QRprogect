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
			a.operate{
				text-decoration: none;
				color: #999;
			}
			/**链接鼠标移入时样式**/
			a.link:hover {
				color: #0282d3;
			}
			a.operate:hover {
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
			/**取消订单**/
			function cancelOrder(orderId){
				$.ajax({
					url: "cancelOrder",
					data: {orderId: orderId},
					async: false,
					type: "POST",
					success: function(result){
						if(result.message == "ok"){
							parent.location.reload();
						}else{
							top.location.href = "login";
						}
					}
				});
			}
			/**物品详情**/
			function productDetail(orderId){
				top.location.href = "productDetail/"+orderId;
			}
			/**同意租赁**/
			function agreeRent(orderId){
				$.ajax({
					url: "agreeRent",
					data: {orderId: orderId},
					async: false,
					type: "POST",
					success: function(result){
						if(result.message == "ok"){
							parent.location.reload();
						}else{
							top.location.href = "login";
						}
					}
				});
			}
			/**拒绝租赁**/
			function disagreeRent(orderId){
				$.ajax({
					url: "disagreeRent",
					data: {orderId: orderId},
					async: false,
					type: "POST",
					success: function(result){
						if(result.message == "ok"){
							parent.location.reload();
						}else{
							top.location.href = "login";
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<c:if test="${orderList.size()==0 }">
				<span style="display: block; text-align: center; margin: 40px 0px 20px 0px; font-size: 16px; cursor: default;">没有待出租的订单</span>
			</c:if>
			<c:forEach items="${orderList}" var="order">
				<div class="row" style="border: rgb(230, 230, 230) 1px solid; border-radius: 3px; margin-bottom: 20px;" onmouseover="mouseoverStyle(this)" onmouseout="mouseoutStyle(this)">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
						<div class="itemheader">
							<div style="float: left;">
								<span>发布时间：<fmt:formatDate value="${order.extMap.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							<div style="float: right;">
								<c:if test="${order.status==1 }">
									<a class="operate" onclick="cancelOrder('${order.id }')" href="javascript:void(0)"><span style="letter-spacing: 1px;">取消该订单</span></a>
								</c:if>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div>
							<div style="border-right: 1px solid rgb(238, 238, 238); width: 30%; float: left; padding: 15px 0px 15px 20px;">
								<div style="float: left;">
									<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">
										<img src="/pic/${order.extMap.primaryImg }" style="width: 70px; height: 70px; border: 1px solid rgb(238, 238, 238);">
									</a>
								</div>
								<div style="float: left; padding: 0px 15px; width: 67%;">
									<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">
										<span>${order.extMap.productName }</span>
									</a>
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
									<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">查看物品详情</a>
								</div>
							</div>
							<div style="width: 27%; height: 100px; float: left; text-align: center;">
								<c:choose>
									<c:when test="${order.status==1 }">
										<div style="padding: 40px 0px;">尚无人申请租赁该物品</div>
									</c:when>
									<c:when test="${order.status==2 }">
										<div style="padding-top: 10px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span style="color: #0282d3;">${order.extMap.renterName }</span>
											<span>申请租赁该物品</span>
											<span>${order.daysOrMonths }</span>
											<c:choose>
												<c:when test="${order.extMap.rentMode=='daily' }">
													天
												</c:when>
												<c:otherwise>
													个月
												</c:otherwise>
											</c:choose>
										</div>
										<div style="padding-top: 5px;">
											<button onclick="agreeRent('${order.id}')" type="button" class="btn btn-info btn-sm">同意</button>
											<button onclick="disagreeRent('${order.id}')" type="button" class="btn btn-warning btn-sm">拒绝</button>
										</div>
									</c:when>
									<c:when test="${order.status==3 }">
										<div style="padding-top: 10px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>您已同意</span>
											<span style="color: #0282d3;">${order.extMap.renterName }</span>
											<span>的租赁申请</span>
										</div>
										<div style="padding-top: 5px;">
											<span>等待对方支付押金和租金</span>
										</div>
									</c:when>
									<c:when test="${order.status==4 }">
										<div style="padding-top: 25px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>对方已支付订单，等待收到物品</span>
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