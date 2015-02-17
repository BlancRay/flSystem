<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/main.css"></link>
<link rel="stylesheet" href="../css/student.css"></link>
<link rel="stylesheet" href="../js/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" href="../js/easyui/themes/icon.css"></link>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>${initParam.systemName}——选择通道</title>
</head>
<body>
	<div class="center800">
		<div class="caption">通道选择</div>
		<div class="outBorder">
			<div class="toolbar">学业成绩：六级成绩：</div>
			<form action="stu_channelCheck" method="post">
				<label>
					<input type="radio" name="channel" value="1"> 校内贯通培养
				</label>
				<label>
					<input type="radio" name="channel" value="2"> 普通本科培养
				</label>
				<a href="javascript:void(0)" class="-border-c Btn" onclick="selectBtn()">开  始</a>
			</form>
		</div>
	</div>
</body>
</html>