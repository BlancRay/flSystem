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
<title>导师列表</title>
<style type="text/css">
.titleStyle {
	font-size: 20px;
}
</style>

<script type="text/javascript">
	function doSearch() {
		$('#tutortList').datagrid('load', {
			uname : $('#uname').val(),
			specialtyName : $('#specialtyName').val()
		});
	}

	var opt=function(val,row){
	 	r = "<a href='#' recID='" + val + "' class='editBtn'>编辑</a> |";
	 	r += "<a href='#' recID='" + val + "' class='delBtn'>删除</a> |";
		return r;			
	};

	 	var	bindEvent=function(){

			$(".editBtn").click(function(){
				id = $(this).attr("recID");
				window.open("notice_edit.jsp?noticeID="+id,"mainframe");
			});
			$(".delBtn").click(function(){
				var id = $(this).attr("recID");
				del(id);
			});
		};
	 	
	var rowCheck = function(row, idx) {
		var rows = $("#tutorList").datagrid("getChecked");
		$("#batchDelBtn").linkbutton(rows.length > 0 ? "enable" : "disable");
		var rows = $("#tutorList").datagrid("getChecked");
		$("#batchAddBtn").linkbutton(rows.length > 0 ? "enable" : "disable");
	}
</script>
</head>
<body>
	<table class="easyui-datagrid" url="${contextPath}/admin/tutor_list"
		pagination="true" fit="true" fitColumns="true" selectOnCheck="false"
		rownumbers="true" singleSelect="true" striped="true"
		data-options="onCheck:rowCheck,onUncheck:rowCheck,onCheckAll:rowCheck,onUncheckAll:rowCheck"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>导师列表 </span>" id="tutortList">
		<thead>
			<tr>

				<th field="uname" width="200" halign="center">姓名</th>
				<th field="loginName" width="200" halign="center">工号</th>
				<th field="introduce" width="200" halign="center">个人简介</th>
				<th field="specialtyName" width="200" halign="center">招生专业</th>
				<th field="res_interests" width="200" halign="center">研究兴趣</th>
				<th field="quota" width="200" halign="center">招生名额</th>
				<th data-options="field:'loginName',checkbox:true"></th>
			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
		<span>姓名:</span> <input id="uname"
			style="line-height: 26px; border: 1px solid #ccc"> <span>招收专业:</span>
		<input id="specialtyID"
			style="line-height: 26px; border: 1px solid #ccc"> <a
			href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()"
			iconCls="icon-search">查询</a> <a href="javascript:void(0)"
			disabled="true" id="batchAddBtn" class="easyui-linkbutton" iconCls="icon-save" onclick="batchAdd()">审核通过</a>
		<a href="javascript:void(0)" id="batchDelBtn" disabled="true"
			class="easyui-linkbutton" iconCls="icon-cancel" onclick="batchDel()">取消申请</a>
	</div>

</body>
</html>