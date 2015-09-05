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
		location = "stu_courselist?page=" + page + "&rows=" + pgSize
				+ getSearchParam();
	}
	function getSearchParam(){
		  var courseType = $.trim($("#courseType").val());
		  var courseName = $.trim($("#courseName").val());
		  var param = "";
		  /* if(spec != -1 ){
			  param += "&specId=" + spec;
		  }
		  if(grade != -1){
			  param += "&grade=" + grade;
		  } */
		  if(courseType != ""){
			  param += "&courseType=" + courseType;
		  }
		  if(courseName != ""){
			 param += "&courseName=" + courseName; 
		  }
		  return param;
	  }
	  
	  function searchb(){
		  var p = getSearchParam();
		  if( p == ""){
			  $.messager.alert('错误', "请输入筛选条件！！", 'Error');
			  return;
		  }
		 location = "stu_courselist?page=1&rows=${rows}" + p;
	  }
	  
	  function showAll(){
		  $("#courseType").val("");
		  $("#courseName").val("");
		  location = "stu_courselist?page=1&rows=${rows}";
	  }
	  
	  $(function(){
		  //删除单个专业
		  $(".addBtn").click(function(){
			  var courseID = $(this).attr("courseID");
			  $.messager.confirm('删除专业信息', '您确定要删除课程号为“'+ courseID +'”的专业信息吗?<br />这将会删除该课程的所有相关信息，且无法恢复...', function(r){
					if (r){
						$.post(
							"stu_courseadd",
							{courseID:courseID},
							function(data){
								if(data.success){
									location.reload();/* 跳转到stu_subject */
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
		  
	  });
</script>
<title>课程信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">课程信息列表</div>
		<div class="toolbar">
			<!-- <a class="easyui-linkbutton" iconCls="icon-add" href="stu_courseadd">添加</a> -->
			<div style="margin-top: 10px">
				筛选条件：
				类型：
				<c:select id="courseType" list="{'请选择','学科大类基础','学科基础课','专业课','集中实践环节','其它'}" name="courseType"/>
				课程名：
				<c:textfield id="courseName" name="courseName" size="12"></c:textfield>
				<a class="easyui-linkbutton" iconCls="icon-search"
					href="javascript:void(0)" onclick="searchb()">确定</a> <a
					class="easyui-linkbutton" href="javascript:void(0)"
					onclick="showAll()">显示所有</a>
			</div>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="80">课程号</th>
				<th width="200">课程名</th>
				<th width="50">学分</th>
				<th width="100">类型</th>
				<th width="50">学时</th>
				<th width="150">操作</th>
			</tr>
			<c:iterator value="courseList.recs" var="cou">
				<tr>
					<td>${cou.courseID }</td>
					<td>${cou.courseName }</td>
					<td>${cou.credit }</td>
					<td>${cou.courseType }</td>
					<td>${cou.courseHours }</td>
					<td><a class="easyui-linkbutton addBtn" iconCls="icon-add"
						href="javascript:void(0)" courseID="${cou.courseID}">添加</a>
				</tr>
			</c:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination"
				data-options="
                    total:${courseList.num },
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