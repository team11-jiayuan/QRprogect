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
		<title>发布物品</title>
		<style type="text/css">
			span.baseLabel{
				display: block;
				text-align: right;
				padding-top: 7px;
				cursor: default;
			}
			span.textareaLabel{
				display: block;
				text-align: right;
				padding-top: 25px;
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
				//加载分类
				$.getJSON("js/json/category.js", function(data) {
					$(data).each(function(i, json){
						$("#category").append("<option value="+json.id+">"+json.item+"</option>");
					});
				});
				//加载子类subCategory
				$("#category").change(function(){
					var categoryid = $("#category").val();
					$("#subCategory").empty();
					$("#subCategory").append("<option value=''>请选择</option>");
					$.getJSON("js/json/sub_category_"+categoryid+".js", function(data){
						$(data).each(function(i, json){
							$("#subCategory").append("<option value="+json.id+">"+json.item+"</option>");
						});
					});
				});
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
				//选择租赁方式
				$("#rentMode").change(function(){
					var rentMode = $("#rentMode").val();
					if(rentMode == "daily"){
						$("#daily").show();
						$("#monthly").hide();
					}else{
						$("#daily").hide();
						$("#monthly").show();
					}
				});
			});
			//点击上传图片按钮
			function image_click(index) {
				$("#file_"+index).click();
			}
			function image_show(index) {
				var file = $("#file_"+index);
				var url = window.URL.createObjectURL(file[0].files[0]);
				$("#img_"+index).attr("src", url);
				add_image(index);
			}
			function add_image(index) {
				$("#upload"+(index+1)).show();
			}
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4" style="padding: 15px; text-align: center">
					<span style="font-size: 22px; cursor: default;">发布闲置物品</span>
				</div>
			</div>
			<div class="row" style="height: 15px; background-color: RGB(245,245,245)"></div>
			<div class="row" style="padding: 30px 30px;">
				<!-- 表单区域 -->
				<form class="form-horizontal" action="publishProduct" method="post" enctype="multipart/form-data">
					<div style="width: 50%; float: left;">
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">物品名称：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="productName" name="productName" value="">
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="textareaLabel">物品描述：</span>
							</div>
							<div style="width: 75%; float: left;">
								<textarea class="form-control" rows="3" id="description" name="description"></textarea>
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">物品分类：</span>
							</div>
							<div style="width: 75%; float: left;">
								<select class="form-control" name="category" id="category">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">所属子类：</span>
							</div>
							<div style="width: 75%; float: left;">
								<select class="form-control" name="subCategory" id="subCategory">
									<option value="">请选择</option>
								</select>
							</div>
							<div class="clearFloat"></div>
						</div>
						<div class="myRow">
							<div style="width: 25%; float: left;">
								<span class="baseLabel">押金：</span>
							</div>
							<div style="width: 75%; float: left;">
								<input type="text" class="form-control" id="deposit" name="deposit" value="">
							</div>
							<div class="clearFloat"></div>
						</div>
					</div>
					<!-- 上传图片区域 -->
					<div style="padding-left:36px; width: 50%; height: 310px; float: left; text-align: center;">
						<span style="font-size: 16px; color: #333; display: block; margin-bottom: 10px; cursor: default;">上传物品图片</span>
						<div style="border: #ccc 1px solid; width: 362px;">
							<div id="upload1" style="width: 100px; height: 100px; float: left; margin: 15px 0px 15px 15px;">
								<img id="img_1" onclick="image_click(1)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_1" onChange="image_show(1)" type="file" name="files" style="display: none;"/>
							</div>
							<div id="upload2" style="display:none; width: 100px; height: 100px; float: left; margin: 15px 0px 15px 15px;">
								<img id="img_2" onclick="image_click(2)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_2" onChange="image_show(2)" type="file" name="files" style="display: none;"/>
							</div>
							<div id="upload3" style="display:none; width: 100px; height: 100px; float: left; margin: 15px 0px 15px 15px;">
								<img id="img_3" onclick="image_click(3)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_3" onChange="image_show(3)" type="file" name="files" style="display: none;"/>
							</div>
							<div class="clearFloat"></div>
							<div id="upload4" style="display:none; width: 100px; height: 100px; float: left; margin: 0px 0px 15px 15px;">
								<img id="img_4" onclick="image_click(4)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_4" onChange="image_show(4)" type="file" name="files" style="display: none;"/>
							</div>
							<div id="upload5" style="display:none; width: 100px; height: 100px; float: left; margin: 0px 0px 15px 15px;">
								<img id="img_5" onclick="image_click(5)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_5" onChange="image_show(5)" type="file" name="files" style="display: none;"/>
							</div>
							<div id="upload6" style="display:none; width: 100px; height: 100px; float: left; margin: 0px 0px 15px 15px;">
								<img id="img_6" onclick="image_click(6)" src="img/upload.png" style="cursor:pointer; width: 100px; height: 100px;">
								<input id="file_6" onChange="image_show(6)" type="file" name="files" style="display: none;"/>
							</div>
							<div class="clearFloat"></div>
						</div>
					</div>
					<div class="clearFloat"></div>
					<div class="myRow">
						<div style="width: 12.5%; float: left;">
							<span class="baseLabel">租赁方式：</span>
						</div>
						<div style="width: 37.5%; float: left;">
							<select id="rentMode" class="form-control" name="rentMode">
								<option value="daily">日租</option>
								<option value="monthly">月租</option>
							</select>
						</div>
						<div id="daily" style="width: 12.5%; float: left;">
							<span class="baseLabel">日租金：</span>
						</div>
						<div id="monthly" style="width: 12.5%; float: left; display: none;">
							<span class="baseLabel">月租金：</span>
						</div>
						<div style="width: 37.5%; float: left;">
							<input type="text" class="form-control" id="rent" name="rent" value="">
						</div>
						<div class="clearFloat"></div>
					</div>
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
					<div class="myRow" style="text-align: center; margin-top: 30px;">
						<input type="submit" class="btn btn-primary" style="width: 35%;" value="立 即 发 布" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>