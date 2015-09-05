<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<title>学生信息列表</title>
</head>
<body>
	<div class="center1000">
		<div class="firstTitle">学生信息列表</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="80">学号</th>
				<th>姓名</th>
				<th width="30">性别</th>
				<th width="100">班级</th>
				<th width="50">年级</th>
				<th width="160">学科大类</th>
				<th width="60">六级成绩</th>
				<th width="50">学分成绩</th>
				<th width="50">有无违纪</th>
			</tr>
			<s:iterator value="stuList.recs" var="stu">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.sex }</td>
					<td>${stu.className }</td>
					<td>${stu.grade }</td>
					<td>${stu.bigClassName }</td>
					<td>${stu.sixGrade }</td>
					<td>${stu.creditscore }</td>
					<td>${stu.discipline }</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>