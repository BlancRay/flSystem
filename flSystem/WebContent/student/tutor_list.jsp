<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${contextPath}/js/admin.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<title>导师查询</title>
<style type="text/css">
.titleStyle {
	font-size: 20px;
}
</style>

<script type="text/javascript">
	/* 	function doSearch() {
	 $('#tutorList').datagrid('load', {
	 uname : $('#tutorID').val(),
	 specialtyID : $('#specialtyID').val()
	 });
	 } */

	var rowCheck = function(row, idx) {
		var rows = $("#tutorList").datagrid("getChecked");
		$("#batchDelBtn").linkbutton(rows.length > 0 ? "enable" : "disable");
		$("#batchAddBtn").linkbutton(
				rows.length > 0 && rows.length < 3 ? "enable" : "disable");
	}
</script>
</head>
<body>
	<table class="easyui-datagrid" url="${contextPath}/student/tutor_list"
		pagination="true" fit="true" fitColumns="true" selectOnCheck="false"
		rownumbers="true" singleSelect="false" striped="true"
		data-options="onCheck:rowCheck,onUncheck:rowCheck,onCheckAll:rowCheck,onUncheckAll:rowCheck"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>导师列表 </span>" id="tutorList">
		<thead>
			<tr>
				<th data-options="field:'loginName',checkbox:true"></th>
				<!-- 检查chechbox为何自动勾选 -->
				<th field="uName" width="200" halign="center" align="center">姓名</th>
				<th field="college" width="200" halign="center" align="center">所属学院</th>
				<th field="specialtyName" width="200" halign="center" align="center">招生专业</th>
				<th field="res_interests" width="200" halign="center" align="center">研究兴趣</th>
				<th field="quota" width="200" halign="center" align="center">招生名额</th>
				<th field="qq" width="200" halign="center" align="center">QQ</th>
				<th field="email" width="200" halign="center" align="center">E-mail</th>

			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
		<span>姓名:</span> <input id="uname" style="halign: center;"> <span>招收专业:</span>
		<input class="easyui-combobox" url="${contextPath}/student/tutor_list"
			valuefield="specialtyname" textField="text">
		<!-- 未实现从json读取专业名称 -->

		<!-- 		<input id="specialtyname"
			style="line-height: 26px; border: 1px solid #ccc">  -->
		<a href="javascript:void(0)" class="easyui-linkbutton" plain="true"
			onclick="doSearch()" iconCls="icon-search">查询</a> <a
			href="javascript:void(0)" disabled="true" id="batchAddBtn"
			disabled="true" class="easyui-linkbutton" iconCls="icon-add"
			onclick="batchAdd()">申请导师</a> <a href="javascript:void(0)"
			id="batchDelBtn" disabled="true" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="batchDel()">取消申请</a>
	</div>
</body>
</html>