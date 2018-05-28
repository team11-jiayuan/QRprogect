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
<title>商品主页</title>
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
	$(function() {
		//加载分类
		$.getJSON("js/json/class.js", function(data) {
			$(data).each(
					function(i, json) {
						$("#index_class").append(
								"<li value="+json.id+"><a href='searchProduct/"+json.id+"/1.do'>"
										+ json.flmch + "</a></li>");
					});
		});
	});
</script>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="product_index.do">快租网</a></li>
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
					<div class="span2">
						<img alt="140x140" src="image/logo.jpg" />
						<ul id="index_class" class="nav nav-list">
							<li class="nav-header"></li>
							<li class="active"><a href="#">物品分类</a></li>
						</ul>
					</div>
					<div class="span6">

						<form class="form-search">
							<input class="input-medium search-query" type="text" />
							<button type="submit" class="btn">搜索</button>
						</form>
						<!-- 轮播图 -->
						<div class="carousel slide" id="carousel-681048">
							<ol class="carousel-indicators">
								<li class="active" data-slide-to="0"
									data-target="#carousel-681048"></li>
								<li data-slide-to="1" data-target="#carousel-681048"></li>
								<li data-slide-to="2" data-target="#carousel-681048"></li>
							</ol>
							<div class="carousel-inner" style="width: 600px; height: 300px;">
								<div class="item active"
									style="background: url(image/lun1.jpg); background-size: cover;">
									<img alt="..." src="image/lun1.jpg"
										style="width: 600px; height: 300px" />
									<div class="carousel-caption">
										<h4>棒球</h4>
										<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
									</div>
								</div>
								<div class="item"
									style="background: url(image/lun2.jpg); background-size: cover;">
									<img alt="..." src="image/lun2.jpg"
										style="width: 600px; height: 300px" />
									<div class="carousel-caption">
										<h4>冲浪</h4>
										<p>
											冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
										</p>
									</div>
								</div>
								<div class="item"
									style="background: url(image/lun3.jpg); background-size: cover;">
									<img alt="..." src="image/lun3.jpg"
										style="width: 600px; height: 300px" />
									<div class="carousel-caption">
										<h4>自行车</h4>
										<p>
											以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
										</p>
									</div>
								</div>
							</div>
							<a data-slide="prev" href="#carousel-681048"
								class="left carousel-control">‹</a> <a data-slide="next"
								href="#carousel-681048" class="right carousel-control">›</a>

						</div>
					</div>
					<div class="span4">
						<!-- 右 class="img-circle"-->
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${user==null||user.yh_tx==null}">
							<img alt="140x140" src="image/head.jpg"
								class="img-circle img-responsive center-block"
								style="width: 80px; height: 80px" />
						</c:if>
						<c:if test="${user.yh_tx!=null}">
							<img alt="140x140" src="upload/${user.yh_tx }"
								class="img-circle img-responsive center-block"
								style="width: 80px; height: 80px" />
						</c:if>
						<br> <br>
						<div class="accordion" id="accordion-83854">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle collapsed" data-toggle="collapse"
										data-parent="#accordion-83854"
										href="#accordion-element-164249">物品发布</a>
								</div>
								<div id="accordion-element-164249"
									class="accordion-body collapse">
									<div class="accordion-inner">
										<a href="p_publish.do">发布我的闲置物品</a>
									</div>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle collapsed" data-toggle="collapse"
										data-parent="#accordion-83854" href="#accordion-element-93117">我的信息</a>
								</div>
								<div id="accordion-element-93117"
									class="accordion-body collapse">
									<div class="accordion-inner">
										<a href=userManage.do>基本资料</a>
									</div>
									<div class="accordion-inner">
										<a href="MyProductManager.do">我的闲置</a>
									</div>
									<div class="accordion-inner">我的订单</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br> <br>
				<div class="row-fluid">
					<div class="span12">
						<!-- 商品展示 -->
						<c:forEach items="${pageInfo.list}" var="product">
							<div style="float: left; width: 300px; height: 300px;">
								<a href="to_product_detail/${product.id}.do" class="thumbnail">
									<img src="upload/${product.shp_tp}" class="img-rounded"
									style="width: 250px; height: 200px" /> <br>
									${product.shp_mch}
								</a>
							</div>
						</c:forEach>
						<c:forEach items="${pageInfos.list}" var="product">
							<div style="float: left; width: 300px; height: 300px;">
								<a href="to_product_detail/${product.id}.do" class="thumbnail">
									<img src="upload/${product.shp_tp}" class="img-rounded"
									style="width: 250px; height: 200px" /> <br>
									${product.shp_mch}
								</a>
							</div>
						</c:forEach>

					</div>


				</div>

                <c:if test="${pageInfo!=null && pageInfos==null}">
				<!-- 分页条 -->
				<div class="row-fluid">
					<div class="span12">
							<!--分页文字信息  -->
							<div >当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
								页,总 ${pageInfo.total } 条记录</div>
							<!-- 分页条信息 -->
							<div class="pagination" style="float:right;">
								<nav aria-label="Page navigation">
								<ul class="pagination">
									<li><a href="product_index.do?pn=1">首页</a></li>
									
									<!-- 前一页 -->
									<c:if test="${pageInfo.hasPreviousPage }">
										<li><a href="product_index.do?pn=${pageInfo.pageNum-1}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

                                     <!-- 当前页显示高亮 -->
									<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="active disable" ><a href="product_index.do?pn=${page_Num }" >${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a href="product_index.do?pn=${page_Num }">${page_Num }</a></li>
										</c:if>

									</c:forEach>
									
									<!-- 下一页 -->
									<c:if test="${pageInfo.hasNextPage }">
										<li><a href="product_index.do?pn=${pageInfo.pageNum+1 }"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<li><a href="product_index.do?pn=${pageInfo.pages}">末页</a></li>
								</ul>
								</nav>
							</div>
						</div>

					</div>
				
				</c:if>
				
				<!-- 分类查询的分页 -->
				<c:if test="${pageInfos!=null && pageInfo==null}">
				<!-- 分页条 -->
				<div class="row-fluid">
					<div class="span12">
							<!--分页文字信息  -->
							<div >当前 ${pageInfos.pageNum }页,总${pageInfos.pages }
								页,总 ${pageInfos.total } 条记录</div>
							<!-- 分页条信息 -->
							<div class="pagination" style="float:right;">
								<nav aria-label="Page navigation">
								<ul class="pagination">
									<li><a href="searchProduct/${class_id}/1.do">首页</a></li>
									
									<!-- 前一页 -->
									<c:if test="${pageInfos.hasPreviousPage }">
										<li><a href="searchProduct/${class_id}/${pageInfos.pageNum-1}.do"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

                                     <!-- 当前页显示高亮 -->
									<c:forEach items="${pageInfos.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfos.pageNum }">
											<li class="active disable"><a href="searchProduct/${class_id}/${page_Num }.do">${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfos.pageNum }">
											<li><a href="searchProduct/${class_id}/${page_Num }.do">${page_Num }</a></li>
										</c:if>

									</c:forEach>
									
									<!-- 下一页 -->
									<c:if test="${pageInfos.hasNextPage }">
										<li><a href="searchProduct/${class_id}/${pageInfos.pageNum+1 }.do"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<li><a href="searchProduct/${class_id}/${pageInfos.pages}.do">末页</a></li>
								</ul>
								</nav>
							</div>
						</div>

					</div>
				
				</c:if>
				</div>
			</div>
	</div>
	
</body>


</html>