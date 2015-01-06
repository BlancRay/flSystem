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
<title>系统公告管理</title>
<style type="text/css">
	.titleStyle{
		font-size: 15px;
	}
</style>
<script type="text/javascript">
	 var opt=function(val,row){
		 	r = "<a href='#' recID='" + val + "' class='skimBtn'>预览</a> |"
		 	r += "<a href='#' recID='" + val + "' class='editBtn'>编辑</a> |";
		 	r += " <a href='#' recID='" + val + "' class='delBtn'>删除</a>"
			return r;			
		};
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
	//发布公告
	function publish(){
		window.open("notice_edit.jsp?noticeID=0","mainframe");
	}
	//批量删除
	function batchDel(){
		var rows = $("#noticeList").datagrid("getChecked");
		var ids = new Array();
		$.each(rows,function(){
			ids.push(this.noticeID);
		});
		var id = ids.join(",");
		del(id);
	}
	function del(id){
		$.messager.confirm("信息确认","您确认要删除选中的公告吗？",
			function(r){
				if(r){
					$.post(
							"${contextPath}/admin/notice_delete",
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

	var rowCheck=function(row,idx){
		var rows = $("#noticeList").datagrid("getChecked");
		$("#batchDelBtn").linkbutton(rows.length>0?"enable":"disable");
	}
</script>
</head>
<body>
	<table class="easyui-datagrid" 
		url="${contextPath}/admin/notice_list" 
		pagination="true" 
		fit="true" 
		fitColumns="true"
		selectOnCheck="false"
		rownumbers="true"
		singleSelect="true"
		striped="true"
		data-options="onLoadSuccess:bindEvent,onCheck:rowCheck,onUncheck:rowCheck,onCheckAll:rowCheck,onUncheckAll:rowCheck"
		toolbar="#toolBar"
		pageSize="20"
		title="<span class='titleStyle'>系统公告</span>"
		id="noticeList"
		>
		<thead>
			<tr>
				<th data-options="field:'noticeID',checkbox:true"></th>
				<th field="title" width="200" halign="center">标题</th>
				<th field="pdate" width="160" halign="center" align="center" fixed="true">发布时间</th>
				<th data-options="field:'id',formatter:opt,width:150,halign:'center',fixed:true,align:'center'" >操作</th>
			</tr>
		</thead>
	</table>
	<div id="toolBar" style="padding: 10px">
		<a href="javascript:void(0)"  class="easyui-linkbutton" iconCls="icon-add" onclick="publish()">发布公告</a>
		<a href="javascript:void(0)" id="batchDelBtn" disabled="true"  class="easyui-linkbutton" iconCls="icon-cancel" onclick="batchDel()">删除公告</a>
	</div>
</body>
</html>