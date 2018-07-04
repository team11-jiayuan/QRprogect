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
		<title>Insert title here</title>
		<style type="text/css">
			span.baseLabel{
				display: block;
				font-size: 16px;
				text-align: right;
				padding-top: 7px;
				cursor: default;
			}
			div.detailRow{
				margin: 12px 0px;
				font-size: 17px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				//读取省、市、区ID
				var provinceID = "${product.provinceID}";
				var cityID = "${product.cityID}";
				var districtID = "${product.districtID}";
				//加载省
				if(provinceID != ""){
					$.getJSON("js/json/s_province.js", function(data){
						$(data).each(function(i, json){
							if(provinceID == json.ProvinceID){
								$("#province").text(json.ProvinceName);
								return false;
							}
						});
					});
				}
				//如果市ID不为空，加载市
				if(cityID != "null" && provinceID != ""){
					$.getJSON("js/json/city_"+provinceID+".js", function(data){
						$(data).each(function(i, json){
							if(cityID == json.CityID){
								$("#city").text("- "+json.CityName);
								return false;
							}
						});
					});
				}
				//如果区ID不为空，加载区
				if(cityID != "null" && cityID != ""){
					$.getJSON("js/json/district_"+cityID+".js", function(data){
						$(data).each(function(i, json){
							if(districtID == json.DistrictID){
								$("#district").text("- "+json.DistrictName);
								return false;
							}
						});
					});
				}
				var rentMode = "${product.rentMode}";
				if(rentMode == "daily"){
					for(var i=1; i<=31; i++){
						$("#daysOrMonths").append("<option value="+i+">"+i+"</option>");
					}
				}else{
					for(var i=1; i<=12; i++){
						$("#daysOrMonths").append("<option value="+i+">"+i+"</option>");
					}
				}
			});
		</script>
	</head>
	<body>
		<!-- header start -->
		<jsp:include page="header.jsp" />
		<jsp:include page="subheader.jsp" />
		<!-- header end -->
		<!-- 物品详情 -->
		<div class="container-fluid" style="margin-top: 15px;">
			<div class="row">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px">
					<!-- 物品图片 -->
					<div style="width: 40%; border: #eee 1px solid; float: left;">
						<div style="text-align: center;">
							<img src="/pic/${product.primaryImg }" style="width: 400px; height: 400px;">
						</div>
					</div>
					<!-- 物品信息 -->
					<div style="width: 40%; height: 400px; padding: 10px 25px; float: left;">
						<!-- 物品名称 -->
						<div class="detailRow" style="margin-bottom: 5px;">
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
						<!-- 发布时间 -->
						<div class="detailRow">
							<span>
								发布时间：<fmt:formatDate value="${product.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
						</div>
						<!-- 所在地区 -->
						<div class="detailRow">
							<span>
								所在地区：
							</span>
							<span id="province"></span>
							<span id="city"></span>
							<span id="district"></span>
						</div>
						<!-- 联系方式 -->
						<div class="detailRow">
							<span>
								联系方式：${owner.phoneNumber }
							</span>
						</div>
						<!-- 申请租赁表单 -->
						<div class="detailRow">
							<form action="applyRent" method="post">
								<!-- 隐藏的订单ID -->
								<div style="display: none;">
									<input value="${order.id }" name="id">
								</div>
								<!-- 租赁时长 -->
								<div>
									<div style="float: left;">
										<span class="baseLabel">租赁时长：</span>
									</div>
									<div style="width: 15%; float: left;">
										<select class="form-control" name="daysOrMonths" id="daysOrMonths"></select>
									</div>
									<div style="float: left; margin-left: 5px;">
										<span class="baseLabel">
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
								</div>
								<c:choose>
									<c:when test="${order.status==1 }">
										<!-- 申请租赁按钮 -->
										<div style="text-align: center; margin-top: 25px;">
											<input type="submit" class="btn btn-primary" style="width: 35%;" value="申请租赁" />
										</div>
									</c:when>
									<c:otherwise>
										<!-- 禁用申请租赁按钮 -->
										<div style="text-align: center; margin-top: 25px;">
											<input type="submit" class="btn btn-primary" style="width: 35%;" value="申请租赁" disabled="disabled"/>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
						</div>
						<!-- 警告信息 -->
						<c:choose>
							<c:when test="${order.status==0 }">
								<!-- 该物品已取消发布 -->
								<div style="margin-left: 28%; color: #f00; margin-top: 25px;">
									<span style="display: block; padding-top: 3px; float: left;">*</span>
									<span style="display: block; padding-left: 3px; float: left;">该物品已取消发布</span>
									<div style="clear: both;"></div>
								</div>
							</c:when>
							<c:when test="${order.status>=2 && order.status<=4 }">
								<!-- 您已申请租赁该物品 -->
								<div style="margin-left: 28%; color: #f00; margin-top: 25px;">
									<span style="display: block; padding-top: 3px; float: left;">*</span>
									<span style="display: block; padding-left: 3px; float: left;">您已申请租赁该物品</span>
									<div style="clear: both;"></div>
								</div>
							</c:when>
							<c:when test="${(order.status>=5 && order.status<=9) || order.status==14 }">
								<!-- 您正在租用该物品 -->
								<div style="margin-left: 28%; color: #f00; margin-top: 25px;">
									<span style="display: block; padding-top: 3px; float: left;">*</span>
									<span style="display: block; padding-left: 3px; float: left;">您正在租用该物品</span>
									<div style="clear: both;"></div>
								</div>
							</c:when>
							<c:when test="${order.status==10 }">
								<!-- 您已完成该物品的租赁 -->
								<div style="margin-left: 28%; color: #f00; margin-top: 25px;">
									<span style="display: block; padding-top: 3px; float: left;">*</span>
									<span style="display: block; padding-left: 3px; float: left;">您已完成该物品的租赁</span>
									<div style="clear: both;"></div>
								</div>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 图片展示 -->
		<div class="container-fluid" style="margin-top: 25px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">图片展示</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 1px solid;"></div>
				</div>
			</div>
		</div>
		<div class="container-fluid" style="margin-top: 15px;">
			<c:forEach items="${imageList}" var="image">
				<div class="row">
					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px">
						<img style="width: 80%;" src="/pic/${image.url }">
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 分割线 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
					<hr style="height: 12px; border: 0; box-shadow: inset 0 12px 12px -12px rgba(0, 0, 0, 0.15);"/>
				</div>
			</div>
		</div>
		<!-- footer start -->
		<jsp:include page="footer.jsp" />
		<!-- footer end -->
	</body>
</html>