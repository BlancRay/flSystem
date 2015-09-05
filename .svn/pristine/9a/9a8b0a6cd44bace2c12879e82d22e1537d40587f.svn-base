<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<title>分流管理系统</title>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',border:false,onResize:pRelocation" id="centerFrame">
		<div class="easyui-panel" border="false">
			<div id="noticeFrame" class="easyui-panel" border="false">
				<img src="images/noticeIco.png"><img src="images/noticeTitle.png">
			   <hr width="90%" color="#ccc" style="margin: 5px">
			   <div class="notice">
			   	<s:iterator value="result.rows" var="row">
			   	  <dl>
				   	  <dt>${row.pdate}</dt>
				   	  <dd><a target="_blank" href="notice_detail?noticeID=${row.noticeID}">${row.title}</a></dd>
				   </dl>
				</s:iterator>
			   </div> 
			   <div id="pgNav" class="easyui-pagination" data-options="
					total:${result.total},
					pageSize:15,
					pageNumber:${page},
					layout:['first','prev','links','next','last'],
					onSelectPage:toPage
				"></div>
			</div>
		</div>
	</div>
</body>
</html>