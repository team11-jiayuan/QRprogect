<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
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
			/**物品详情**/
			function productDetail(orderId){
				top.location.href = "productDetail/"+orderId;
			}
			/**拒绝提前归还**/
			function disagreeEarlyReturn(orderId){
				$.ajax({
					url: "disagreeEarlyReturn",
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
			/**同意提前归还**/
			function agreeEarlyReturn(orderId){
				$.ajax({
					url: "agreeEarlyReturn",
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
			/**确认收到提前归还的物品**/
			function receiveEarlyReturn(orderId){
				$.ajax({
					url: "receiveEarlyReturn",
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
			/**返还押金和租金**/
			function returnDeposit(orderId){
				$.ajax({
					url: "returnDeposit",
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
			/**拒绝延长租期**/
			function disagreeExtend(orderId){
				$.ajax({
					url: "disagreeExtend",
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
			/**同意延长租期**/
			function agreeExtend(orderId){
				$.ajax({
					url: "agreeExtend",
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
		<%Date date = new Date();session.setAttribute("date", date); %>
		<div class="container-fluid">
			<c:if test="${orderList.size()==0 }">
				<span style="display: block; text-align: center; margin: 40px 0px 20px 0px; font-size: 16px; cursor: default;">没有正在出租的订单</span>
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
									<c:when test="${order.status != 16 && order.status != 17 && date.after(order.stopTime) }">
										<div style="padding-top: 10px; color: #f00;">
											归还日期已到
										</div>
										<div style="padding-top: 3px; color: #f00;">
											等待对方归还物品
										</div>
										<div style="padding-top: 4px;">
											<button onclick="receiveEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">物品已归还</button>
										</div>
									</c:when>
									<c:when test="${order.status==5 || order.status==14 || order.status==18 || order.status==19 }">
										<div style="padding-top: 15px;">
											正在出租
										</div>
										<div style="padding-top: 3px;">
											起租日期：<fmt:formatDate value="${order.startTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 3px;">
											归还日期：<fmt:formatDate value="${order.stopTime }" pattern="yyyy-MM-dd"/>
										</div>
									</c:when>
									<c:when test="${order.status==6 }">
										<div style="padding-top: 20px;">
											对方申请提前归还物品
										</div>
										<div style="padding-top: 5px;">
											<button onclick="agreeEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">同意</button>
											<button onclick="disagreeEarlyReturn('${order.id}')" type="button" class="btn btn-warning btn-sm">拒绝</button>
										</div>
									</c:when>
									<c:when test="${order.status==7 || order.status==15 }">
										<div style="padding-top: 12px;">
											您已同意提前归还物品
										</div>
										<div style="padding-top: 3px;">
											等待对方归还物品
										</div>
										<div style="padding-top: 3px;">
											<button onclick="receiveEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">确认收到物品</button>
										</div>
									</c:when>
									<c:when test="${order.status==16 }">
										<div style="padding-top: 21px;">
											物品已归还，请返还押金/租金
										</div>
										<div style="padding-top: 5px;">
											<button onclick="returnDeposit('${order.id}')" type="button" class="btn btn-info btn-sm">返还押金/租金</button>
										</div>
									</c:when>
									<c:when test="${order.status==17 }">
										<div style="padding-top: 22px;">
											押金/租金已返还
										</div>
										<div style="padding-top: 5px;">
											等待对方确认
										</div>
									</c:when>
									<c:when test="${order.status==8 }">
										<div style="padding-top: 20px;">
											<span>对方申请延长租期</span>
											<span>${order.extendDate }</span>
											<c:choose>
												<c:when test="${order.extMap.rentMode=='daily' }">
													<span>天</span>
												</c:when>
												<c:otherwise>
													<span>个月</span>
												</c:otherwise>
											</c:choose>
										</div>
										<div style="padding-top: 5px;">
											<button onclick="agreeExtend('${order.id}')" type="button" class="btn btn-info btn-sm">同意</button>
											<button onclick="disagreeExtend('${order.id}')" type="button" class="btn btn-warning btn-sm">拒绝</button>
										</div>
									</c:when>
									<c:when test="${order.status==9 }">
										<div style="padding-top: 23px;">
											您已同意延长租期
										</div>
										<div style="padding-top: 3px;">
											等待对方支付延长使用租金
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