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
<title>商品发布</title>
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

		//加载分类
		$.getJSON("js/json/class.js", function(data) {
			$("#select_class").empty();
			$("#select_class").append("<option>请选择</option>")
			$(data).each(
					function(i, json) {
						$("#select_class").append(
								"<option value="+json.id+">" + json.flmch
										+ "</option>");
					});
		});
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

	//上传图片
	function image_click(index) {
		// 点击file对象
		$("#file_" + index).click();
	}

	function image_show(index) {
		var file = $("#file_" + index);

		var url = window.URL.createObjectURL(file[0].files[0]);

		$("#img_" + index).attr("src", url);

		var length = $("#image_append input").length;

		$("#show_num").html("您还可以继续上传" + (5 - index) + "张图片");

		if (index < 5 && index == length) {
			add_image(index);
		}

	}

	function add_image(index) {
		$("#image_append")
				.append(
						'<img id="img_'
								+ (index + 1)
								+ '" class="img-rounded" src="image/upload_hover.png" style="cursor:pointer;width: 250px; height: 250px" onclick="image_click('
								+ (index + 1) + ')" >');
		$("#image_append").append(
				'<input style="display:none;" id="file_' + (index + 1)
						+ '" type="file" name="files" onChange="image_show('
						+ (index + 1) + ')"/>');

	}
</script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="p_publish.do">发布闲置物品</a></li>
					<li><a href="product_index.do">首页</a></li>
					<c:if test="${user!=null}">
						<li><a href="userManage.do">欢迎登录:${user.yh_nch}</a></li>
						<li class="disabled"><a href="logout.do">登出</a></li>
					</c:if>
					<c:if test="${user==null}">
						<li class="disabled"><a href="tologin.do">登陆</a></li>
						<li class="disabled"><a href="toregist.do">注册</a></li>
					</c:if>
					<li><a href="#">消息</a></li>
					<li class="dropdown pull-right"><a href="#"
						data-toggle="dropdown" class="dropdown-toggle">下拉<strong
							class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">操作</a></li>
							<li><a href="#">设置栏目</a></li>
							<li><a href="#">更多设置</a></li>
							<li class="divider"></li>
							<li><a href="#">分割线</a></li>
						</ul></li>
				</ul>
				<div class="row-fluid">
				<form class="form-horizontal" action="publish.do" method="post" enctype="multipart/form-data">
				  <fieldset>
					<div class="span4">
					     <div id="legend" class="">
									<legend class=""><h3>上传图片</h3></legend>
					     </div>
					     <div class="control-group">
					            <label class="control-label"></label>
								<div id="image_append"  style="float: left; width: 300px; height: 300px;">
			                       <img id="img_1" class="img-rounded" src="image/upload_hover.png" style="cursor:pointer;width: 250px; height: 250px" onclick="image_click(1)">
		                           <input style="display:none;" id="file_1" type="file" name="files" onChange="image_show(1)"/>
		                        </div>
						</div>
					    
					</div>
					<div class="span4">
						
						<!-- <form class="form-horizontal" action="publish.do" method="post" enctype="multipart/form-data">
							<fieldset> -->
								<div id="legend" class="">
									<legend class=""><h3>发布闲置物品</h3></legend>
								</div>

								<div class="control-group">

									<!-- 物品名称-->
									<label class="control-label" for="input01">物品名称</label>
									<div class="controls">
										<input name="shp_mch" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 数量-->
									<label class="control-label" for="input01">数量</label>
									<div class="controls">
										<input name="shp_sl" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 使用年限-->
									<label class="control-label">使用年限</label>
									<div class="controls">
										<select name="shp_nx" class="input-xlarge">
											<option value="1">1年</option>
											<option value="2">2年</option>
											<option value="3">3年</option>
											<option value="5">5年以上</option>
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 物品分类 -->
									<label class="control-label">物品分类</label>
									<div class="controls">
										<select name="flbh" id="select_class" class="input-xlarge">
										</select>
									</div>

								</div>

								<!-- <div class="control-group">
								<label class="control-label">上传图片</label>
								<div id="image_append">
			                       <img id="img_1" width="100px" src="image/upload_hover.png" style="cursor:pointer;" onclick="image_click(1)">
		                           <input style="display:none;" id="file_1" type="file" name="files" onChange="image_show(1)"/>
		                        </div> 
									
								</div> -->

								<div class="control-group">

									<!-- 所在省 -->
									<label class="control-label">所在省</label>
									<div class="controls">
										<select name="province_id" id="select_province" onChange="province_change(this.value)" class="input-xlarge">
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 所在市 -->
									<label class="control-label">所在市</label>
									<div class="controls">
										<select name="city_id" id="select_city" onChange="city_change(this.value)" class="input-xlarge">
											<option></option>
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 所在区 -->
									<label class="control-label">所在区</label>
									<div class="controls">
										<select name="district_id" id="select_district" class="input-xlarge">
											<option></option>
										</select>
									</div>

								</div>

								<div class="control-group">

									<!-- 联系方式-->
									<label class="control-label" for="input01">联系方式</label>
									<div class="controls">
										<input name="lxfs" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 押金-->
									<label class="control-label" for="input01">押金</label>
									<div class="controls">
										<input name="shp_yj" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!--租赁开始时间-->
									<label class="control-label" for="input01">租赁开始时间</label>
									<div class="controls">
										<input id="test1" name="shp_qzsj" type="text" placeholder="" class="input-xlarge">
										
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 租赁结束时间-->
									<label class="control-label" for="input01">租赁结束时间</label>
									<div class="controls">
										<input id="test1" name="shp_jssj" type="text" placeholder="" class="input-xlarge">
										
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 租金-->
									<label class="control-label" for="input01">租金</label>
									<div class="controls">
										<input name="shp_zj" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 交易方式-->
									<label class="control-label" for="input01">交易方式</label>
									<div class="controls">
										<input name="shp_jyfs" type="text" placeholder="" class="input-xlarge">
										<p class="help-block"></p>
									</div>
								</div>

								<div class="control-group">

									<!-- 商品描述 -->
									<label class="control-label">商品描述</label>
									<div class="controls">
										<div class="textarea">
											<textarea name="shp_msh" type="" class=""> </textarea>
										</div>
									</div>
								</div>

								<div class="control-group">

									<!-- 损坏程度描述 -->
									<label class="control-label">损坏程度描述</label>
									<div class="controls">
										<div class="textarea">
											<textarea name="shp_sh" type="" class=""> </textarea>
										</div>
									</div>
								</div>
								
								<div class="control-group">
                                   <label class="control-label"></label>

                                    <!-- 发布按钮 -->
                                   <div class="controls">
                                       <button class="btn btn-success">发布</button>
                                   </div>
                                </div>

							<!-- </fieldset>
						</form> -->

					</div>
					</fieldset>
				</form>
					<div class="span4"></div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/layDate-v5.0.9/layDate-v5.0.9/laydate/laydate.js"></script>
	<script>
		//时间插件
		laydate.render({
			elem : '#test1'
		});
	</script>
</body>
</html>