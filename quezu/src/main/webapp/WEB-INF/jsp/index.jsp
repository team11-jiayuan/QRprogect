<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			.shadow{
				box-shadow: 0 0 2px 1px rgba(2,130,211,0.6);
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#searchBtn").click(function(){
					var keyWord = $("#keyWord").val();
					if(keyWord == ""){
						return;
					}
					window.location.href = "searchByKeyWord/"+keyWord;
				});
			});
			function navmouover(element){
				element.style.backgroundColor="RGB(247,247,247)";
			}
			function navmouout(element){
				element.style.backgroundColor="RGB(255,255,255)";
			}
			function imouserover(element){
				element.classList.add("shadow");
			}
			function imouserout(element){
				element.classList.remove("shadow");
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
					<a href="index"><img class="img-responsive" width="180px" src="img/logo.png" ></a>
				</div>
				<div class="col-xs-6 col-sm-5 col-md-4 col-lg-4" style="padding-top: 25px; margin-left: 5%;">
					<div class="input-group">
      					<input id="keyWord" type="text" class="form-control" style="border: #0282d3 2px solid;">
      					<span class="input-group-btn">
        					<button id="searchBtn" class="btn btn-default" type="button" style="background-color: #0282d3; border-color: #0282d3; color: #fff;">搜索</button>
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
						<li style="display: inline;"><a href="searchByCategory/1" id="menu2" class="menu" style="color: #fff; text-decoration: none;">手机数码</a></li>
						<li style="display: inline;"><a href="searchByCategory/2" id="menu3" class="menu" style="color: #fff; text-decoration: none;">电脑办公</a></li>
						<li style="display: inline;"><a href="searchByCategory/3" id="menu4" class="menu" style="color: #fff; text-decoration: none;">家用电器</a></li>
						<li style="display: inline;"><a href="searchByCategory/4" id="menu5" class="menu" style="color: #fff; text-decoration: none;">户外运动</a></li>
						<li style="display: inline;"><a href="searchByCategory/5" id="menu6" class="menu" style="color: #fff; text-decoration: none;">图书音像</a></li>
						<li style="display: inline;"><a href="searchByCategory/6" id="menu7" class="menu" style="color: #fff; text-decoration: none;">服装鞋帽</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 导航栏和轮播图 -->
		<div class="container-fluid">
			<div class="row">
				<!-- 导航栏 -->
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="border-left: #0172ba 1px solid; border-bottom: #0172ba 1px solid; padding: 0px; width: 12%;">
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="border-bottom: #eee 1px solid; padding:15px;">
						<!-- 手机数码 -->
						<div>
							<a href="searchByCategory/1" style="text-decoration: none; color: #0282d3; font-size: 16px;">手机数码</a>
						</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/1_1" style="text-decoration: none; color: #666;">手机</a></span>
							<span style="margin-right:10px"><a href="searchBySubCategory/1_2" style="text-decoration: none; color: #666;">相机</a></span>
							<span><a href="searchBySubCategory/1_3" style="text-decoration: none; color: #666;">耳机</a></span>
						</div>
					</div>
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="border-bottom: #eee 1px solid; padding:15px;">
						<!-- 电脑办公 -->
						<div>
							<a href="searchByCategory/2" style="text-decoration: none; color: #0282d3; font-size: 16px;">电脑办公</a>
						</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/2_1" style="text-decoration: none; color: #666;">笔记本</a></span>
							<span style="margin-right:10px"><a href="searchBySubCategory/2_2" style="text-decoration: none; color: #666;">平板</a></span>
						</div>
					</div>
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="border-bottom: #eee 1px solid; padding:15px;">
						<!-- 家用电器 -->
						<div>
							<a href="searchByCategory/3" style="text-decoration: none; color: #0282d3; font-size: 16px;">家用电器</a>
						</div>
						<div style="margin-top: 10px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/3_1" style="text-decoration: none; color: #666;">洗衣机</a></span>
							<span><a href="searchBySubCategory/3_2" style="text-decoration: none; color: #666;">冰箱</a></span>
						</div>
					</div>
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="border-bottom: #eee 1px solid; padding:15px;">
						<!-- 户外运动 -->
						<div>
							<a href="searchByCategory/4" style="text-decoration: none; color: #0282d3; font-size: 16px;">户外运动</a>
						</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/4_1" style="text-decoration: none; color: #666;">户外工具</a></span>
							<span style="margin-right:10px"><a href="searchBySubCategory/4_2" style="text-decoration: none; color: #666;">体育用品</a></span>
						</div>
					</div>
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="border-bottom: #eee 1px solid; padding:15px;">
						<!-- 图书音像 -->
						<div>
							<a href="searchByCategory/5" style="text-decoration: none; color: #0282d3; font-size: 16px;">图书音像</a>
						</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/5_1" style="text-decoration: none; color: #666;">书籍</a></span>
							<span style="margin-right:10px"><a href="searchBySubCategory/5_2" style="text-decoration: none; color: #666;">音乐</a></span>
						</div>
					</div>
					<div onmouseover="navmouover(this)" onmouseout="navmouout(this)" style="padding:15px;">
						<!-- 服装鞋帽 -->
						<div>
							<a href="searchByCategory/6" style="text-decoration: none; color: #0282d3; font-size: 16px;">服装鞋帽</a>
						</div>
						<div style="margin-top: 9px;">
							<span style="margin-right:10px"><a href="searchBySubCategory/6_1" style="text-decoration: none; color: #666;">婚纱</a></span>
							<span style="margin-right:10px"><a href="searchBySubCategory/6_2" style="text-decoration: none; color: #666;">礼服</a></span>
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
					<c:forEach items="${productList1}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
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
		<div class="container-fluid" style="margin-top: 35px;">
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
					<c:forEach items="${productList2}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
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
		<div class="container-fluid" style="margin-top: 35px;">
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
					<c:forEach items="${productList3}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
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
		<div class="container-fluid" style="margin-top: 35px;">
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
					<c:forEach items="${productList4}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
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
		<div class="container-fluid" style="margin-top: 35px;">
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
					<c:forEach items="${productList5}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
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
		<div class="container-fluid" style="margin-top: 35px; margin-bottom: 30px;">
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
					<c:forEach items="${productList6}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
							</a>
							<div style="float: left; color: #ed2441; padding: 5px 0px 2px 0px;">
								￥${product.rent } /
								<c:choose>
									<c:when test="${product.rentMode=='daily' }">
										天
									</c:when>
									<c:otherwise>
										月
									</c:otherwise>
								</c:choose>
							</div>
							<div style="clear: both;"></div>
							<div style="float: left;">
								<a class="productLink" onmouseover="productLinkMouseover(this)" onmouseout="productLinkMouseout(this)" href="productDetail/${product.extMap.orderId}">
									${fn:substring(product.productName,0,14)}
								</a>
							</div>
							<div style="clear: both;"></div>
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