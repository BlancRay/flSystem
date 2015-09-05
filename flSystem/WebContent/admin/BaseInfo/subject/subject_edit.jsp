<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main.css">
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script charset="utf-8" type="text/javascript" src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<title>${initParam.systemName}——</title>
<style type="text/css">
	th{
		text-align:right;
	}
	th,td{
		line-height: 2;
		padding: 5px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#cancelBtn").click(function(){
			location = "subject_list";
		});
		
		$("#saveBtn").click(function(){
			if($("#frm").form("validate")){
				$("#frm").submit();
			}
		});
		
		
		//检查学生是否存在
		$("#subjectID").textbox("textbox").blur(function(){
			var subjectid = $.trim($(this).val());
			$(this).val(courseid);
			if(subjectid != ""){
				$.post(
					"subject_exist",
					{subjectID:subjectid},
					function(data){
						if(data.success){
							if(data.exist){
								$.messager.alert("错误","指定学科号已经存在...","error");
								$("#subjectID").textbox("setText","");
							}
						}
						else{
							$.messager.alert("错误","服务器端出错...","error");
						}
					}
				);
			}
		});
	});
</script>
</head>
<body>
	<div class="center800" >
		<form action="subject_save" ajax="false" class="easyui-form" id="frm">
			<table class="detailBorder" border="2" width="400">
				<caption class="firstTitle">添加/编辑学科大类信息</caption>
				<tr>
					<th width="100">学科大类号：</th>
					<td><s:textfield name="subjectInfo.bigClassID" data-options="validType:'length[1,12]'" size="15" cssClass="easyui-textbox" required="true" id="subjectID" /></td>
				</tr>
				<tr>
					<th>学科大类：</th>
					<td><s:textfield name="subjectInfo.bigClassName" data-options="validType:'length[1,30]'" size="20" cssClass="easyui-textbox" required="true"/></td>
				</tr>
				<tr>
					<th>描述：</th>
					<td><s:textfield name="subjectInfo.descript" data-options="validType:'length[1,200]'" size="50" cssClass="easyui-textbox" required="true"/></td>
				</tr>
			</table>
			<input name="subjectInfo.oldsubjectID" value="${bigClassID}" type="hidden"/>
		</form>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-ok" id="saveBtn" href="javascript:void(0)">保存</a>
			<a class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn" href="javascript:void(0)">取消</a>
		</div>
	</div>
</body>
</html>