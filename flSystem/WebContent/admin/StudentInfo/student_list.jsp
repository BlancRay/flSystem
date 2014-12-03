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
<title>学生列表</title>
<style type="text/css">
.titleStyle {
	font-size: 20px;
}
</style>

<script type="text/javascript">

var opt=function(val,row){
 	
 	r = "<a href='#' recID='" + val + "' class='editBtn'>编辑</a> |";
 	r += " <a href='#' recID='" + val + "' class='delBtn'>删除</a>"
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
	

	
	function del(id){
		$.messager.confirm("信息确认","您确认要删除选中的学生信息吗？",
			function(r){
				if(r){
					$.post(
							"${contextPath}/admin/student_delete",
							{ids:id},
							function(data){
								if(data.success){
									$.messager.alert('Info', '删除成功', 'info');
									$("#noticeList").datagrid('reload');
								}
							},
							'json'
						);
				}
			}
		);
	}
</script>
</head>
<body>
	<table class="easyui-datagrid" url="${contextPath}/admin/notice_list"
		pagination="true" fit="true" fitColumns="true" selectOnCheck="false"
		rownumbers="true" singleSelect="true" striped="true"
		data-options="onLoadSuccess:bindEvent"
		toolbar="#toolBar" pageSize="10"
		title="<span class='titleStyle'>学生列表 </span>" id="studentList">
		<thead>
			<tr>
				
				<th field="uname" width="200" halign="center">姓名</th>
				<th field="loginname" width="200" halign="center">学号</th>
				<th field="sex" width="200" halign="center">性别</th>
				<th field="bigClassID" width="200" halign="center">学科大类</th>
				<th field="self_rec" width="200" halign="center">自荐书</th>
				<th
					data-options="field:'id',formatter:opt,width:150,halign:'center',fixed:true,align:'center'">操作</th>
			
			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
	<span>姓名:</span> <input id="uname"
			style="line-height: 26px; border: 1px solid #ccc"> <span>学号:</span>
	<input id="specialtyID"
			style="line-height: 26px; border: 1px solid #ccc">
	<a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()"
			iconCls="icon-search">查询</a>
	</div>
</body>
</html>