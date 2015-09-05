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
<script type="text/javascript"
	src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="${contextPath}/js/fileupload.js"></script>
<title>学科大类信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">学科大类信息列表</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="80">学科大类号</th>
				<th width="100">学科大类</th>
				<th width="300">描述</th>
			</tr>
			<s:iterator value="subjectList.recs" var="sub">
				<tr>
					<td>${sub.bigClassID }</td>
					<td>${sub.bigClassName }</td>
					<td>${sub.descript }</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>