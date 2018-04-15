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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		//加载省
		$.getJSON("js/json/s_province.js", function(data) {
			$("#select_province").append("<option>请选择</option>");
			$("#select_city").append("<option>请选择</option>");
			$("#select_district").append("<option>请选择</option>");
			$(data).each(
					function(i, json) {
						$("#select_province").append(
								"<option value="+json.ProvinceID+">" + json.ProvinceName
										+ "</option>");
					});
		});
	});
	
	//当省的下拉框值改变时加载对应的市、区
	function province_change(province_id) {

		// 根据province_id加载市信息
		$.getJSON("js/json/city_" + province_id + ".js", function(data) {
			$("#select_city").empty();
			$("#select_city").append("<option>请选择</option>")
			$(data).each(
					function(i, json) {
						$("#select_city").append("<option value="+json.CityID+">" + json.CityName+ "</option>");
					});
		});
	}
	
	function city_change(city_id){
		$.getJSON("js/json/district_" + city_id + ".js", function(data) {
			$("#select_district").empty();
			$("#select_district").append("<option>请选择</option>")
			$(data).each(
					function(i, json) {
						$("#select_district").append("<option value="+json.DistrictID+">" + json.DistrictName+ "</option>");
					});
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<form action="addUser.do" method="post">
	    <!-- 省下拉框 -->
		<select name="province_id" id="select_province" onChange="province_change(this.value)">
		</select> <br> 
		
		<!-- 市下拉框 -->
		<select name="city_id" id="select_city" onChange="city_change(this.value)">
		</select> <br>
		
		<!-- 区下拉框 -->
		<select name="district_id" id="select_district"></select> <br>

		用户名:<input type="text" name="yh_nch" /><br> 
		密码:<input type="text" name="yh_mm" /><br> 
		真实姓名:<input type="text" name="yh_xm" /><br> 
		身份证号:<input type="text" name="yh_sfzh" /><br> 
		邮箱:<input type="text" name="yh_yx" /><br> 
		手机号:<input type="text" name="phone" /><br> 
 	
		<input type="submit" value="注册" />
	</form>
</body>
</html>