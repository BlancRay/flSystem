<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>导师信息导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/jquery-easyui-1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/jquery-easyui-1.4/themes/icon.css">
<script type="text/javascript"
	src="${contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript"
	src="${contextPath}/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script>
	var sex = [ {
		sextype : 'male',
		name : '男'
	}, {
		sextype : 'female',
		name : '女'
	}, ];
	$(function() {
		$('#tt').datagrid({
			title : '导师信息导入',
			iconCls : 'icon-edit',
			width : 660,
			height : 250,
			singleSelect : true,
			idField : 'ID',
			columns : [ [ {
				field : 'ID',
				title : '序号',
				align : 'center',
				width : 60
			}, {
				field : 'uname',
				title : '姓名',
				width : 100,
				align : 'center',
				editor : 'text',
			}, {
				field : 'listprice',
				title : '工号',
				width : 80,
				align : 'center',
				editor : 'numberbox'
			}, {
				field : 'unitcost',
				title : '性别',
				width : 80,
				align : 'center',
				editor : {
					type : 'combobox',
					options : {
						valueField : 'sextype',
						textField : 'name',
						data : sex,
						required : true
					}
				}
			}, {
				field : 'attr1',
				title : '学科大类',
				width : 180,
				align : 'center',
				editor : 'text'
			}, {
				field : 'status',
				title : '审核状态',
				width : 50,
				align : 'center'
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				align : 'center',
				formatter : function(value, row, index) {
					if (row.editing) {
						var s = '<a href="#" onclick="saverow(this)">保存</a> ';
						var c = '<a href="#" onclick="cancelrow(this)">取消</a>';
						return s + c;
					} else {
						var e = '<a href="#" onclick="editrow(this)">编辑</a> ';
						var d = '<a href="#" onclick="deleterow(this)">删除</a>';
						return e + d;
					}
				}
			} ] ],
			onBeforeEdit : function(index, row) {
				row.editing = true;
				updateActions(index);
			},
			onAfterEdit : function(index, row) {
				row.editing = false;
				updateActions(index);
			},
			onCancelEdit : function(index, row) {
				row.editing = false;
				updateActions(index);
			}
		});
	});
	function updateActions(index) {
		$('#tt').datagrid('updateRow', {
			index : index,
			row : {}
		});
	}
	function getRowIndex(target) {
		var tr = $(target).closest('tr.datagrid-row');
		return parseInt(tr.attr('datagrid-row-index'));
	}
	function editrow(target) {
		$('#tt').datagrid('beginEdit', getRowIndex(target));
	}
	function deleterow(target) {
		$.messager.confirm('确认', '确定要删除吗？', function(r) {
			if (r) {
				$('#tt').datagrid('deleteRow', getRowIndex(target));
			}
		});
	}
	function saverow(target) {
		$('#tt').datagrid('endEdit', getRowIndex(target));
	}
	function cancelrow(target) {
		$('#tt').datagrid('cancelEdit', getRowIndex(target));
	}
	function insert() {
		var row = $('#tt').datagrid('getSelected');
		if (row) {
			var index = $('#tt').datagrid('getRowIndex', row);
		} else {
			index = 0;
		}
		$('#tt').datagrid('insertRow', {
			index : index,
			row : {
				status : 'P'
			}
		});
		$('#tt').datagrid('selectRow', index);
		$('#tt').datagrid('beginEdit', index);
	}
</script>
</head>
<body>
	<h2>手动导入信息</h2>

	<div style="margin: 10px 0">
		<a href="#" class="easyui-linkbutton" onclick="insert()">添加</a>
	</div>

	<table id="tt"></table>
	<h2>格式化导入</h2>
	<form action="UploadFile.action" method="post"
		enctype="multipart/form-data" id="uploadForm">
		选择要上传的文件：<input type="file" name="file" size="50"><br>
		<input type="submit" value="上传">
	</form>
</body>
</html>