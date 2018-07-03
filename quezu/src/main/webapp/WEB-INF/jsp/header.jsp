<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#toHomePage").mouseover(function(){
			$("#homePage").css("color", "#0282d3");
		});
		$("#toHomePage").mouseout(function(){
			$("#homePage").css("color", "#999");
		});
		$("#location").mouseover(function(){
			$("#location_div").css("color", "#0282d3");
		});
		$("#location").mouseout(function(){
			$("#location_div").css("color", "#999");
		});
	});
</script>

<style type="text/css">
	/**导航链接默认样式**/
	a.link{
		text-decoration: none;
		font-size: 13px;
		margin-right: 15px;
		color: #999;
	}
	/**导航链接鼠标移入时样式**/
	a.link:hover {
		color: #0282d3;
	}
</style>
<div class="container-fluid" style="height: 30px; background-color: #f2f2f2; border-bottom: 1px solid #dddddd;">
	<div class="row">
		<!-- 位置信息 -->
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 col-xs-offset-1 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 4px 0px 0px 0px;">
			<a id="location" href="javascript:void(0)">
				<span style="display: block; float: left; margin-right: 5px;">
					<img src="img/position.png" width="11px" />
				</span>
				<span id="location_div" style="display: block; color: #999; font-size: 13px; float: left; padding-top: 2px;">北京</span>
			</a>
			<div style="clear: both;"></div>
		</div>
		<!-- 首页链接 -->
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding: 5px 0px 0px 0px;">
			<a id="toHomePage" href="index">
				<span style="display: block; float: left; margin-right: 5px;">
					<img src="img/home.png" width="15px" />
				</span>
				<span id="homePage" style="display: block; color: #999; font-size: 13px; float: left; padding-top: 1px;">快租首页</span>
			</a>
			<div style="clear: both;"></div>
		</div>
		<!-- 导航链接 -->
		<div class="col-xs-8 col-sm-7 col-md-6 col-lg-5 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-2" style="padding-top: 5px;">
			<c:choose>
				<c:when test="${sessionScope.currentUser==null }">
					<a class="link" href="login">请登录</a>
					<a class="link" href="register">免费注册</a>
				</c:when>
				<c:otherwise>
					<a class="link" href="myHome">欢迎您：${sessionScope.currentUser.userName }</a>
					<a class="link" href="signOut">退出</a>
				</c:otherwise>
			</c:choose>
			<span style="margin-right: 15px; color: #999;">|</span>
			<a class="link" href="myHome">个人中心</a>
			<a class="link" href="myOrder">我的订单</a>
			<a class="link" href="myFocus">我的关注</a>
		</div>
	</div>
</div>