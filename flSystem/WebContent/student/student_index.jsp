<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="mainframe">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="../js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<title>分流管理系统</title>
</head>
<body class="easyui-layout">
	<div id="topFrame" data-options="region:'north',border:false">
		<jsp:include page="../inc/head.jsp" />
	</div>
	<div data-options="region:'center',border:false">
		<iframe name="mainframe" frameborder="0" height="100%" width="100%"
			src="notice_list"></iframe>
	</div>
	<div id="leftFrame" data-options="region:'west',border:true"
		style="padding: 10px">
		<ul id="tt" class="easyui-tree">
			<li><a href="../notice_list">系统公告</a></li>
			
			<li><span>学业管理</span>
				<ul>
					<li><span>导师选择</span>
						<ul>
							<li><a href="tutor_search.jsp">导师查询</a></li>
							<li><a href="tutor_choice.jsp">选择导师</a></li>
						</ul></li>
					<li><a href="channel.jsp">通道选择</a></li>
					<li><a href="major.jsp">专业选择</a></li>
					<li><a href="trainingprogram.jsp">查看培养方案</a></li>
					<li><a href="subject.jsp">选择培养方案</a></li>
					<li><a href="research.jsp">科研训练</a></li>
				</ul></li>
		</ul>
	</div>
	<div id="bottomFrame" data-options="region:'south',border:false">
		<jsp:include page="../inc/foot.jsp" />
	</div>
</body>
</html>