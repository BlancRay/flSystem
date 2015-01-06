<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="mainframe">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/main.css">
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<title>分流管理系统</title>
</head>
<body class="easyui-layout">
	<div id="topFrame" data-options="region:'north',border:false">
		<jsp:include page="../inc/head.jsp" />
	</div>
	<div data-options="region:'center',border:false">
		<iframe name="mainframe" frameborder="0" height="100%" width="100%"
			src="../notice_list"></iframe>
	</div>
	<div id="leftFrame" data-options="region:'west',border:true"
		style="padding: 10px">
		<ul id="tt" class="easyui-tree">
			<li><a href="../notice_list">系统公告</a></li>
			<li><span>学业管理</span>
				<ul>
					<li><span>选择学生</span>
						<ul>
							<li><a href="student_list.jsp">学生列表</a></li>
							<li><a href="student_confim.jsp">学生信息确认</a></li>
						</ul></li>
					<li><a href="channel_audit.jsp">学生通道选择审核</a></li>
					<li><a href="major_audit.jsp">学生专业选择审核</a></li>
					<li><a href="trainingprogram_audit.jsp">学生培养方案审核</a></li>
					<li><a href="reasearch_audit.jsp">学生科研训练审核</a></li>
				</ul></li>
		</ul>
	</div>
	<div id="bottomFrame" data-options="region:'south',border:false">
		<jsp:include page="../inc/foot.jsp" />
	</div>
</body>
</html>