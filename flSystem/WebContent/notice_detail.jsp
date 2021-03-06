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
	href="js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<title>分流管理系统——通知公告详细</title>
</head>
<body class="easyui-layout">
	<div id="topFrame" data-options="region:'north',border:false">
		<jsp:include page="inc/head1.jsp" />
	</div>
	<div data-options="region:'center',border:false" id="centerFrame">
		<div id="noticeDetail">
			<dl>
				<dt>
					<span class="title">${result.title}</span><br /> <span>发布日期：${result.pdate}
						&nbsp;&nbsp;浏览次数：${result.skipNum} </span>
				</dt>
				<dd>${result.content}</dd>
			</dl>
		</div>
		<div class="CloseButton">
			<input type="button" value="关闭窗口" onClick="javascript:window.close()" />
		</div>
	</div>
	<div id="bottomFrame" data-options="region:'south',border:false">
		<jsp:include page="inc/foot.jsp" />
	</div>
</body>
</html>
