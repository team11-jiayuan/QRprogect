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
		<title>收银台</title>
		<style type="text/css">
			div.detailRow{
				margin: 8px 0px;
				font-size: 16px;
			}
		</style>
		<script type="text/javascript">
			/**立即支付**/
			function payment(orderId){
				$.ajax({
					url: "toPay",
					data: {orderId: orderId},
					async: false,
					type: "POST",
					success: function(result){
						if(result.message == "ok"){
							top.location.href = "myRent";
						}else{
							top.location.href = "login";
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<!-- header start -->
		<jsp:include page="header.jsp" />
		<!-- header end -->
		<div class="container-fluid">
			<div class="row" style="padding: 20px 0px; border-bottom: #e0e0e0 4px solid;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<a href="index"><img class="img-responsive" width="180px" src="img/logo.png" ></a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding-top: 1.5%; font-size: 28px; letter-spacing: 5px;">
					收银台
				</div>
			</div>
		</div>
		<div class="container-fluid" style="background-color: RGB(245,245,245); margin-bottom: 30px;">
			<div class="row" style="margin-top: 30px; margin-bottom: 90px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 15px 0px; background-color: RGB(255,255,255); width: 67%; text-align: center;">
					<!-- 物品图片 -->
					<div style="width: 40%; float: left;">
						<div style="text-align: center;">
							<img src="/pic/${product.primaryImg }" style="width: 60%; height: 60%;">
						</div>
					</div>
					<!-- 物品信息 -->
					<div style="width: 40%; padding: 10px 0px; float: left; text-align: left;">
						<!-- 物品名称 -->
						<div class="detailRow" style="margin: 0px 0px 5px 0px;">
							<span style="font-size: 21px; font-weight: 700; font-family: 'microsoft yahei'; color: #444;">
								${product.productName }
							</span>
						</div>
						<!-- 物品描述 -->
						<div style="margin-bottom: 5px;">
							<span style="font-size: 16px; color: #333;">${product.description }</span>
						</div>
						<div style="border-bottom: #ccc 1px solid;"></div>
						<!-- 租赁方式 -->
						<div class="detailRow">
							<span>
								租赁方式：
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										日租
									</c:when>
									<c:otherwise>
										月租
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<!-- 押金 -->
						<div class="detailRow">
							<span>
								押 金：￥${product.deposit }
							</span>
						</div>
						<!-- 租金 -->
						<div class="detailRow">
							<span>
								租 金：￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<!-- 租用时长 -->
						<div class="detailRow">
							<span>
								租用时长：${order.daysOrMonths } 
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										个月
									</c:otherwise>
								</c:choose>
							</span>
						</div>
						<!-- 合计租金 -->
						<div class="detailRow">
							<span>
								<span>
									合计租金：￥${product.rent } /
									<c:choose>
										<c:when test="${product.rentMode=='daily' }">
											天
										</c:when>
										<c:otherwise>
											月
										</c:otherwise>
									</c:choose>
								</span>
								<span>
									x ${order.daysOrMonths } 
									<c:choose>
										<c:when test="${product.rentMode=='daily' }">
											天
										</c:when>
										<c:otherwise>
											个月
										</c:otherwise>
									</c:choose>
								</span>
								<span>
									= ￥${totalRent }
								</span>
							</span>
						</div>
						<!-- 合计支付 -->
						<div class="detailRow" style="color: #f00; margin-top: 15px;">
							<span style="display: block; float: left; padding-top: 7px;">
								合计支付：￥${total }
							</span>
							<span style="display: block; float: left; margin-left: 20px;">
								<button onclick="payment('${order.id}')" type="button" class="btn btn-info">立即支付</button>
							</span>
							<div style="clear: both;"></div>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- footer start -->
		<jsp:include page="footer.jsp" />
		<!-- footer end -->
	</body>
</html>