<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${contextPath}/js/admin.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>系统公告test</title>
<style type="text/css">
	.titleStyle{
		font-size: 15px;
	}
</style>
</head>
<body><!-- datagrid url= actionXML中的namespace下的action的name值，如：${contextPath}/nt/nt_list-->
<table class="easyui-datagrid" url="${contextPath}/nt/nt_list" pagination="true"
		fit="true" fitColumns="true" selectOnCheck="false" rownumbers="true"
		singleSelect="true" striped="true"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>通知公告</span>" id="noticeList">
		<thead>
			<tr>
				<th data-options="field:'noticeID',checkbox:true"></th>
				<href="ind.jsp"><th field="title" width="200" halign="center">标题</th></a>
				<th field="pdate" width="160" halign="center" align="center" fixed="true">发布时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>