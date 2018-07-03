<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	a.menu:link {
		display: block;
		height: 42px;
		font-size: 16px;
		padding: 10px 20px;
		float: left;
		text-decoration: none;
	}
	a.visited {
		background-color: RGB(28,155,236);
	}
	a.mouover {
		background-color: RGB(28,155,236);
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchBtn").click(function(){
			var keyWord = $("#keyWord").val();
			if(keyWord == ""){
				return;
			}
			window.location.href = "searchByKeyWord/"+keyWord;
		});
	});
	function menumouseover(element){
		element.classList.add("mouover");
	}
	function menumouseout(element){
		element.classList.remove("mouover");
	}
</script>
<div class="container-fluid">
	<!-- logo和搜索框 -->
	<div class="row" style="padding-top: 15px; margin-bottom:15px;">
		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px;">
			<a href="index"><img class="img-responsive" width="180px" src="img/logo.png" ></a>
		</div>
		<div class="col-xs-6 col-sm-5 col-md-4 col-lg-4" style="padding-top: 25px; margin-left: 5%;">
			<div class="input-group">
      			<input id="keyWord" type="text" class="form-control" value="${keyWord }" style="border: #0282d3 2px solid;">
      			<span class="input-group-btn">
        			<button id="searchBtn" class="btn btn-default" type="button" style="background-color: #0282d3; border-color: #0282d3; color: #fff;">搜索</button>
      			</span>
    		</div>
		</div>
	</div>
</div>
<div class="container-fluid" style="background-color: #0282d3; height: 42px;">
	<div class="row">
		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2" style="padding: 0px">
			<ul style="padding-left:0px; margin-bottom:0px">
				<li style="display: inline;">
					<a href="index" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">首页</a>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='1' }">
							<a href="searchByCategory/1" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">手机数码</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/1" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">手机数码</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='2' }">
							<a href="searchByCategory/2" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">电脑办公</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/2" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">电脑办公</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='3' }">
							<a href="searchByCategory/3" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">家用电器</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/3" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">家用电器</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='4' }">
							<a href="searchByCategory/4" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">户外运动</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/4" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">户外运动</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='5' }">
							<a href="searchByCategory/5" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">图书音像</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/5" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">图书音像</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li style="display: inline;">
					<c:choose>
						<c:when test="${category=='6' }">
							<a href="searchByCategory/6" class="menu visited" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">服装鞋帽</a>
						</c:when>
						<c:otherwise>
							<a href="searchByCategory/6" class="menu" onmouseover="menumouseover(this)" onmouseout="menumouseout(this)" style="color: #fff;">服装鞋帽</a>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>
	</div>
</div>