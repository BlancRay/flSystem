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
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/main.css">
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script charset="utf-8" type="text/javascript"
	src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<title>导师信息列表</title>
</head>
<body>
	<div class="center1000">
		<div class="firstTitle">导师信息列表</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="50">姓名</th>
				<th width="50">工号</th>
				<th width="100">招生专业</th>
				<th width="350">个人简介</th>
				<th width="350">研究兴趣</th>
				<th width="50">招生名额</th>
			</tr>
			<s:iterator value="tutorList.recs" var="tutor">
				<tr>
					<td>${tutor.uName }</td>
					<td>${tutor.loginName }</td>
					<td>${tutor.specialtyName }</td>
					<td>${tutor.introduce }</td>
					<td>${tutor.res_interests }</td>
					<td>${tutor.quota }</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>