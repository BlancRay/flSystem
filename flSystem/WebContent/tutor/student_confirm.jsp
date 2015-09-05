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
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/main.css">
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script charset="utf-8" type="text/javascript" src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
$(function(){
	  //拒绝学生申请
	  $(".applyBtn").click(function(){
		  var stuid = $(this).attr("stuid");
		  $.messager.confirm('同意学生申请', '您确定要同意学号为“'+ stuid +'”的学生的申请吗?', function(r){
				if (r){
					$.post(
						"student_apply",
						{stuId:stuid},
						function(data){
							if(data.success){
								location.reload();
							}
							else{
								$.messager.alert("错误","操作失败...，请刷新页面或联系管理员","Error");
							}
						},
						'json'
					);
				}
			});
	  });
});
  $(function(){
	  //拒绝学生申请
	  $(".rejectBtn").click(function(){
		  var stuid = $(this).attr("stuid");
		  $.messager.confirm('拒绝学生申请', '您确定要拒绝学号为“'+ stuid +'”的学生的申请吗?', function(r){
				if (r){
					$.post(
						"student_reject",
						{stuId:stuid},
						function(data){
							if(data.success){
								location.reload();
							}
							else{
								$.messager.alert("错误","操作失败...，请刷新页面或联系管理员","Error");
							}
						},
						'json'
					);
				}
			});
	  });
  });
</script>

<title>待招收学生信息列表</title>
</head>
<body>
	<div class="center1000">
		<div class="firstTitle">待招收学生信息列表</div>
		<div class="toolbar">
			<div style="margin-top: 10px">
				招生名额：${self_Rec.quota }
				剩余招生名额：${self_Rec.remainquota }
			</div>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="80">学号</th>
				<th>姓名</th>
				<th width="30">性别</th>
				<th width="100">班级</th>
				<th width="50">年级</th>
				<th width="160">学科大类</th>
				<th width="60">六级成绩</th>
				<th width="50">学分成绩</th>
				<th width="50">有无违纪</th>
				<th width="180">操作</th>
			</tr>
			<s:iterator value="tstuList.recs" var="stu">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.sex }</td>
					<td>${stu.className }</td>
					<td>${stu.grade }</td>
					<td>${stu.bigClassName }</td>
					<td>${stu.sixGrade }</td>
					<td>${stu.creditscore }</td>
					<td>${stu.discipline }</td>
					<td>
						<a class="easyui-linkbutton applyBtn" iconCls="icon-edit" href="javascript:void(0)" stuid="${stu.loginName }">同意招收</a>
						<a class="easyui-linkbutton rejectBtn" iconCls="icon-cancel" href="javascript:void(0)" stuid="${stu.loginName }">拒绝申请</a>
					</td>
				</tr>
			</s:iterator>
		</table>
<%-- 		<div class="footbar">
			<div class="easyui-pagination" data-options="
                    total:${tstuList.num },
                    pageSize:${rows},
                    pageNumber:${page},
                    onSelectPage:goList,
                    onChangePageSize:goList,
                    layout:['list','sep','first','prev','links','next','last']
                "></div>
		</div> --%>
	</div>
</body>
</html>