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
	href="${contextPath}/js/easyui/themes/default/easyui.css">
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
<title>导师学生互选</title>
<style type="text/css">
.titleStyle {
	font-size: 20px;
}
</style>

<script type="text/javascript">

function doSearch() {
	$('#interchoice').datagrid('load', {
		studentname : $('#studentname').val(),
		tutorname : $('#tutorname').val()
	});
}
var rowCheck = function(row, idx) {
	var rows = $("#tutorList").datagrid("getChecked");
	$("#batchDelBtn").linkbutton(rows.length > 0 ? "enable" : "disable");
}

var bindEvent = function() {
	$(".skimBtn").click(
			function() {
				window.open("${contextPath}/notice_detail?noticeID="
						+ $(this).attr("recID"), "_blank");
			});
	$(".editBtn").click(function() {
		id = $(this).attr("recID");
		window.open("notice_edit.jsp?noticeID=" + id, "mainframe");
	});
	$(".delBtn").click(function() {
		var id = $(this).attr("recID");
		del(id);
	});
};
</script>
</head>
<body>
	<table class="easyui-datagrid" url="${contextPath}/admin/System/interchoice"
		pagination="true" fit="true" fitColumns="true" selectOnCheck="false"
		rownumbers="true" singleSelect="true" striped="true"
		data-options="onLoadSuccess:bindEvent,onCheck:rowCheck,onUncheck:rowCheck,onCheckAll:rowCheck,onUncheckAll:rowCheck"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>导师学生互选结果 </span>" id="interchoice">
		<thead>
			<tr>
				
				<th field="studentname" width="200" halign="center">学生姓名</th>
				<th field="tutorname" width="200" halign="center">导师姓名</th>
				<th data-options="field:'tutorID',checkbox:true"></th>
			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
	<span>学生姓名:</span> <input id="studentname"
			style="line-height: 26px; border: 1px solid #ccc"> <span>导师姓名:</span>
	<input id="tutorname"
			style="line-height: 26px; border: 1px solid #ccc">
	<a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()"
			iconCls="icon-search">查询</a><a href="javascript:void(0)"
			disabled="true" id="batchAddBtn" disabled="true"
			class="easyui-linkbutton" iconCls="icon-save" onclick="batchAdd()">审核通过</a>
		<a href="javascript:void(0)" id="batchDelBtn" disabled="true"
			class="easyui-linkbutton" iconCls="icon-cancel" onclick="batchDel()">取消申请</a>
	</div>
</body>
</html>