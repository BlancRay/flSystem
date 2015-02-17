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
<title>学生列表</title>
<style type="text/css">
.titleStyle {
	font-size: 20px;
}
</style>

<script type="text/javascript">

	var	bindEvent=function(){
			$(".skimBtn").click(function(){
				window.open("${contextPath}/notice_detail?noticeID="+$(this).attr("recID"),"_blank");
			});
			$(".editBtn").click(function(){
				id = $(this).attr("recID");
				window.open("notice_edit.jsp?noticeID="+id,"mainframe");
			});
			$(".delBtn").click(function(){
				var id = $(this).attr("recID");
				del(id);
			});
		};
	
	var rowCheck=function(row,idx){
		var rows = $("#studentList").datagrid("getChecked");
		$("#batchDelBtn").linkbutton(rows.length>0?"enable":"disable");
	}
</script>
</head>
<body>
	<table class="easyui-datagrid" url="${contextPath}/tutor/student_list"
		pagination="true" fit="true" fitColumns="true" selectOnCheck="false"
		rownumbers="true" singleSelect="true" striped="true"
		data-options="onLoadSuccess:bindEvent,onCheck:rowCheck,onUncheck:rowCheck,onCheckAll:rowCheck,onUncheckAll:rowCheck"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>学生列表 </span>" id="studentList">
		<thead>
			<tr>
				
				<th field="tutorID" width="200" halign="center">导师</th>
				<th field="studentID" width="200" halign="center">学生</th>
				<th field="status" width="200" halign="center">状态</th>
				<th data-options="field:'ttsID',checkbox:true"></th>
			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
		 <a	href="javascript:void(0)" id="batchDelBtn" disabled="true"
			class="easyui-linkbutton" iconCls="icon-add" onclick="batchDel()">不同意招收</a>
	</div>
</body>
</html>