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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商品主页</title>
</head>

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	    //加载分类
		$.getJSON("js/json/class.js", function(data) {
			$(data).each(
					function(i, json) {
						$("#index_class").append(
								"<li value="+json.id+"><a href='searchProduct/"+json.id+"/"+json.flmch+".do'>"+json.flmch+"</a></li>");
					});
		});
});
</script>
<body>
<c:if test="${user!=null}">
    	欢迎登录:<a href="userManage.do">${user.yh_nch}</a>  <a href="logout.do">登出</a>
    </c:if>
    <c:if test="${user==null}">
    	<a href="tologin.do">登陆</a>   <a href="toregist.do">注册</a>
    </c:if>
    
    <br>
    <a href="p_publish.do">发布商品</a><br>
    
    <ul id="index_class"></ul>
    <br>
    <h1>${flmch}</h1>
    <c:forEach items="${products}" var="product">
			<div style="float:left;width:250px;height:300px;">
			  <a href="to_product_detail/${product.id}.do">
				<img src="upload/${product.shp_tp}" style="width:150px;height:150px"/>
				<br>				
				${product.shp_mch}<br>
			  </a>
			</div>
	</c:forEach>
	
	<c:forEach items="${all_product}" var="product">
			<div style="float:left;width:250px;height:300px;">
			  <a href="to_product_detail/${product.id}.do">
				<img src="upload/${product.shp_tp}" style="width:150px;height:150px"/>
				<br>				
				${product.shp_mch}<br>
			  </a>
			</div>
	</c:forEach>

</body>


</html>