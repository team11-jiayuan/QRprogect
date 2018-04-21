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
	function image_click(index){
		// 点击file对象
	    $("#file_"+index).click();		
	}
	
	function image_show(index){
	    var file = $("#file_"+index);
	    
	    var url = window.URL.createObjectURL(file[0].files[0]);
	    
	    $("#img_"+index).attr("src",url);
	    
	    var length = $("#image_append input").length;
	    
	    $("#show_num").html("您还可以继续上传"+(5-index)+"张图片");
	    
	    if(index<5&&index==length){
	    	spu_publish_add_image(index);
	    }

	}
	
	function spu_publish_add_image(index){
		$("#image_append").append('<img id="img_'+(index+1)+'" width="100px" src="image/upload_hover.png" style="cursor:pointer;" onclick="image_click('+(index+1)+')">');
		$("#image_append").append('<input style="display:none;" id="file_'+(index+1)+'" type="file" name="files" onChange="image_show('+(index+1)+')"/>');
		
	}
	
	
</script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
	<form action="publish.do" method="post" enctype="multipart/form-data">

		物品名称:<input type="text" name="shp_mch" /><br> 
		数量:<input type="text" name="shp_sl" /><br> 
		使用年限:<select name="shp_nx">
			<option value="1">1年</option>
			<option value="2">2年</option>
			<option value="3">3年</option>
			<option value="5">5年以上</option>
		</select><br> 
		
		
		物品分类:<select name="flbh" id="select_class"></select> 
		损坏处:<input type="text" name="shp_sh" /><br> 
		商品照片:<div id="show_num"></div><br>
		<div id="image_append">
			<img id="img_1" width="100px" src="image/upload_hover.png" style="cursor:pointer;" onclick="image_click(1)">
		    <input style="display:none;" id="file_1" type="file" name="files" onChange="image_show(1)"/>
		</div> 
		物品所在地区 ：
		<!-- 省下拉框 -->
		<select name="province_id" id="select_province" onChange="province_change(this.value)">
		</select> 
		
		<!-- 市下拉框 -->
		<select name="city_id" id="select_city" onChange="city_change(this.value)">
		</select>
		
		<!-- 区下拉框 -->
		<select name="district_id" id="select_district"></select> <br>


		联系方式：<input type="text" name="lxfs" /><br> 
		押金：<input type="text" name="shp_yj" /><br> 
		租赁时间：<input type="text" name="shp_qzsj" id="test1"/>--<input type="text" name="shp_jssj" id="test1"/><br>
		 租金：<input type="text" name="shp_zj" /><br> 
		 交易方式：<input type="text" name="shp_jyfs" /><br>
		商品描述：<input type="text" name="shp_msh" /><br> 
		<input type="submit" value="发布" />
	</form>
	
<script src="js/layDate-v5.0.9/layDate-v5.0.9/laydate/laydate.js"></script>
<script>
//时间插件
laydate.render({
	  elem: '#test1'
	});
</script>
</body>
</html>