<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="/struts-tags"%>
<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main.css">
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script charset="utf-8" type="text/javascript" src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<title>互选信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">互选信息列表</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="100">学生姓名</th>
				<th width="150">所属学科大类</th>
				<th width="100">导师姓名</th>
				<th width="150">所属学科大类</th>
				<th width="50">审核状态</th>
			</tr>
			<m:iterator value="ttsList.recs" var="tts">
				<tr>
					<td>${tts.stuname }</td>
					<td>${tts.stubc }</td>
					<td>${tts.uName }</td>
					<td>${tts.bigClassName }</td>
					<td>${tts.status }</td>
				</tr>
			</m:iterator>
		</table>
	</div>
</body>
</html>