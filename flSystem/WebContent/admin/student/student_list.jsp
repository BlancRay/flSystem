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
<script type="text/javascript">
  function goList(page,pgSize){
	  location = "student_list?page=" + page + "&rows=" + pgSize + getSearchParam();
  }
  
  //得到筛选参数
  function getSearchParam(){
	  var spec = $("#spec").val();
	  var grade = $("#grade").val();
	  var className = $.trim($("#className").val());
	  var stuId = $.trim($("#stuId").val());
	  var param = "";
	  if(spec != -1 ){
		  param += "&specId=" + spec;
	  }
	  if(grade != -1){
		  param += "&grade=" + grade;
	  }
	  if(className != ""){
		  param += "&className=" + className;
	  }
	  if(stuId != ""){
		 param += "&stuId=" + stuId; 
	  }
	  return param;
  }
  
  function searchb(){
	  var p = getSearchParam();
	  if( p == ""){
		  $.messager.alert('错误', "请输入筛选条件！！", 'Error');
		  return;
	  }
	  location = "student_list?page=1&rows=${rows}" + p;
  }
  
  function showAll(){
	  $("#spec").val(-1);
	  $("#grade").val(-1);
	  $("#className").val("");
	  $("#stuId").val("");
	  location = "student_list?page=1&rows=${rows}";
  }
  
  $(function(){
	  //删除单个学生
	  $(".delBtn").click(function(){
		  var stuid = $(this).attr("stuid");
		  $.messager.confirm('删除学生信息', '您确定要删除学号为“'+ stuid +'”的学生吗?<br />这将会删除该学生的所有相关信息，且无法恢复...', function(r){
				if (r){
					$.post(
						"student_delete",
						{stuId:stuid},
						function(data){
							if(data.success){
								location.reload();
							}
							else{
								$.messager.alert("错误","删除失败...","Error");
							}
						},
						'json'
					);
				}
			});
	  });
	  
	  $(".passwdBtn").click(function(){
		  var stuid = $(this).attr("stuid");
		  $.messager.confirm('重置口令', '您确定要重置学为“'+ stuid +'”的学生的口令吗?', function(r){
			  if(r){
				  $.post(
						"student_resetPasswd",
						{stuId:stuid},
						function(data){
							if(data.success){
								$.messager.alert("信息",stuid + "的口令重置为：123456","Info");
							}
							else{
								$.messager.alert("错误","重置口令失败...","Error");
							}
						},
						'json'
				  );
			  }
		  });
	  });
  });
</script>

<title>学生信息列表</title>
</head>
<body>
	<div class="center1000">
		<div class="firstTitle">学生信息列表</div>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-add" href="student_add">添加</a>
			<!-- 
			<a class="easyui-linkbutton" iconCls="icon-remove">删除符合条件</a>
			 -->
			<div style="margin-top: 10px">
			筛选条件：
			<s:select id="spec" list="specMap" listKey="value" listValue="key" headerKey="-1" headerValue="所有专业" value="specId"></s:select>
			<s:select id="grade" list="gradeList"  headerKey="-1"  listKey="grade" listValue="grade" headerValue="所有年级" value="grade"></s:select>
			班级：<s:textfield id="className"  name="className" size="16"></s:textfield>
			学号：<s:textfield id="stuId" name="stuId" size="12"></s:textfield>
			<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="searchb()">确定</a>
			<a class="easyui-linkbutton" href="javascript:void(0)" onclick="showAll()">显示所有</a>
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
			<s:iterator value="stuList.recs" var="stu">
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
						<a class="easyui-linkbutton editBtn" iconCls="icon-edit" href="student_edit?loginName=${stu.loginName}">编辑</a>
						<a class="easyui-linkbutton delBtn" iconCls="icon-cancel" href="javascript:void(0)" stuid="${stu.loginName }">删除</a>
						<a class="easyui-linkbutton passwdBtn" href="javascript:void(0)" stuid="${stu.loginName }">重置口令</a>
					</td>
				</tr>
			</s:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination" data-options="
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