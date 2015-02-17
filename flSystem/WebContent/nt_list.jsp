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
	href="${contextPath}/js/easyui/themes/metro/easyui.css">
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
<title>系统公告test</title>
<style type="text/css">
.titleStyle {
	font-size: 15px;
}

#msgDiv {
	z-index: 10001;
	width: 500px;
	height: 400px;
	background: white;
	border: #336699 1px solid;
	position: absolute;
	left: 50%;
	top: 20%;
	font-size: 12px;
	margin-left: -225px;
	display: none;
}

#bgDiv {
	/*     display: none; */
	background-color: #777;
	/* 	display: none; */
}
</style>
<script type="text/javascript">
	var opt = function(val, row) {
		r = "<a href='#' recID='" + val + "' class='skimBtn'>浏览</a>"
		return r;
	};
	var bindEvent = function() {
		$(".skimBtn").click(function() {
			// 		window.open("${contextPath}/notice_detail?noticeID="+$(this).attr("recID"),"_blank");
			showDetail();
		});
	};
	var q=document.getElementById("qwe").value;
</script>
<script type="text/javascript">
	function showDetail() {
		//背景
		var bgObj = document.getElementById("bgDiv");
		bgObj.style.width = document.body.offsetWidth + "px";
		bgObj.style.height = screen.height + "px";

		//定义窗口
		var msgObj = document.getElementById("msgDiv");
		msgObj.style.marginTop = -75 + document.documentElement.scrollTop
				+ "px";

		//关闭
		document.getElementById("close").onclick = function() {
		 bgObj.style.display = msgObj.style.display = "none";
		 } 
		msgObj.style.display = bgObj.style.display = "block";
				msgDetail.innerHTML = "显示详细"
</script>
</head>
<body class="easyui-layout">
	<div id="msgDiv">
		<div id="msgShut" align="right">
			<a id="close" class="easyui-linkbutton"
				iconCls="icon-cancel">关闭</a>
		</div>
		<div id="msgDetail">
<!-- 		和 showDetail()中的关闭重叠-->
		</div>
	</div>
	<div id="bgDiv"></div>
	<!-- datagrid url= actionXML中的namespace下的action的name值，如：${contextPath}/nt/nt_list-->
	<table class="easyui-datagrid" url="${contextPath}/nt/nt_list"
		fitColumns="true" pagination="true" fit="true" fitColumns="true"
		selectOnCheck="false" rownumbers="true" singleSelect="true"
		striped="true" toolbar="#toolBar" pageSize="10"
		data-options="onLoadSuccess:bindEvent"
		title="<span class='titleStyle'>通知公告</span>" id="tt">
		<thead>
			<tr>
				<!-- 				<th data-options="field:'noticeID',checkbox:true"></th> -->
				<th field="title" width="200" halign="center" align="center">标题</th>
				<th field="pdate" width="160" halign="center" align="center"
					fixed="true">发布时间</th>
				<th
					data-options="field:'id',formatter:opt,width:150,halign:'center',fixed:true,align:'center'">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>