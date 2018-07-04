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
			span.baseLabel{
				display: block;
				font-size: 16px;
				text-align: right;
				padding-top: 7px;
				cursor: default;
			}
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
			/**被拒绝租赁申请的确认按钮**/
			function affirmDisagree(orderId){
				$.ajax({
					url: "affirmDisagree",
					data: {orderId: orderId},
					async: false,
					type: "POST",
					success: function(result){
						if(result.message == "ok"){
							parent.location.href = "rentHistory";
						}else{
							top.location.href = "login";
						}
					}
				});
			}
			/**立即支付**/
			function payment(orderId){
				top.location.href = "payment/"+orderId;
			}
			/**确认收到物品**/
			function receive(orderId){
				$.ajax({
					url: "receive",
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
			/**申请提前归还**/
			function earlyReturn(orderId){
				$.ajax({
					url: "earlyReturn",
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
			/**被拒绝提前归还申请的确认按钮**/
			function affirmDisagreeEarlyReturn(orderId){
				$.ajax({
					url: "affirmDisagreeEarlyReturn",
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
			/**承租人确认已归还提前归还的物品**/
			function affirmEarlyReturn(orderId){
				$.ajax({
					url: "affirmEarlyReturn",
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
			/**承租人确认收到押金和租金，订单完成**/
			function affirmReceiveDeposit(orderId){
				$.ajax({
					url: "affirmReceiveDeposit",
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
			/**申请延长租期**/
			function extendRent(orderId){
				$.ajax({
					url: "extendRent",
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
			/**确认延长日期**/
			function affirmExtendDate(orderId, index){
				var extendDate = $("#daysOrMonths_"+index).val();
				$.ajax({
					url: "affirmExtendDate",
					data: {orderId: orderId, extendDate: extendDate},
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
			/**支付延长使用租金**/
			function paymentExtend(orderId, index){
				$.ajax({
					url: "paymentExtend",
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
				<span style="display: block; text-align: center; margin: 40px 0px 20px 0px; font-size: 16px; cursor: default;">没有正在租赁的订单</span>
			</c:if>
			<c:forEach items="${orderList}" var="order" varStatus="status">
				<div class="row" style="border: rgb(230, 230, 230) 1px solid; border-radius: 3px; margin-bottom: 20px;" onmouseover="mouseoverStyle(this)" onmouseout="mouseoutStyle(this)">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
						<div class="itemheader">
							<div style="float: left;">
								<span>发布时间：<fmt:formatDate value="${order.extMap.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							<c:choose>
								<c:when test="${(order.status>=5 && order.status<=9) || order.status==14 || order.status==18 }">
									<div style="float: right; padding-right: 60px; color: #666;">
										<span>正在租赁</span>
									</div>
								</c:when>
							</c:choose>
							<div style="clear: both;"></div>
						</div>
						<div>
							<div style="border-right: 1px solid rgb(238, 238, 238); width: 30%; float: left; padding: 15px 0px 15px 20px;">
								<div style="float: left;">
									<c:choose>
										<c:when test="${order.status==13 }">
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
										<c:when test="${order.status==13 }">
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
								<c:choose>
									<c:when test="${order.status==13 }">
										<div style="padding: 40px 0px;">
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.extMap.reservedField}')">查看物品详情</a>
										</div>
									</c:when>
									<c:otherwise>
										<div style="padding: 40px 0px;">
											<a class="link" href="javascript:void(0)" onclick="productDetail('${order.id}')">查看物品详情</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="width: 27%; height: 100px; float: left; text-align: center;">
								<c:choose>
									<c:when test="${order.status != 15 && order.status != 16 && order.status != 17 && date.after(order.stopTime) }">
										<div style="padding-top: 10px; color: #f00;">
											归还日期已到
										</div>
										<div style="padding-top: 3px; color: #f00;">
											请及时归还物品
										</div>
										<div style="padding-top: 4px;">
											<button onclick="affirmEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">物品已归还</button>
										</div>
									</c:when>
									<c:when test="${order.status==2 }">
										<div style="padding-top: 15px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>您已申请租赁该物品</span>
										</div>
										<div style="padding-top: 3px;">
											<span>等待物主同意</span>
										</div>
									</c:when>
									<c:when test="${order.status==13 }">
										<div style="padding-top: 12px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>物主拒绝了您的租赁申请</span>
										</div>
										<div style="padding-top: 3px;">
											<button onclick="affirmDisagree('${order.id}')" type="button" class="btn btn-info btn-sm">确定</button>
										</div>
									</c:when>
									<c:when test="${order.status==3 }">
										<div style="padding-top: 5px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 2px;">
											<span>物主已同意您的租赁申请</span>
										</div>
										<div style="padding-top: 2px;">
											<span>请支付押金和租金</span>
										</div>
										<div style="padding-top: 2px;">
											<button onclick="payment('${order.id}')" type="button" class="btn btn-info btn-xs">立即支付</button>
										</div>
									</c:when>
									<c:when test="${order.status==4 }">
										<div style="padding-top: 10px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>您已支付订单，等待收到物品</span>
										</div>
										<div style="padding-top: 5px;">
											<button onclick="receive('${order.id}')" type="button" class="btn btn-info btn-sm">确认收到物品</button>
										</div>
									</c:when>
									<c:when test="${order.status==5 }">
										<div style="padding-top: 13px;">
											起租日期：<fmt:formatDate value="${order.startTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 4px;">
											归还日期：<fmt:formatDate value="${order.stopTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 4px;">
											<button onclick="earlyReturn('${order.id}')" type="button" class="btn btn-info btn-xs">申请提前归还</button>
											<button onclick="extendRent('${order.id}')" type="button" class="btn btn-warning btn-xs">申请延长租期</button>
										</div>
									</c:when>
									<c:when test="${order.status==6 }">
										<div style="padding-top: 8px;">
											起租日期：<fmt:formatDate value="${order.startTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 2px;">
											归还日期：<fmt:formatDate value="${order.stopTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 2px;">
											您已申请提前归还物品
										</div>
										<div style="padding-top: 2px;">
											等待物主同意
										</div>
									</c:when>
									<c:when test="${order.status==14 }">
										<div style="padding-top: 12px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>物主拒绝了您的提前归还申请</span>
										</div>
										<div style="padding-top: 3px;">
											<button onclick="affirmDisagreeEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">确定</button>
										</div>
									</c:when>
									<c:when test="${order.status==7 }">
										<div style="padding-top: 5px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 2px;">
											<span>物主同意了您的提前归还申请</span>
										</div>
										<div style="padding-top: 2px;">
											<span>请将物品归还</span>
										</div>
										<div style="padding-top: 2px;">
											<button onclick="affirmEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-xs">确认已归还物品</button>
										</div>
									</c:when>
									<c:when test="${order.status>=15 && order.status<=17 }">
										<div style="padding-top: 10px;">
											物品已归还
										</div>
										<div style="padding-top: 3px;">
											等待返还押金/租金
										</div>
										<div style="padding-top: 3px;">
											<button onclick="affirmReceiveDeposit('${order.id}')" type="button" class="btn btn-info btn-sm">已收到押金/租金</button>
										</div>
									</c:when>
									<c:when test="${order.status==18 }">
										<div style="padding-top: 15px; padding-left: 20px;">
											<div style="float: left; padding-right: 5px;">
												<span class="baseLabel">申请延长</span>
											</div>
											<div style="width: 35%; float: left;">
												<select class="form-control" id="daysOrMonths_${status.count}">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<c:if test="${order.extMap.rentMode=='daily' }">
														<option value="13">13</option>
														<option value="14">14</option>
														<option value="15">15</option>
														<option value="16">16</option>
														<option value="17">17</option>
														<option value="18">18</option>
														<option value="19">19</option>
														<option value="20">20</option>
														<option value="21">21</option>
														<option value="22">22</option>
														<option value="23">23</option>
														<option value="24">24</option>
														<option value="25">25</option>
														<option value="26">26</option>
														<option value="27">27</option>
														<option value="28">28</option>
														<option value="29">29</option>
														<option value="30">30</option>
														<option value="31">31</option>
													</c:if>
												</select>
											</div>
											<div style="float: left; margin-left: 5px;">
												<span class="baseLabel">
													<c:choose>
														<c:when test="${order.extMap.rentMode=='daily' }">
															天
														</c:when>
														<c:otherwise>
															个月
														</c:otherwise>
													</c:choose>
												</span>
											</div>
											<div style="clear: both;"></div>
										</div>
										<div style="padding-top: 10px;">
											<button onclick="affirmExtendDate('${order.id}', '${status.count}')" type="button" class="btn btn-info btn-sm">确认</button>
										</div>
									</c:when>
									<c:when test="${order.status==8 }">
										<div style="padding-top: 8px;">
											起租日期：<fmt:formatDate value="${order.startTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 2px;">
											归还日期：<fmt:formatDate value="${order.stopTime }" pattern="yyyy-MM-dd"/>
										</div>
										<div style="padding-top: 2px;">
											<span>您已申请延长租期</span>
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
										<div style="padding-top: 2px;">
											等待物主同意
										</div>
									</c:when>
									<c:when test="${order.status==19 }">
										<div style="padding-top: 12px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											<span>物主拒绝了您的延长租期申请</span>
										</div>
										<div style="padding-top: 3px;">
											<button onclick="affirmDisagreeEarlyReturn('${order.id}')" type="button" class="btn btn-info btn-sm">确定</button>
										</div>
									</c:when>
									<c:when test="${order.status==9 }">
										<div style="padding-top: 5px;">
											<fmt:formatDate value="${order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
										<div style="padding-top: 3px;">
											物主已同意延长租期
										</div>
										<div style="padding-top: 3px;">
											请支付延长使用租金
										</div>
										<div style="padding-top: 2px;">
											<button onclick="paymentExtend('${order.id}')" type="button" class="btn btn-info btn-xs">立即支付</button>
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