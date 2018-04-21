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
<title>商品详情</title>
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
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="to_product_detail/${object_product.product.id }.do">商品详情</a>
					</li>
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
					<div class="span6">
						<div style="float: left; width: 500px; height: 450px;">
							<a href="#" class="thumbnail"> <img
								src="upload/${object_product.product.shp_tp}"
								class="img-rounded" style="width: 300px; height: 300px" />

							</a>
						</div>
					</div>
					<div class="span6">
						<dl>
							<dt>商品名称</dt>
							<dd>${object_product.product.shp_mch }</dd>
							<dt>数 量</dt>
							<dd>${object_product.shp_sl }&nbsp&nbsp件</dd>
							<dt>租赁价格</dt>
							<dd>￥&nbsp &nbsp${object_product.shp_zj }&nbsp/天</dd>
							<dt>闲置时间</dt>
							<dd>${object_product.shp_qzsj}——${object_product.shp_jssj}</dd>
							<dt>押 金</dt>
							<dd>￥&nbsp &nbsp${object_product.shp_yj }</dd>
							<dt>租赁时间</dt>
							<dd>
								<form>
									<fieldset>
										<div class="control-group">

											<label class="control-label" for="input01"></label>
											<div class="controls">
												<input type="text" placeholder="输入数字" class="input-xlarge">
												<!-- <p class="help-block"></p> -->
											</div>
										</div>
										<div class="control-group">
											<!-- <label class="control-label"></label> -->

											<div class="controls">
												<button class="btn btn-success">确认租赁</button>
											</div>
										</div>
									</fieldset>
								</form>
							</dd>
						</dl>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a
								href="to_product_detail/${object_product.product.id }.do">${object_product.product.shp_mch }&nbsp详细介绍</a>
								<span class="divider">/</span></li>

							<!-- <li class="active">
							商品详情
						</li> -->
							<li><a href="#">相关评论</a> <span class="divider">/</span></li>

						</ul>
						<div class="row-fluid">
							<div class="span2"></div>
							<div class="span6">
								<ul class="thumbnails">
									<c:forEach items="${object_product.images}" var="image">
										<div style="float: left; width: 500px; height: 350px;">
											<a href="#" class="thumbnail"> 
											<img src="upload/${image.url}"
												class="img-rounded" style="width: 300px; height: 300px" />
											</a>
										</div>
									</c:forEach>
								</ul>
							</div>
							<div class="span4">
								<dl>
									<dt>租赁方式</dt>
									<dd>${object_product.shp_jyfs }</dd>
									<dt>物主联系方式</dt>
									<dd>${object_product.lxfs }</dd>
									<dt>使用年限</dt>
									<dd>${object_product.shp_nx }&nbsp年</dd>
									<dt>损 坏 处</dt>
									<dd>${object_product.shp_sh }</dd>
									<dt>商品描述</dt>
									<dd>${object_product.shp_msh }</dd>
								</dl>
							</div>
						</div>
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