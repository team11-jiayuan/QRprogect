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
			span.baseLabel{
				display: block;
				text-align: right;
				padding-top: 7px;
				cursor: default;
			}
			div.clearFloat{
				clear: both;
			}
			div.myRow{
				width: 100%;
				margin-bottom: 20px;
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
			//点击上传头像按钮
			function image_click() {
				$("#file").click();
			}
			function image_show() {
				var file = $("#file");
				var url = window.URL.createObjectURL(file[0].files[0]);
				$("#img").attr("src", url);
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4" style="padding: 15px; text-align: center">
					<span style="font-size: 22px; cursor: default;">个人信息</span>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row" style="padding: 30px 30px;">
				<form action="updateUser" method="post" enctype="multipart/form-data">
					<div style="width: 50%; float: left;">
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">用户名：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="userName" name="userName" value="${sessionScope.currentUser.userName }" disabled>
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">真实姓名：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="realName" name="realName" value="${sessionScope.currentUser.realName }">
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel" style="padding-top: 0px;">性别：</span>
							</div>
							<div style="width: 75%; float: left;">
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
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">身份证号：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="IDNumber" name="IDNumber" value="${sessionScope.currentUser.IDNumber }">
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">手机号：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.currentUser.phoneNumber }">
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">邮箱：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="email" name="email" value="${sessionScope.currentUser.email }">
							</div>
							<div class="clearFloat"></div>
						</div>
					</div>
					<!-- 上传图片区域 -->
					<div style="padding-left:36px; width: 50%; height: 310px; float: left; text-align: center;">
						<span style="font-size: 18px; color: #333; display: block; margin-bottom: 15px; cursor: default;">头像照片</span>
						<div style="width: 362px; text-align: center;">
							<div id="upload1">
								<c:choose>
									<c:when test="${sessionScope.currentUser.photograph=='photograph.png' }">
										<img id="img" onclick="image_click()" src="img/photograph.png" style="cursor:pointer; width: 110px; height: 110px; border-radius:110px;">
									</c:when>
									<c:otherwise>
										<img id="img" onclick="image_click()" src="/pic/${sessionScope.currentUser.photograph }" style="cursor:pointer; width: 110px; height: 110px; border-radius:110px;">
									</c:otherwise>
								</c:choose>
								<input id="file" onChange="image_show()" type="file" name="files" style="display: none;"/>
							</div>
						</div>
					</div>
					<div class="clearFloat"></div>
					<!-- 地址 -->
					<div class="myRow">
						<div style="width: 12.5%; float: left;">
							<span class="baseLabel">所在地区：</span>
						</div>
						<div style="width: 25%; float: left; padding-right: 3%">
							<select class="form-control" name="provinceID" id="provinceID">
								<option value="">请选择</option>
							</select>
						</div>
						<div style="width: 25%; float: left; padding-right: 3%">
							<select class="form-control" name="cityID" id="cityID">
								<option value="aa">请选择</option>
							</select>
						</div>
						<div style="width: 25%; float: left; padding-right: 3%">
							<select class="form-control" name="districtID" id="districtID">
								<option value="dd">请选择</option>
							</select>
						</div>
						<div class="clearFloat"></div>
					</div>
					<div class="myRow" style="text-align: center; margin-top: 25px;">
						<input type="submit" class="btn btn-primary" style="width: 35%;" value="提交" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>