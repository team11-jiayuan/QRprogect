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
			a.menu:link {
				display: block;
				height: 42px;
				font-size: 16px;
				padding: 10px 20px;
				float: left;
			}
			a.menu:hover {
				background-color: RGB(28,155,236);
			}
			span.baseLabel{
				display: block;
				font-size: 16px;
				text-align: right;
				padding-top: 7px;
				cursor: default;
			}
			div.detailRow{
				margin: 10px 0px;
				font-size: 16px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#menu1").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu1").css("background-color", "RGB(28,155,236)");
				});
				$("#menu2").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu2").css("background-color", "RGB(28,155,236)");
				});
				$("#menu3").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu3").css("background-color", "RGB(28,155,236)");
				});
				$("#menu4").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu4").css("background-color", "RGB(28,155,236)");
				});
				$("#menu5").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu5").css("background-color", "RGB(28,155,236)");
				});
				$("#menu6").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu6").css("background-color", "RGB(28,155,236)");
				});
				$("#menu7").click(function(){
					$(".menu").css("background-color", "#0282d3");
					$("#menu7").css("background-color", "RGB(28,155,236)");
				});
				$("#navigation1").mouseover(function(){
					$("#navigation1").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation1").mouseout(function(){
					$("#navigation1").css("background-color", "RGB(255,255,255)");
				});
				$("#navigation2").mouseover(function(){
					$("#navigation2").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation2").mouseout(function(){
					$("#navigation2").css("background-color", "RGB(255,255,255)");
				});
				$("#navigation3").mouseover(function(){
					$("#navigation3").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation3").mouseout(function(){
					$("#navigation3").css("background-color", "RGB(255,255,255)");
				});
				$("#navigation4").mouseover(function(){
					$("#navigation4").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation4").mouseout(function(){
					$("#navigation4").css("background-color", "RGB(255,255,255)");
				});
				$("#navigation5").mouseover(function(){
					$("#navigation5").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation5").mouseout(function(){
					$("#navigation5").css("background-color", "RGB(255,255,255)");
				});
				$("#navigation6").mouseover(function(){
					$("#navigation6").css("background-color", "RGB(247,247,247)");
				});
				$("#navigation6").mouseout(function(){
					$("#navigation6").css("background-color", "RGB(255,255,255)");
				});
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
		<!-- header end -->
		<div class="container-fluid">
			<div class="row" style="padding-top: 15px; margin-bottom:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<img class="img-responsive" width="180px" src="img/logo.png" >
				</div>
				<div class="col-xs-6 col-sm-5 col-md-4 col-lg-4" style="padding-top: 25px; margin-left: 5%;">
					<div class="input-group">
      					<input type="text" class="form-control" style="border: #0282d3 2px solid;">
      					<span class="input-group-btn">
        					<button class="btn btn-default" type="button" style="background-color: #0282d3; border-color: #0282d3; color: #fff;">搜索</button>
      					</span>
    				</div>
				</div>
			</div>
		</div>
		<!-- 导航条 -->
		<div class="container-fluid" style="background-color: #0282d3; height: 42px;">
			<div class="row">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px">
					<ul style="padding-left:0px; margin-bottom:0px">
						<li style="display: inline;"><a href="javascript:void(0)" id="menu2" class="menu" style="color: #fff; text-decoration: none;">首页</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu2" class="menu" style="color: #fff; text-decoration: none;">手机数码</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu3" class="menu" style="color: #fff; text-decoration: none;">电脑办公</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu4" class="menu" style="color: #fff; text-decoration: none;">家用电器</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu5" class="menu" style="color: #fff; text-decoration: none;">户外运动</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu6" class="menu" style="color: #fff; text-decoration: none;">图书音像</a></li>
						<li style="display: inline;"><a href="javascript:void(0)" id="menu7" class="menu" style="color: #fff; text-decoration: none;">服装鞋帽</a></li>
					</ul>
				</div>
			</div>
		</div>
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
					<div style="width: 40%; height: 400px; border: #ccc 1px solid; padding: 10px 25px; float: left;">
						<!-- 物品名称 -->
						<div class="detailRow">
							<span style="font-size: 20px; font-weight: 700; font-family: 'microsoft yahei'; color: #444;">
								${product.productName }
							</span>
						</div>
						<!-- 物品描述 -->
						<div>
							<span>${product.description }</span>
						</div>
						<div style="border-bottom: #ccc 2px solid;"></div>
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
							<span style="color: #e4393c;">
								押 金：￥${product.rent }
							</span>
						</div>
						<!-- 租金 -->
						<div class="detailRow">
							<span style="color: #e4393c;">
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
									<div style="clear: both;"></div>
								</div>
								<!-- 申请租赁按钮 -->
								<div style="text-align: center; margin-top: 25px;">
									<input type="submit" class="btn btn-primary" style="width: 35%;" value="申请租赁" />
								</div>
							</form>
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