<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${contextPath}/css/main.css"></link>
<link rel="stylesheet"
	href="${contextPath}/js/easyui/themes/metro/easyui.css"></link>
<link rel="stylesheet" href="${contextPath}/js/easyui/themes/icon.css"></link>
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function goList(page, pgSize) {
	location = "stu_subject?page=" + page + "&rows=" + pgSize;
}
</script>
<title>${initParam.systemName}——</title>
</head>
<body>
	<div class="center1000">
		<div class="firstTitle">已选课程列表</div>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-search"
				href="stu_courselist">查找添加课程</a>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="100">课程编码</th>
				<th width="250">课程名称</th>
				<th width="150">课程类型</th>
				<th width="80">学分</th>
				<th width="200">学时</th>
				<th width="200">开课学期</th>
			</tr>
			<s:iterator value="course.recs" var="cou">
				<tr>
					<td>${cou.courseID }</td>
					<td>${cou.courseName }</td>
					<td>${cou.courseType }</td>
					<td>${cou.credit }</td>
					<td>${cou.courseHours }</td>
					<td>${cou.semester }</td>
				</tr>
			</s:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination"
				data-options="
			        total:${course.num },
                    pageSize:${rows},
                    pageNumber:${page},
                    onSelectPage:goList,
                    onChangePageSize:goList,
                    layout:['list','sep','first','prev','links','next','last']
                "></div>
		</div>
	</div>
</body>
</html>