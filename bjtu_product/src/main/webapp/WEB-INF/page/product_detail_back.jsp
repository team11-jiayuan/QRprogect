<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>商品详情</title>
</head>
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<div style="background-color: #f3f3f3;">
		<div>
		<div  style="display:inline-block">
		 <li rowspan = "6"><img src="upload/${object_product.product.shp_tp}"
				style="width: 150px; height: 150px" /></li>
		</div>
		<div style="display:inline-block">
		 <ul>
	        <li>商品名称： ${object_product.product.shp_mch }</li>
			<li>押 金：${object_product.shp_yj }</li>
			 <li>租赁价格： ${object_product.shp_zj }</li>
			<li>数 量： ${object_product.shp_sl }</li>
			<li>租赁时间：<input type="text"></li>
			<li><form action=""> <input type="submit"
					value="确认租赁">
			</form></li>
			</ul>
		</div>
		
		  
		</div>
		<div>
		<hr>			
		<c:forEach items="${object_product.images}" var="image">
				<div style="float: left; width: 250px; height: 300px;">
					<img src="upload/${image.url}" style="width: 150px; height: 150px" />
					<br>
				</div>
			</c:forEach>
		</div>
		<div>
			商品详情：<br> 
			使用年限： ${object_product.shp_nx }<br> 
			物品分类： <br>
			损 坏 处： ${object_product.shp_sh }<br> 
			租赁时间：${object_product.shp_qzsj}--${object_product.shp_jssj}<br> 
			租赁方式：${object_product.shp_jyfs }<br> 
			联系方式： ${object_product.lxfs }<br>
			商品描述： ${object_product.shp_msh }<br>
		</div>

	</div>
</body>
</html>