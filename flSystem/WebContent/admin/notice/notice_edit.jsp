<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
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
<title>分流管理系统——系统公告</title>
</head>
<body>
	<form id="nt" action="${contextPath}/admin/notice_save" 
		class="easyui-form" method="post" 
		data-options="novalidate:true,ajax:true,success:formSubmit">
		<table style="width:80%;margin:10px auto" cellpadding="10" cellspacing="10">
			<caption style="font-size: 24px;font-weight: bold;margin: 20px">
				发布/编辑系统公告
			</caption>
			<tr>
				<th align="right" width="10%">标题：</th>
				<td><input id="title" style="width:600px" class="easyui-textbox"  type="text" name="notice.title" data-options="required:true" /></td>
			</tr>
			<tr>
				<th align="right" width="80">内容：</th>
				<td width="89%">
					<textarea id="content" name="notice.content" style="height: 320px;width:100%"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" onclick="submitForm()">保存</a>
					 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" onclick="cancel()">取消</a>
				</td>
			</tr>
		</table>
		<input type="hidden" name="notice.noticeID" id="noticeID"/>
	</form>
	<script type="text/javascript">
		$(function(){
			$.post(
				'${contextPath}/admin/notice_edit',
				{noticeID:${param.noticeID}},
				function(data){
					$("#noticeID").val(data.noticeID);
					$("#title").textbox('setText',data.title);
					editor.html(data.content);
				},
				'json'
			);
			 $('#nt').form('submit',{
				 onSubmit:function(){
					//表单校验
				 	return $(this).form('enableValidation').form('validate');
				 }
			});
		});

		//创建编辑器
		var editor =KindEditor.create('#content', {
			resizeType : 0,
			uploadJson : '${contextPath}/admin/file_upload',
            fileManagerJson : '${contextPath}/admin/file_manage',
            allowFileManager : true,
			items : ['fullscreen','|','insertorderedlist','insertunorderedlist', '|','link','unlink','|','insertfile']
		});

		//提交表单
		function submitForm(){
			editor.sync();//同步编辑器
			$('#nt').form('submit');
		}

		var formSubmit=function(data){
			 var data = eval('(' + data + ')');
			 if(data.success){
				 $.messager.alert('Info', data.message, 'info',function(r){
					 location.replace("notice_list.jsp");
			     });
				 
			}
		}

		function cancel(){
			location.replace("notice_list.jsp");
		}
	</script>
</body>
</html>