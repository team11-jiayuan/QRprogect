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
<title>用户信息</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<link href="js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link
	href="js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="userManage.do">用户基本资料</a></li>
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
					<div class="span4"></div>
					<div class="span4">
						<c:if test="${user.yh_tx==null}">
							<img id="img_t" alt="140x140" src="image/head.jpg"
								class="img-circle" style="width: 80px; height: 80px;" />
						</c:if>

						<c:if test="${user.yh_tx!=null}">
							<img id="img_t" alt="140x140" src="upload/${user.yh_tx }"
								class="img-circle" style="width: 80px; height: 80px;" />
						</c:if>
						<dl>
							<dt>用户名</dt>
							<dd>${user.yh_nch }</dd>
							<dt>所在地</dt>
							<dd>${province.provinceName }-${city.cityName }-${district.districtName}
							</dd>
							<dd></dd>
							<dt>真实姓名</dt>
							<dd>${user.yh_xm }</dd>
							<dt>身份证号</dt>
							<dd>${user.yh_sfzh }</dd>
							<dt>手机号</dt>
							<dd>${phone }</dd>
							<dt>邮箱</dt>
							<dd>${user.yh_yx  }</dd>

						</dl>
						<button class="btn btn-info" id="update_button">修改信息</button>
						<button class="btn btn-info" id="upload_button">上传头像</button>

					</div>
					<div class="span4"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改用户信息的模态框 -->
	<div class="modal fade" id="updateUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="updateUser.do" method="post">
						<fieldset>
							<div id="legend" class=""></div>
							<br>

							<div class="control-group">

								<!-- 用户名-->
								<label class="control-label" for="input01">用户名</label>
								<div class="controls">
									<input disabled="true" name="yh_nch" type="text"
										value="${user.yh_nch }" class="input-xlarge">
									<p class="help-block">${errors}</p>
								</div>
							</div>

							<div class="control-group">

								<!-- 所在地-->
								<label class="control-label" for="input01">所在地</label>
								<div class="controls">
									<input id="addr_user" disabled="true" name="yh_mm" type="text"
										class="input-xlarge">
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group">

								<!-- 真实姓名-->
								<label class="control-label" for="input01">真实姓名</label>
								<div class="controls">
									<input name="yh_xm" type="text" class="input-xlarge">
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group">

								<!-- 身份证号-->
								<label class="control-label" for="input01">身份证号</label>
								<div class="controls">
									<input name="yh_sfzh" type="text" class="input-xlarge">
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group">

								<!-- 手机号-->
								<label class="control-label" for="input01">手机号</label>
								<div class="controls">
									<input name="phone" type="text" placeholder=""
										class="input-xlarge">
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group">

								<!-- 邮箱-->
								<label class="control-label" for="input01">邮箱</label>
								<div class="controls">
									<input name="yh_yx" type="text" class="input-xlarge">
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"></label>

								<!-- 确认按钮 -->
								<div class="controls">
									<button type="submit" class="btn btn-success">确认修改</button>
								</div>
							</div>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 头像上传模态框 -->
	<div id="uploadHead" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">上传头像</h4>
				</div>
				<!-- action="uploadHead.do" method="post" -->
				<form id="form1" class="form-horizontal"
					enctype="multipart/form-data" method="post">
					<fieldset>
						<c:if test="${user.yh_tx==null}">
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img id="img_m" alt="140x140" src="image/head.jpg"
								class="img-circle" onclick="image_click()"
								style="vertical-align: middle; cursor: pointer; width: 80px; height: 80px" />
						</c:if>
						<c:if test="${user.yh_tx!=null}">
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img id="img_m" alt="140x140" src="upload/${user.yh_tx }"
								class="img-circle"
								style="vertical-align: middle; cursor: pointer; width: 80px; height: 80px"
								onclick="image_click()" />
						</c:if>
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input style="display: none;" id="file" type="file" name="files"
							onChange="image_show()" />
						
						<!-- 上传按钮 -->
						<br><br>
						<div class="control-group">
							<label class="control-label"></label>
							<div class="controls">
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="submit" value="上传" class="btn btn-primary"
									onclick="upload_image()" />
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

</body>


<script type="text/javascript">
	//弹出上传头像模态框
	$("#upload_button").click(function() {

		$("#uploadHead").modal({
			backdrop : "static"
		});
	});

	//上传图片
	function image_click() {
		// 点击file对象
		$("#file").click();
	}

	function image_show() {
		var file = $("#file");

		var url = window.URL.createObjectURL(file[0].files[0]);

		$("#img_m").attr("src", url);
	}

	//ajax上传图片
	function upload_image() {
		var form = new FormData(document.getElementById("form1"));

		$.ajax({
			url : "uploadHead_json.do",
			type : "post",
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				//var up = "upload/" + data;
				//$("#img_t").attr("src", up);
				sleep(5000);
				window.location.href = "userManage.do";

			}
		});
	}

	//上传图片是睡眠函数
	function sleep(numberMillis) {
		var now = new Date();
		var exitTime = now.getTime() + numberMillis;
		while (true) {
			now = new Date();
			if (now.getTime() > exitTime)
				return;
		}
	}

	//点击修改按钮弹出模态框。
	$("#update_button").click(function() {
		//获取用户信息
		getUser();
		//弹出模态框
		$("#updateUser").modal({
			backdrop : "static"
		});
	});

	//弹出模态框是回显地址和用户名
	function getUser() {

		$.get("userManage_json.do", function(msg) {
			var addr = msg.extend.addr;
			$("#addr_user").val(
					addr.province + "-" + addr.city + "-" + addr.district);
		});

	}
</script>
</html>