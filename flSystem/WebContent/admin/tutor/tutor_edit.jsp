<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		var Name = $.trim($("#uName").val());
		$("#cancelBtn").click(function(){
			location = "tutor_list";
		});
		
		$("#saveBtn").click(function(){
			if($("#frm").form("validate")){
				$("#frm").submit();
			}
		});
		
		$('#type').tooltip({
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
		$("#tutorID").textbox("textbox").blur(function(){
			var stuid = $.trim($(this).val());
			$(this).val(tutorid);
			if(tutorid != ""){
				$.post(
					"user_exist",
					{loginname:tutorid},
					function(data){
						if(data.success){
							if(data.exist){
								$.messager.alert("错误","指定工号已经存在...","error");
								$("#tutorID").textbox("setText","");
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
		<form action="tutor_save" ajax="false" class="easyui-form" id="frm">
			<table class="detailBorder" border="2" width="400">
				<caption class="firstTitle">添加/编辑导师信息</caption>
				<tr>
					<th width="100">工号：</th>
					<td><s:textfield name="tutorInfo.loginName" data-options="validType:'length[1,12]'" size="14" cssClass="easyui-textbox" required="true" id="tutorID" /></td>
				</tr>
				<tr>
					<th>姓名：</th>
					<td><s:textfield name="tutorInfo.uName" data-options="validType:'length[1,10]'" size="20" cssClass="easyui-textbox" required="true"/></td>
				</tr>
				<tr>
					<th>性别：</th>
					<td><s:select list="{'男','女'}" name="tutorInfo.sex" /> </td>
				</tr>
				<tr>
					<th>类别：</th>
					<td><s:select id="type" name="tutorInfo.type" list="{'硕士生导师','博士生导师'}" required="true"></s:select> </td>
				</tr>
				<tr>
					<th>招生名额：</th>
					<td><s:textfield name="tutorInfo.quota" data-options="validType:'length[1,20]'" size="6" cssClass="easyui-numberbox" required="true"></s:textfield> </td>
				</tr>
				<tr>
					<th>所在学院：</th>
					<td><s:textfield name="tutorInfo.college" data-options="validType:'length[1,20]'" size="22" cssClass="easyui-textbox" required="true"/></td>
				</tr>
				<tr>
					<th>联系电话：</th>
					<td><s:textfield name="tutorInfo.phone" data-options="validType:'length[1,20]'" size="22" cssClass="easyui-textbox"/></td>
				</tr>
				<tr>
					<th>电子邮箱：</th>
					<td><s:textfield name="tutorInfo.email" data-options="validType:'length[1,20]'" size="22" cssClass="easyui-textbox"/></td>
				</tr>
			</table>
			<input name="tutorInfo.oldLoginName" value="${loginName}" type="hidden"/>
		</form>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-ok" id="saveBtn" href="javascript:void(0)">保存</a>
			<a class="easyui-linkbutton" iconCls="icon-cancel" id="cancelBtn" href="javascript:void(0)">取消</a>
		</div>
	</div>
</body>
</html>