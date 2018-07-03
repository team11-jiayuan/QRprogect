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
			a.productLink{
				text-decoration: none;
				color: #333;
			}
			.shadow{
				box-shadow: 0 0 2px 1px rgba(2,130,211,0.6);
			}
		</style>
		<script type="text/javascript">
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
		<jsp:include page="subheader.jsp" />
		<!-- header end -->
		<!-- 手机数码 -->
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row" style="margin-top: 5px;">
				<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1" style="padding: 10px 0px; width: 83%;">
					<c:forEach items="${productList}" var="product">
						<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 23%; height: 23%; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px; margin: 1%;">
							<a href="productDetail/${product.extMap.orderId}">
								<img src="/pic/${product.primaryImg }" style="width: 100%; height: 239px; border: 1px solid rgb(238, 238, 238);">
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
		<%-- <c:forEach items="${productList}" var="product">
			<div onmouseover="imouserover(this)" onmouseout="imouserout(this)" style="width: 25%; height: 257px; border: #f5f5f5 1px solid; float: left; text-align: center; padding: 0px 28px; border-radius: 3px;">
				<a href="productDetail/${product.extMap.orderId}">
					<img src="/pic/${product.primaryImg }" style="width: 200px; height: 200px; border: 1px solid rgb(238, 238, 238);">
				</a>
				<div style="float: left; color: #e4393c; padding: 5px 0px 2px 0px;">
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
		</c:forEach> --%>
		
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