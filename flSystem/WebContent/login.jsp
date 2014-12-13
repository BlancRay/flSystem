<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="css/css/base.css" rel="stylesheet" type="text/css" />
<link href="css/css/login.css" rel="stylesheet" type="text/css" />
<link href="css/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(images/login_bg.png);
	background-repeat: repeat-x;
}
</style>
<script language="JavaScript" type="text/javascript"
	src="js/js/jquery-1.8.0.min.js"></script>
<script language="JavaScript" type="text/javascript"
	src="js/js/jquery-ui.js"></script>

<script language="javascript">
	$(function() {
		$(":text,:password").addClass("input");
		$(":submit").button().click(function(event) {
			if ($("#userName").val() == "") {
				alert("请输入用户名...");
				$("#userName").focus();
				event.preventmetro();
				return;
			}

			if ($("#passwd").val() == "") {
				alert("请输入密码...");
				$("#passwd").focus();
				event.preventmetro();
				return;
			}

		});
		;
	});
</script>
</head>

<body>
	<div id="loginBox" class="login">
		<form id="loginForm" action="loginAction" method="post">
			<table width="300" border="0" cellpadding="5" cellspacing="0"
				id="loginTb">
				<tr>
					<th width="80" align="right" scope="row">用户名：</th>
					<td><input name="loginName" type="text" id="userName"
						title="用户名" size="20" maxlength="16" /></td>
				</tr>
				<tr>
					<th align="right" scope="row">密码：</th>
					<td><input name="passwd" type="password" id="passwd"
						title="口令" size="20" maxlength="16" /></td>
				</tr>
				<tr>
					<th align="right" scope="row">用户类型：</th>
					<td><label> <input type="radio" name="role"
							value="tutor" checked="checked" /> 教师&nbsp;
					</label> <label><input name="role" type="radio" value="student" />
							学生</label> <label><input type="radio" name="role" value="admin" />
							管理员</label></td>
				</tr>
				<tr>
					<th align="right" scope="row">验证码：</th>
					<td><input size="6" maxlength="6" title="验证码" name="checkCode"
						type="text" id="checkCode"> <img title="点击重新获取验证码"
						src="checkCode.jsp" style="cursor: pointer;"
						onclick="javascript:this.src='checkCode.jsp?r='+Math.random();"></td>
				</tr>
				<tr>
					<th scope="row"><input type="submit" name="submit" value="登录" />
					</th>
					<th><input type="reset" name="reset" value="重设" /></th>
				</tr>
				<tr>
					<th colspan="2" scope="row" style="color: red">${tip}</th>
				</tr>
			</table>
		</form>

	</div>
	<div style="text-align: center; margin-left: 50px">
		[<a href="/web">返回网站首页</a>]
	</div>
</body>
</html>