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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link
	href="js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
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
								"<option value="+json.ProvinceID+">"
										+ json.ProvinceName + "</option>");
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
						$("#select_city").append(
								"<option value="+json.CityID+">"
										+ json.CityName + "</option>");
					});
		});
	}

	function city_change(city_id) {
		$.getJSON("js/json/district_" + city_id + ".js", function(data) {
			$("#select_district").empty();
			$("#select_district").append("<option>请选择</option>")
			$(data).each(
					function(i, json) {
						$("#select_district").append(
								"<option value="+json.DistrictID+">"
										+ json.DistrictName + "</option>");
					});
		});
	}
</script>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
				<li class="active">
					<a href="product_index.do">快租网</a>
				</li>
				<li>
					<a href="product_index.do">首页</a>
				</li>
				<li class="disabled">
					<a href="tologin.do">登陆</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">操作</a>
						</li>
						<li>
							<a href="#">设置栏目</a>
						</li>
						<li>
							<a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
				<div class="row-fluid">
					<div class="span4">
						<h3></h3>
					</div>
					<div class="span4">
						<h3>欢迎注册</h3>

						<form class="form-horizontal" action="addUser.do" method="post">
							<fieldset>
								<div id="legend" class=""></div>
								<div class="control-group">

									<!-- 用户名-->
									<label class="control-label" for="input01">用户名</label>
									<div class="controls">
										<input name="yh_nch" type="text" placeholder="字母+数字"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 密码-->
									<label class="control-label" for="input01">密码</label>
									<div class="controls">
										<input name="yh_mm" type="password" placeholder="字母+数字"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 真实姓名-->
									<label class="control-label" for="input01">真实姓名</label>
									<div class="controls">
										<input name="yh_xm" type="text" placeholder="请填写您的真实姓名"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 身份证号-->
									<label class="control-label" for="input01">身份证号</label>
									<div class="controls">
										<input name="yh_sfzh" type="text" placeholder="请填写您的真实身份证号"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>



								<div class="control-group">

									<!-- 省下拉框 -->
									<label class="control-label">所在省</label>
									<div class="controls">
										<select name="province_id" id="select_province"
											onChange="province_change(this.value)" class="input-xlarge">
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 市下拉框 -->
									<label class="control-label">所在市</label>
									<div class="controls">
										<select name="city_id" id="select_city"
											onChange="city_change(this.value)" class="input-xlarge">
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 区下拉框 -->
									<label class="control-label">所在区</label>
									<div class="controls">
										<select name="district_id" id="select_district"
											class="input-xlarge">
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 邮箱t-->
									<label class="control-label" for="input01">邮箱</label>
									<div class="controls">
										<input name="yh_yx" type="text" placeholder="*****@***.com"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 手机号-->
									<label class="control-label" for="input01">手机号</label>
									<div class="controls">
										<input name="phone" type="text" placeholder="1*********8"
											class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label"></label>
									<div class="controls">

										<!-- Multiple Checkboxes -->
										<label class="checkbox"> <input type="checkbox"
											value="Option one"> 我已认真阅读，并愿意遵守《快租网用户协议》
										</label> 
									</div>

								</div>
								<div class="control-group">
									<label class="control-label"></label>

									<!-- 注册按钮 -->
									<div class="controls">
										<button class="btn btn-success">注册</button>
									</div>
								</div>

							</fieldset>
						</form>

					</div>
					<div class="span4">
						<h3></h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p>
		<a>关于我们</a>|<a>联系我们</a>|<a>服务条款</a>|<a>隐私条款</a>
	</p>
</body>
</html>