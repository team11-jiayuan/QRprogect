<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.quezu.pojo.User"%>
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
		<title>基本信息</title>
		<style type="text/css">
			label.control-label{
				font-weight: normal;
				padding-right: 0px;
			}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				//读取省、市、区ID
				var provinceID = '<%=(String)((User)session.getAttribute("currentUser")).getProvinceID() %>';
				var cityID = '<%=(String)((User)session.getAttribute("currentUser")).getCityID() %>';
				var districtID = '<%=(String)((User)session.getAttribute("currentUser")).getDistrictID() %>';
				//加载省
				$.getJSON("js/json/s_province.js", function(data){
					$(data).each(function(i, json){
						if(provinceID == json.ProvinceID){
							$("#provinceID").append("<option value="+json.ProvinceID+" selected='selected'>"+json.ProvinceName+"</option>");
							return true;
						}
						$("#provinceID").append("<option value="+json.ProvinceID+">"+json.ProvinceName+"</option>");
					});
				});
				//如果省ID不为空，加载市
				if(provinceID != "null" && provinceID != ""){
					$.getJSON("js/json/city_"+provinceID+".js", function(data){
						$(data).each(function(i, json){
							if(cityID == json.CityID){
								$("#cityID").append("<option value="+json.CityID+" selected='selected'>"+json.CityName+"</option>");
								return true;
							}
							$("#cityID").append("<option value="+json.CityID+">"+json.CityName+"</option>");
						});
					});
				}
				//如果市ID不为空，加载区
				if(cityID != "null" && cityID != ""){
					$.getJSON("js/json/district_"+cityID+".js", function(data){
						$(data).each(function(i, json){
							if(districtID == json.DistrictID){
								$("#districtID").append("<option value="+json.DistrictID+" selected='selected'>"+json.DistrictName+"</option>");
								return true;
							}
							$("#districtID").append("<option value="+json.DistrictID+">"+json.DistrictName+"</option>");
						});
					});
				}
				//省改变时，重新加载市，并清空区
				$("#provinceID").change(function(){
					var provinceID = $("#provinceID").val();
					$("#cityID").empty();
					$("#districtID").empty();
					$("#cityID").append("<option value=''>请选择</option>");
					$("#districtID").append("<option value=''>请选择</option>");
					$.getJSON("js/json/city_"+provinceID+".js", function(data){
						$(data).each(function(i, json){
							$("#cityID").append("<option value="+json.CityID+">"+json.CityName+"</option>");
						});
					});
				});
				//市改变时，重新加载区
				$("#cityID").change(function(){
					var cityID = $("#cityID").val();
					$("#districtID").empty();
					$("#districtID").append("<option value=''>请选择</option>");
					$.getJSON("js/json/district_"+cityID+".js", function(data){
						$(data).each(function(i, json){
							$("#districtID").append("<option value="+json.DistrictID+">"+json.DistrictName+"</option>");
						});
					});
				});
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					<!-- 表单区域 -->
					<form class="form-horizontal" action="updateUser" method="post">
						<div class="form-group">
							<label for="userName" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">用户名：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="userName" name="userName" value="${sessionScope.currentUser.userName }" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="realName" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">真实姓名：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="realName" name="realName" value="${sessionScope.currentUser.realName }">
							</div>
						</div>
						<div class="form-group">
							<label for="sex" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">性别：</label>
							<div class="col-sm-9">
								<c:choose>
									<c:when test="${sessionScope.currentUser.sex=='female' }">
										<label class="radio-inline">
											<input type="radio" name="sex" id="male" value="male"> 男
										</label>
										<label class="radio-inline">
											<input type="radio" name="sex" id="female" value="female" checked> 女
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline">
											<input type="radio" name="sex" id="male" value="male" checked> 男
										</label>
										<label class="radio-inline">
											<input type="radio" name="sex" id="female" value="female"> 女
										</label>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group">
							<label for="IDNumber" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">身份证号：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="IDNumber" name="IDNumber" value="${sessionScope.currentUser.IDNumber }">
							</div>
						</div>
						<div class="form-group">
							<label for="phoneNumber" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">手机号：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.currentUser.phoneNumber }">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">邮箱：</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="email" name="email" value="${sessionScope.currentUser.email }">
							</div>
						</div>
						<div class="form-group">
							<label for="provinceID" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">所在省：</label>
							<div class="col-sm-9">
								<select class="form-control" name="provinceID" id="provinceID">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="cityID" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">所在市：</label>
							<div class="col-sm-9">
								<select class="form-control" name="cityID" id="cityID">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="districtID" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label">所在区：</label>
							<div class="col-sm-9">
								<select class="form-control" name="districtID" id="districtID">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"></label>
							<div class="col-sm-9">
								<input type="submit" class="btn btn-primary" style="width: 100%;" value="提 交" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>