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
<title>userManage</title>
</head>
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<form action="updateUser.do" method="post">
用户基本资料<br>
用户名：<input type="text" value="${user.yh_nch }" disabled="true"><br>
所在地：<input type="text" disabled="true" value="${province.provinceName }-${city.cityName }-${district.districtName}"><br>

姓    名：<input type="text" name="yh_xm" value="${user.yh_xm }"><br>
身份证号：<input type="text" name="yh_sfzh" value="${user.yh_sfzh }"><br>
手机号：<input type="text" name="phone" value="${phone }"><br>
邮箱：<input type="text" name="yh_yx" value="${user.yh_yx  }"><br>

<input type="submit" value="保存信息">   

</form>
</body>
</html>