<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<title>Insert title here</title>
		<style type="text/css">
			/*输入框警告样式*/
			.warning{
				border-color: #dd2727;
			}
			/**表单元素样式**/
			.myrow{
				margin-bottom: 15px;
			}
			/**表单提示信息样式**/
			.tip{
				padding-top: 6px;
				display: none;
			}
		</style>
		<script type="text/javascript">
			//鼠标离开“用户名”输入框时，对用户名进行验证
			function usernameBlur(){
				$("#usernameTip").hide();
				var userName = $("#userName").val();
				var patt = new RegExp(/^[a-zA-Z][a-zA-Z0-9_]{3,15}$/);
				if(userName.replace(/\s+/g,"").length != userName.length){
					$("#userName").addClass("warning");
					$("#span1").text("用户名不能包含空格！");
					$("#usernameWarnig").show();
					return false;
				}else if(userName.length == 0){
					$("#userName").addClass("warning");
					$("#span1").text("用户名不能为空！");
					$("#usernameWarnig").show();
					return false;;
				}else if(patt.test(userName)){
					var flag = false;
					$.ajax({
						url: "checkUsername",
						data: {userName: userName},
						async: false,
						type: "POST",
						success: function(result){
							if(result.message != "ok"){
								$("#userName").addClass("warning");
								$("#span1").text(result.message);
								$("#usernameWarnig").show();
							}else{
								flag = true;
								$("#span2").text("恭喜您！该用户名可以使用！");
								$("#usernameOK").show();
							}
						}
					});
					return flag;
				}else{
					$("#userName").addClass("warning");
					$("#span1").text("用户名格式有误！");
					$("#usernameWarnig").show();
					return false;
				}
			}
			//鼠标离开“密码”输入框时，对密码进行验证
			function passwordBlur(){
				$("#passwordTip").hide();
				var patt = /^([A-Z]|[a-z]|[0-9]){6,20}$/;
				var password = $("#password").val();
				if(password.length == 0){
					$("#password").addClass("warning");
					$("#span3").text("密码不能为空！");
					$("#passwordWarnig").show();
					return false;
				}else if(password.replace(/\s+/g,"").length != password.length){
					$("#password").addClass("warning");
					$("#span3").text("密码不能包含空格！");
					$("#passwordWarnig").show();
					return false;
				}else if(patt.test(password)){
					$("#passwordOK").show();
					return true;
				}else{
					$("#password").addClass("warning");
					$("#span3").text("密码格式有误！");
					$("#passwordWarnig").show();
					return false;
				}
			}
			//鼠标离开“确认密码”输入框时，对密码进行验证
			function repasswordBlur(){
				$("#repasswordTip").hide();
				var patt = /^([A-Z]|[a-z]|[0-9]){6,20}$/;
				var password = $("#password").val();
				var rePassword = $("#rePassword").val();
				if(rePassword.length == 0){
					$("#rePassword").addClass("warning");
					$("#span4").text("密码不能为空！");
					$("#repasswordWarnig").show();
					return false;
				}else if(rePassword.replace(/\s+/g,"").length != rePassword.length){
					$("#rePassword").addClass("warning");
					$("#span4").text("密码不能包含空格！");
					$("#repasswordWarnig").show();
					return false;
				}else if(password != rePassword){
					$("#rePassword").addClass("warning");
					$("#span4").text("两次输入的密码不一致！请重新输入！");
					$("#repasswordWarnig").show();
					return false;
				}else if(patt.test(rePassword)){
					$("#repasswordOK").show();
					return true;
				}else{
					$("#rePassword").addClass("warning");
					$("#span4").text("密码格式有误！");
					$("#repasswordWarnig").show();
					return false;
				}
			}
			//鼠标离开“真实姓名”输入框时，对姓名进行验证
			function realnameBlur(){
				$("#realnameTip").hide();
				var patt = /^[\u4E00-\u9FA5]{1,6}$/;
				var realName = $("#realName").val();
				if(realName.length == 0){
					$("#realName").addClass("warning");
					$("#span5").text("姓名不能为空！");
					$("#realnameWarnig").show();
					return false;
				}else if(patt.test(realName)){
					$("#realnameOK").show();
					return true;
				}else{
					$("#realName").addClass("warning");
					$("#span5").text("姓名格式有误！");
					$("#realnameWarnig").show();
					return false;
				}
			}
			//鼠标离开“身份证号”输入框时，对身份证号进行验证
			function idnumberBlur(){
				$("#IDNumberTip").hide();
				var patt = /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|[xX])$/;
				var IDNumber = $("#IDNumber").val();
				if(IDNumber.length == 0){
					$("#IDNumber").addClass("warning");
					$("#span6").text("身份证号不能为空！");
					$("#IDNumberWarnig").show();
					return false;
				}else if(patt.test(IDNumber)){
					$("#IDNumberOK").show();
					return true;
				}else{
					$("#IDNumber").addClass("warning");
					$("#span6").text("身份证号格式有误！");
					$("#IDNumberWarnig").show();
					return false;
				}
			}
			//鼠标离开“手机号”输入框时，对手机号进行验证
			function phonenumberBlur(){
				$("#phonenumberTip").hide();
				var patt = /^1\d{10}$/;
				var phoneNumber = $("#phoneNumber").val();
				if(phoneNumber.length == 0){
					$("#phoneNumber").addClass("warning");
					$("#span7").text("手机号不能为空！");
					$("#phonenumberWarnig").show();
					return false;
				}else if(patt.test(phoneNumber)){
					$("#phonenumberOK").show();
					return true;
				}else{
					$("#phoneNumber").addClass("warning");
					$("#span7").text("手机号格式有误！");
					$("#phonenumberWarnig").show();
					return false;
				}
			}
			//判断是否“阅读并同意《快租网用户服务协议》”
			function agreementChecked(){
				var checked = document.getElementById("agreement").checked;
				if(checked == false){
					$("#agreementWarning").show();
				}else{
					$("#agreementWarning").hide();
				}
				return checked;
			}
			$(document).ready(function(){
				//“用户名”输入框得到鼠标焦点时，移除警告样式和通知
				$("#userName").focus(function(){
					$("#userName").removeClass("warning");
					$("#usernameWarnig").hide();
					$("#usernameOK").hide();
					$("#usernameTip").show();
				});
				//“密码”输入框得到鼠标焦点时，移除警告样式和通知
				$("#password").focus(function(){
					$("#password").removeClass("warning");
					$("#passwordWarnig").hide();
					$("#passwordOK").hide();
					$("#passwordTip").show();
				});
				//“确认密码”输入框得到鼠标焦点时，移除警告样式和通知
				$("#rePassword").focus(function(){
					$("#rePassword").removeClass("warning");
					$("#repasswordWarnig").hide();
					$("#repasswordOK").hide();
					$("#repasswordTip").show();
				});
				//“真实姓名”输入框得到鼠标焦点时，移除警告样式和通知
				$("#realName").focus(function(){
					$("#realName").removeClass("warning");
					$("#realnameWarnig").hide();
					$("#realnameOK").hide();
					$("#realnameTip").show();
				});
				//“身份证号”输入框得到鼠标焦点时，移除警告样式和通知
				$("#IDNumber").focus(function(){
					$("#IDNumber").removeClass("warning");
					$("#IDNumberWarnig").hide();
					$("#IDNumberOK").hide();
					$("#IDNumberTip").show();
				});
				//“手机号”输入框得到鼠标焦点时，移除警告样式和通知
				$("#phoneNumber").focus(function(){
					$("#phoneNumber").removeClass("warning");
					$("#phonenumberWarnig").hide();
					$("#phonenumberOK").hide();
					$("#phonenumberTip").show();
				});
				//“阅读并同意《快租网用户服务协议》”的点击事件
				$("#agreement").click(function(){
					agreementChecked();
				});
				//表单提交时事件，对表单数据进行验证
				$("#registerForm").submit(function(){
					var usernameFlag = usernameBlur();
					var passwordFlag = passwordBlur();
					var repasswordFlag = repasswordBlur();
					var realnameFlag = realnameBlur();
					var idnumberFlag = idnumberBlur();
					var phonenumberFlag = phonenumberBlur();
					var agreementFlag = agreementChecked();
					if(usernameFlag && passwordFlag && repasswordFlag && realnameFlag && idnumberFlag && phonenumberFlag && agreementFlag){
						return true;
					}else{
						return false;
					}
				});
			});
		</script>
	</head>
	<body>
		<!-- 上方logo -->
		<div class="container" style="padding: 0px;">
			<div class="row" style="padding: 20px 0px 5px 0px;">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<a href="index"><img src="img/logo.png" class="img-responsive" /></a>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3 col-lg-3 col-xs-offset-4 col-sm-offset-7 col-md-offset-7 col-lg-offset-7" style="padding-top: 3%;">
					<span style="font-size: 16px; color: #666;">已有账号</span>
					<a href="login" style="font-size: 16px; text-decoration: none;">在此登录</a>
				</div>
			</div>
		</div>
		<!-- 分割线 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px;">
					<hr style="height: 12px; border: 0; box-shadow: inset 0 12px 12px -12px rgba(0, 0, 0, 0.15);"/>
				</div>
			</div>
		</div>
		<!-- 注册区域 -->
		<div class="container" style="margin-bottom: 70px;">
			<!-- 欢迎注册 -->
			<div class="row" style="text-align: center; margin-bottom: 20px">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<span style="font-size: 24px;">欢迎注册</span>
				</div>
			</div>
			<!-- 注册表单 -->
			<div>
				<form id="registerForm" action="addUser" method="post">
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="text" class="form-control" id="userName" name="userName" onblur="usernameBlur()" placeholder="用户名" />
						</div>
						<div>
							<div class="tip" id="usernameWarnig">
								<img src="img/warning.png" width="12px">
								<span id="span1" style="color: #dd2727; font-size: 12px;"></span>
							</div>
							<div class="tip" id="usernameOK">
								<img src="img/ok.png" width="12px">
								<span id="span2" style="color: #93d05f; font-size: 12px;"></span>
							</div>
							<div class="tip" id="usernameTip">
								<img src="img/tip.png" width="12px">
								<span style="color: #aaaaaa; font-size: 12px;">用户名由4-16位字母、数字、下划线组成，且必须以字母开头！</span>
							</div>
						</div>
					</div>
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="password" class="form-control" id="password" name="password" onblur="passwordBlur()" placeholder="密码" />
						</div>
						<div>
							<div class="tip" id="passwordWarnig">
								<img src="img/warning.png" width="12px">
								<span id="span3" style="color: #dd2727; font-size: 12px;"></span>
							</div>
							<div class="tip" id="passwordTip">
								<img src="img/tip.png" width="12px">
								<span style="color: #aaaaaa; font-size: 12px;">6-20位字符，不能包含特殊字符和空格！</span>
							</div>
							<div class="tip" id="passwordOK">
								<img src="img/ok.png" width="12px">
							</div>
						</div>
					</div>
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="password" class="form-control" id="rePassword" name="rePassword" onblur="repasswordBlur()" placeholder="确认密码" />
						</div>
						<div>
							<div class="tip" id="repasswordWarnig">
								<img src="img/warning.png" width="12px">
								<span id="span4" style="color: #dd2727; font-size: 12px;"></span>
							</div>
							<div class="tip" id="repasswordTip">
								<img src="img/tip.png" width="12px">
								<span style="color: #aaaaaa; font-size: 12px;">6-20位字符，不能包含特殊字符和空格！</span>
							</div>
							<div class="tip" id="repasswordOK">
								<img src="img/ok.png" width="12px">
							</div>
						</div>
					</div>
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="text" class="form-control" id="realName" name="realName" onblur="realnameBlur()" placeholder="真实姓名" />
						</div>
						<div>
							<div class="tip" id="realnameWarnig">
								<img src="img/warning.png" width="12px">
								<span id="span5" style="color: #dd2727; font-size: 12px;"></span>
							</div>
							<div class="tip" id="realnameTip">
								<img src="img/tip.png" width="12px">
								<span style="color: #aaaaaa; font-size: 12px;">请输入真实姓名，只能是中文字符！</span>
							</div>
							<div class="tip" id="realnameOK">
								<img src="img/ok.png" width="12px">
							</div>
						</div>
					</div>
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="text" class="form-control" id="IDNumber" name="IDNumber" onblur="idnumberBlur()" placeholder="身份证号" />
						</div>
						<div>
							<div class="tip" id="IDNumberWarnig">
								<img src="img/warning.png" width="12px">
								<span id="span6" style="color: #dd2727; font-size: 12px;"></span>
							</div>
							<div class="tip" id="IDNumberTip">
								<img src="img/tip.png" width="12px">
								<span style="color: #aaaaaa; font-size: 12px;">请输入18位身份证号！</span>
							</div>
							<div class="tip" id="IDNumberOK">
								<img src="img/ok.png" width="12px">
							</div>
						</div>
					</div>
					<div class="row myrow">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4">
							<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" onblur="phonenumberBlur()" placeholder="手机号" />
						</div>
						<div class="tip" id="phonenumberWarnig">
							<img src="img/warning.png" width="12px">
							<span id="span7" style="color: #dd2727; font-size: 12px;"></span>
						</div>
						<div class="tip" id="phonenumberTip">
							<img src="img/tip.png" width="12px">
							<span style="color: #aaaaaa; font-size: 12px;">请输入11位手机号！</span>
						</div>
						<div class="tip" id="phonenumberOK">
							<img src="img/ok.png" width="12px">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4" style="text-align: center;">
							<div class="checkbox" style="margin-top: 5px;">
								<label>
									<input id="agreement" type="checkbox" />我已阅读并同意 <a href="javascript:void(0)" style="text-decoration: none;">《快租网用户服务协议》</a>
								</label>
							</div>
						</div>
						<div id="agreementWarning" style="padding-top:2px; display:none;">
							<img src="img/warning.png" width="12px">
							<span style="color: #dd2727; font-size: 12px;">请阅读并同意《快租网用户服务协议》!</span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-4 col-sm-offset-4 col-md-offset-4 col-lg-offset-4"  style="padding-top: 10px;">
							<input type="submit" class="btn btn-primary" style="width: 100%;" value="立 即 注 册" />
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- footer start -->
		<jsp:include page="footer.jsp" />
		<!-- footer end -->
	</body>
</html>