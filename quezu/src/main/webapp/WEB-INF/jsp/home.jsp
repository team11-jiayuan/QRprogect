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
		<title>个人中心</title>
		<style type="text/css">
			/**“个人中心首页”链接默认样式**/
			a.link_01{
				text-decoration: none;
				color: #666;
				font-size: 16px;
			}
			/**“个人中心首页”链接鼠标移入时样式**/
			a.link_01:hover{
				color: #0282d3;
			}
			/**导航栏样式**/
			div.navigation{
				padding: 13px 0px;
			}
			span.navigation{
				color: #333;
				font-size: 14px;
				display: block;
				margin: 7px 0px;
			}
			span.navigation:first-child{
				font-size: 16px;
			}
			/**导航栏分隔线样式**/
			div.separator{
				margin: 0px 20px;
				border-bottom: RGB(238,238,238) 2px solid;
			}
			/**导航链接鼠标移入时边框样式**/
			.nav_border{
				border-left: #0282d3 2px solid;
			}
			/**导航链接访问后边框样式**/
			span.visited{
				border-left: #0282d3 2px solid;
			}
			/**导航链接默认样式**/
			a.nav_link{
				text-decoration: none;
				color: #666;
			}
			/**导航链接鼠标移入时样式**/
			a.nav_link:hover{
				color: #0282d3;
			}
			/**导航链接访问后样式**/
			a.visited{
				color: #0282d3;
			}
			/**iframe样式**/
			.myiframe{
				border-width: 0px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				/**导航栏鼠标移入和移出样式**/
				$("#nav_link1").mouseover(function(){
					$("#nav_link1").addClass("nav_border");
				});
				$("#nav_link1").mouseout(function(){
					$("#nav_link1").removeClass("nav_border");
				});
				$("#nav_link2").mouseover(function(){
					$("#nav_link2").addClass("nav_border");
				});
				$("#nav_link2").mouseout(function(){
					$("#nav_link2").removeClass("nav_border");
				});
				$("#nav_link3").mouseover(function(){
					$("#nav_link3").addClass("nav_border");
				});
				$("#nav_link3").mouseout(function(){
					$("#nav_link3").removeClass("nav_border");
				});
				$("#nav_link4").mouseover(function(){
					$("#nav_link4").addClass("nav_border");
				});
				$("#nav_link4").mouseout(function(){
					$("#nav_link4").removeClass("nav_border");
				});
				$("#nav_link5").mouseover(function(){
					$("#nav_link5").addClass("nav_border");
				});
				$("#nav_link5").mouseout(function(){
					$("#nav_link5").removeClass("nav_border");
				});
				$("#nav_link6").mouseover(function(){
					$("#nav_link6").addClass("nav_border");
				});
				$("#nav_link6").mouseout(function(){
					$("#nav_link6").removeClass("nav_border");
				});
			});
			/**iframe高度自适应**/
			function changeFrameHeight(){
				document.getElementById("iframe").height=0;  
			    document.getElementById("iframe").height=document.getElementById("iframe").contentWindow.document.body.scrollHeight;
			}
		</script>
	</head>
	<body>
		<!-- header start -->
		<jsp:include page="header.jsp" />
		<!-- header end -->
		<!-- logo -->
		<div class="container-fluid">
			<div class="row" style="padding: 20px 0px; border-bottom: #e0e0e0 4px solid;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
					<a href="index"><img class="img-responsive" width="180px" src="img/logo.png" ></a>
				</div>
				<div class="col-xs-7 col-sm-7 col-md-7 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-0" style="padding-top: 2.2%">
					<!-- <div style="float: left;">
						<a href="myHome" class="link_01">个人中心首页</a>
					</div> -->
					<div style="float: left; margin-left: 5%;">
						<a href="publish" class="link_01">发布闲置物品</a>
					</div>
					<div  style="clear: both;"></div>
				</div>
			</div>
		</div>
		<div class="container-fluid" style="background-color: RGB(245,245,245); margin-bottom: 20px;">
			<div class="row" style="margin-top: 25px; margin-bottom: 50px;">
				<!-- 导航菜单 -->
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px; background-color: RGB(255,255,255); width: 11%; text-align: center;">
					<div class="navigation">
						<span class="navigation" style="cursor: default">账户信息</span>
						<c:choose>
							<c:when test="${toPage=='basicInformation' }">
								<span id="nav_link1" class="navigation visited">
									<a href="myInformation" id="link1" class="nav_link visited">个人信息</a>
								</span>
							</c:when>
							<c:otherwise>
								<span id="nav_link1" class="navigation">
									<a href="myInformation" id="link1" class="nav_link">个人信息</a>
								</span>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 分隔线 -->
					<div class="separator"></div>
					<div class="navigation">
						<span class="navigation" style="cursor: default">我的订单</span>
						<c:choose>
							<c:when test="${toPage=='rent' }">
								<span id="nav_link4" class="navigation visited">
									<a href="myRent" id="link4" class="nav_link visited">我的租赁</a>
								</span>
							</c:when>
							<c:otherwise>
								<span id="nav_link4" class="navigation">
									<a href="myRent" id="link4" class="nav_link">我的租赁</a>
								</span>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${toPage=='rentOut' }">
								<span id="nav_link5" class="navigation visited">
									<a href="myRentOut" id="link5" class="nav_link visited">我的出租</a>
								</span>
							</c:when>
							<c:otherwise>
								<span id="nav_link5" class="navigation">
									<a href="myRentOut" id="link5" class="nav_link">我的出租</a>
								</span>
							</c:otherwise>
						</c:choose>
						<%-- <c:choose>
							<c:when test="${toPage=='focus' }">
								<span id="nav_link6" class="navigation visited">
									<a href="myFocus" id="link6" class="nav_link visited">我的关注</a>
								</span>
							</c:when>
							<c:otherwise>
								<span id="nav_link6" class="navigation">
									<a href="myFocus" id="link6" class="nav_link">我的关注</a>
								</span>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<!-- iframe -->
				<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
					<iframe id="iframe" class="myiframe" src="${toPage }" scrolling="no" name="content" onload="changeFrameHeight()" width="100%"></iframe>
				</div>
			</div>
		</div>
		<!-- footer start -->
		<jsp:include page="footer.jsp" />
		<!-- footer end -->
	</body>
</html>