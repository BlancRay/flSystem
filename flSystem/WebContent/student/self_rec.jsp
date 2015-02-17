<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/main.css"></link>
<link rel="stylesheet" href="../js/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" href="../js/easyui/themes/icon.css"></link>
<link rel="stylesheet" href="../js/kindeditor/themes/default/default.css"></link>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="../js/kindeditor/lang/zh_CN.js"></script>
<s:if test='self_Rec.checked == 0'>
<script>
    var editor1;
	KindEditor.ready(function(K) {
		editor1 = K.create('#content1', {
			uploadJson : 'fileUpload',
			allowFileManager : false,
			items : [	'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|',  'image', 'link','|','fullscreen'],

			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
				});
			}
		});
	});
	
	function submit(ck){
		if(ck == 1){
			$.messager.confirm("信息","确认要提交吗？提交后不能再进行修改...",function(r){
				if(r){
					save(1);
				}
			});
		}
	}
	
	function save(chked){
		editor1.sync();
		var rec = $("#content1").html();
		$.post(
			"stu_saveSelfRec",
			{
				'self_Rec.self_rec':rec,
				'self_Rec.loginName':"${sessionScope.loginUser.loginName}",
				'self_Rec.checked':chked
			},
			function(data){
				if(data.success){
					$.messager.alert("信息","保存成功..","info");
					if(chked == 1){
						location.reload();
					}
				}
				else{
					$.messager.alert("服务器端错误",data.errMsg,"info");
				}
			},
			'json'
		);
	}
</script>
</s:if>
	<style type="text/css">
		.htitle{
			font-size: 26px;
			font-weight: bolder;
			margin: 10px;
			color:red;
			text-align: center;
		}
		
		
	</style>
<title>${initParam.systemName}——</title>
</head>
<body>
    
	<div class="center800 <s:if test='self_Rec.checked == 1'>paper</s:if>">
		<div class="htitle">自荐书</div>
			<div id="content1" style="width:100%;height:500px;">
				${self_Rec.self_rec}
			</div>
		<s:if test='self_Rec.checked == 0'>
		<div style="padding: 20px;text-align: center;">
			<a class="easyui-linkbutton" href="javascript:void(0)" iconCls="icon-save" onclick="save(0)">保存</a>
			<a class="easyui-linkbutton" href="javascript:void(0)" iconCls="icon-ok" onclick="submit(1)">提交</a>
		</div>
		</s:if>
	</div>
</body>
</html>