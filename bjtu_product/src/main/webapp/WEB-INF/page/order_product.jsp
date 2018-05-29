<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<title>Insert title here</title>
</head>
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>

	<!-- 商品展示 -->
	<c:forEach items="${orderList}" var="order">
		<div style="float: left; width: 300px; height: 300px;">
			<%-- <a href="to_order_detail/${order.id}.do" class="thumbnail"> --%>
				<img src="upload/${order.shp_tp}" class="img-rounded" style="width: 250px; height: 200px" /> <br>
				${order.shp_mch}
			<!-- </a> -->
		</div>
	</c:forEach>

</body>
</html>