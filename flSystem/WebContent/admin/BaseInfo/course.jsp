<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/struts-tags"%>
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
<script type="text/javascript"
	src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="${contextPath}/js/fileupload.js"></script>
<script type="text/javascript">
	function goList(page, pgSize) {
		location = "course_list?page=" + page + "&rows=" + pgSize
				+ getSearchParam();
	}
</script>
<title>课程信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">课程信息列表</div>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-add" href="course_add">添加</a>
			<div style="margin-top: 10px">
				筛选条件：
<%-- 				<c:select id="spec" list="specMap" listKey="value" listValue="key"
					headerKey="-1" headerValue="所有专业" value="specId"></s:select>
				<c:select id="grade" list="gradeList" headerKey="-1" listKey="grade"
					listValue="grade" headerValue="所有年级" value="grade"></s:select> --%>
				班级：
				<c:textfield id="className" name="className" size="16"></c:textfield>
				学号：
				<c:textfield id="stuId" name="stuId" size="12"></c:textfield>
				<a class="easyui-linkbutton" iconCls="icon-ok"
					href="javascript:void(0)" onclick="searchb()">确定</a> <a
					class="easyui-linkbutton" href="javascript:void(0)"
					onclick="showAll()">显示所有</a>
			</div>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="80">课程号</th>
				<th width="100">课程名</th>
				<th width="30">性别</th>
				<th width="100">班级</th>
				<th width="50">年级</th>
				<th width="100">专业</th>
				<th width="60">六级成绩</th>
				<th>操作</th>
			</tr>
			<c:iterator value="couList.recs" var="cou">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.sex }</td>
					<td>${stu.className }</td>
					<td>${stu.grade }</td>
					<td>${stu.specialtyName }</td>
					<td>${stu.sixGrade }</td>
					<td><a class="easyui-linkbutton editBtn" iconCls="icon-edit"
						href="student_edit?loginName=${stu.loginName}">编辑</a> <a
						class="easyui-linkbutton delBtn" iconCls="icon-cancel"
						href="javascript:void(0)" stuid="${stu.loginName }">删除</a> <a
						class="easyui-linkbutton passwdBtn" href="javascript:void(0)"
						stuid="${stu.loginName }">重置口令</a></td>
				</tr>
			</c:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination"
				data-options="
                    total:${stuList.num },
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