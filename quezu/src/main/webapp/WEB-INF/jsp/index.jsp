<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<title>快租网</title>
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
			a.productLink{
				text-decoration: none;
				color: #333;
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
			});
			function imouserover(element){
				element.style.border="RGB(200,200,200) 1px solid";
				element.style.backgroundColor="RGB(252,252,252)";
			}
			function imouserout(element){
				element.style.border="#f5f5f5 1px solid";
				element.style.backgroundColor="RGB(255,255,255)";
			}
			function productLinkMouseover(element){
				element.style.color="#0282d3";
			}
			function productLinkMouseout(element){
				element.style.color="#333";
			}
		</script>
	</head>
	<body>
		<!-- header start -->
		<jsp:include page="header.jsp" />
		<!-- header end -->
		<!-- logo和搜索框 -->
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
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px; width: 12%;  text-align: center">
					<ul style="padding-left:0px; margin-bottom:0px">
						<li style="display: inline;"><a href="javascript:void(0)" id="menu1" class="menu" style="color: #fff; text-decoration: none; background-color: RGB(28,155,236); width: 100%; padding: 10px 0px;">全部物品分类</a></li>
					</ul>
				</div>
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding: 0px">
					<ul style="padding-left:0px; margin-bottom:0px">
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
		<!-- 导航栏和轮播图 -->
		<div class="container-fluid">
			<div class="row">
				<!-- 导航栏 -->
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="border-left: #0172ba 1px solid; border-bottom: #0172ba 1px solid; padding: 0px; width: 12%;">
					<div id="navigation1" style="border-bottom: #eee 1px solid; padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">手机数码</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">手机</a></span>
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">相机</a></span>
							<span><a href="javascript:void(0)" style="text-decoration: none; color: #666;">耳机</a></span>
						</div>
					</div>
					<div id="navigation2" style="border-bottom: #eee 1px solid; padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">电脑办公</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">笔记本</a></span>
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">平板</a></span>
						</div>
					</div>
					<div id="navigation3" style="border-bottom: #eee 1px solid; padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">家用电器</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">洗衣机</a></span>
							<span><a href="javascript:void(0)" style="text-decoration: none; color: #666;">冰箱</a></span>
						</div>
					</div>
					<div id="navigation4" style="border-bottom: #eee 1px solid; padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">户外运动</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">户外工具</a></span>
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">体育用品</a></span>
						</div>
					</div>
					<div id="navigation5" style="border-bottom: #eee 1px solid; padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">图书音像</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">书籍</a></span>
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">音乐</a></span>
						</div>
					</div>
					<div id="navigation6" style="padding:15px;">
						<div style="color: #0282d3; font-size: 16px;">服装鞋帽</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">婚纱</a></span>
							<span style="margin-right:10px"><a href="javascript:void(0)" style="text-decoration: none; color: #666;">礼服</a></span>
						</div>
					</div>
				</div>
				<!-- 轮播图 -->
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding: 0px; width: 56%;">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
		  				<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img height="500px" src="img/1.png">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="img/2.png">
								<div class="carousel-caption"></div>
							</div>
							<div class="item">
								<img src="img/3.png">
								<div class="carousel-caption"></div>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 手机数码 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">手机数码</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList1}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 电脑办公 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">电脑办公</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList2}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 家用电器 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">家用电器</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList3}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 户外运动 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">户外运动</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList4}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 图书音像 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">图书音像</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList5}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
		<!-- 服装鞋帽 -->
		<div class="container-fluid" style="margin-top: 20px; margin-bottom: 30px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<span style="display: block; border-left: #0172ba 2px solid; padding-left: 10px; font-size: 18px;">服装鞋帽</span>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<div style="border-bottom: #e0e0e0 2px solid; width: 102%;"></div>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 10px 0px; width: 68%;">
					<c:forEach items="${orderList6}" var="order">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${order.id}">
								<img src="/pic/${order.extMap.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
								￥${order.extMap.rent } /
								<c:choose>
									<c:when test="${order.extMap.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${order.id}">
									${fn:substring(order.extMap.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
						</div>
						</div>
					</c:forEach>
					<div style="clear: both;"></div>
				</div>
			</div>
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