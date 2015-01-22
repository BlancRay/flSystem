<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/default/easyui.css">
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
			location = "student_list";
		});
		
		$("#saveBtn").click(function(){
			if($("#spec").val() == ""){
				$("#spec").tooltip("show");
				return;
			}
			if($("#frm").form("validate")){
				$("#frm").submit();
			}
		});
		
		$('#spec').tooltip({
			position: 'right',
			content: '<span style="color:#f">该项必须输入</span>',
			onShow: function(){
				$(this).tooltip('tip').css({
					backgroundColor: '#ff0',
					borderColor: '#f00'
				});
			}
		});
		
		//检查学生是否存在
		$("#stuID").textbox("textbox").blur(function(){
			var stuid = $.trim($(this).val());
			$(this).val(stuid);
			if(stuid != ""){
				$.post(
					"user_exist",
					{loginname:stuid},
					function(data){
						if(data.success){
							if(data.exist){
								$.messager.alert("错误","指定学号已经存在...","error");
								$("#stuID").textbox("setText","");
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
		<form action="student_save" ajax="false" class="easyui-form" id="frm">
			<table class="detailBorder" border="2" width="400">
				<caption class="firstTitle">添加/编辑学生信息</caption>
				<tr>
					<th width="100">学号：</th>
					<td><s:textfield name="stuInfo.loginName" data-options="validType:'length[1,12]'" size="14" cssClass="easyui-textbox" required="true" id="stuID" /></td>
				</tr>
				<tr>
					<th>姓名：</th>
					<td><s:textfield name="stuInfo.uName" data-options="validType:'length[1,30]'" size="20" cssClass="easyui-textbox" required="true"/></td>
				</tr>
				<tr>
					<th>性别：</th>
					<td><s:select list="{'男','女'}" name="stuInfo.sex"/> </td>
				</tr>
				<tr>
					<th>学科分类：</th>
					<td><s:select id="spec" name="stuInfo.bigclassId" list="bcMap" listKey="value" listValue="key" headerKey="NULL" headerValue="选择学科分类"  required="true"></s:select> </td>
				</tr>
				<tr>
					<th>专业：</th>
					<td><s:select name="stuInfo.specialtyID" list="specMap" listKey="value" listValue="key" headerKey="" headerValue="选择专业"></s:select> </td>
				</tr>
				<tr>
					<th>年级：</th>
					<td><s:textfield name="stuInfo.grade" data-options="validType:'length[1,4]'" size="6" cssClass="easyui-numberbox" required="true"/></td>
				</tr>
				<tr>
					<th>班级：</th>
					<td><s:textfield name="stuInfo.className" data-options="validType:'length[1,20]'" size="22" cssClass="easyui-textbox" required="true"/></td>
				</tr>
				<tr>
					<th>六级成绩：</th>
					<td><s:textfield name="stuInfo.sixGrade" max="800" min="0" precision="1" size="6" cssClass="easyui-numberbox" required="true"/></td>
				</tr>
				<tr>
					<th>学分成绩：</th>
					<td><s:textfield name="stuInfo.creditscore" max="800" min="0" precision="1" size="6" cssClass="easyui-numberbox" required="true"/></td>
				</tr>
				<tr>
					<th>有无违纪：</th>
					<td><s:select name="stuInfo.discipline" list="{'无','有' }" /></td>
				</tr>
			</table>
			<input name="stuInfo.oldLoginName" value="${loginName}" type="hidden"/>
		</form>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-ok" id="saveBtn" href="javascript:void(0)">保存</a>
			<a class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn" href="javascript:void(0)">取消</a>
		</div>
	</div>
</body>
</html>