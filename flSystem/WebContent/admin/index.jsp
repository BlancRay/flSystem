<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="mainframe">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
<title>分流管理系统——系统管理</title>
</head>
<body class="easyui-layout">
	<div id="topFrame" data-options="region:'north',border:false">
		<jsp:include page="../inc/head.jsp" />
	</div>
	<div data-options="region:'center',border:false">
		<iframe name="mainframe" frameborder="0" height="100%" width="100%" src="notice/notice_list.jsp"></iframe>
	</div>
	<div id="leftFrame" data-options="region:'west',border:true" style="padding: 10px">
		<ul id="tt" class="easyui-tree">
			<li><a href="notice/notice_list.jsp">系统公告</a></li>
			<li>
				<span>基本信息管理</span>
				<ul>
					<li><a href="BaseInfo/course.jsp">课程信息</a></li>
					<li><a href="BaseInfo/major.jsp">专业信息</a></li>
					<li><a href="BaseInfo/subject.jsp">学科大类信息</a></li>
				</ul>
			</li>
			<li>
				<span>导师信息管理</span>
				<ul>
					<li><a href="TutorInfo/tutor_list.jsp">导师列表</a></li>
					<li><a href="TutorInfo/tutorinfo_audit.jsp">导师信息审核</a></li>
					<li><a href="TutorInfo/tutorinfo_import.jsp">导师信息导入</a></li>
				</ul>
			</li>
			<li>
				<span>学生信息管理</span>
				<ul>
					<li><a href="StudentInfo/student_list.jsp">学生列表</a></li>
					<li><a href="StudentInfo/studentinfo_audit.jsp">学生信息审核</a></li>
					<li><a href="StudentInfo/studentinfo_import.jsp">学生信息导入</a></li>
				</ul>
			</li>
			<li>
				<span>系统管理</span>
				<ul>
					<li><a href="System/interchoice.jsp">导师学生互选</a></li>
					<li><a href="System/channel.jsp">通道选择</a></li>
					<li><a href="System/major.jsp">专业选择</a></li>
					<li><a href="System/trainingprogram.jsp">培养方案</a></li>
					<li><a href="System/research.jsp">科研训练</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="bottomFrame" data-options="region:'south',border:false">
		<jsp:include page="../inc/foot.jsp" />
	</div>
</body>
</html>