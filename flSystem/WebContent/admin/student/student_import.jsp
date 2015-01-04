<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<script type="text/javascript" src="${contextPath}/js/fileupload.js"></script>
<title>学生信息导入</title>
</head>
<body>
   <div class="center800">
   	  <div class="firstTitle">学生信息导入</div>
   	  <form id="fileUpload" action="../student_upload" method="post" enctype="multipart/form-data">
   	  	上传待导入的Excel文件：<br />
		<input id="fb" name="upload" class="easyui-filebox" style="width:300px" data-options="buttonText:'请选择文件...'">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-redo'" onclick="uploadFile()">导入</a>
		<a href="${contextPath}/template/studentInfo.xls">下载学生信息模板</a>
   	  </form>
   	  <div style="margin-left: 100px;margin-top:40px;">
   	  	  <pre id="msg"></pre>
   	  </div>
   </div>
</body>
</html>