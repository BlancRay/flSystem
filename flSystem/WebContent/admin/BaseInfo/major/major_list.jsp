<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="/struts-tags"%>
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
  function goList(page,pgSize){
	  location = "major_list?page=" + page + "&rows=" + pgSize + getSearchParam();
  }
  
  //得到筛选参数
  function getSearchParam(){
	  var bigClassName = $.trim($("#bigClassName").val());
	  var specialtyID = $.trim($("#specialtyID").val());
	  var param = "";
	  if(bigClassName != ""){
		  param += "&bigClassName=" + bigClassName;
	  }
	  if(specialtyID != ""){
		 param += "&specialtyID=" + specialtyID; 
	  }
	  return param;
	  
  }

  function searchb(){
	  var p = getSearchParam();
	  if( p == ""){
		  $.messager.alert('错误', "请输入筛选条件！！", 'Error');
		  return;
	  }
	  location = "major_list?page=1&rows=${rows}" + p;
  }
  
  function showAll(){
	  $("#specialtyID").val("");
	  $("#bigClassName").val("");
	  location = "major_list?page=1&rows=${rows}";
  }
  
  $(function(){
	  //删除单个专业
	  $(".delBtn").click(function(){
		  var specialtyID = $(this).attr("specialtyID");
		  $.messager.confirm('删除专业信息', '您确定要删除专业号为“'+ specialtyID +'”的专业信息吗?<br />这将会删除该专业的所有相关信息，且无法恢复...', function(r){
				if (r){
					$.post(
						"major_delete",
						{specialtyID:specialtyID},
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
	  
  });
</script>
<title>专业信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">专业信息列表</div>
		<div class="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-add" href="major_add">添加</a>
			<div style="margin-top: 10px">
				筛选条件：
<%-- 				<m:select id="spec" list="specMap" listKey="value" listValue="key"
					headerKey="-1" headerValue="所有专业" value="specId"></m:select>
				<m:select id="grade" list="gradeList" headerKey="-1" listKey="grade"
					listValue="grade" headerValue="所有年级" value="grade"></m:select> --%>
				所属学科大类：
				<m:textfield id="bigClassName" name="bigClassName" size="16"></m:textfield>
				专业号：
				<m:textfield id="specialtyID" name="specialtyID" size="12"></m:textfield>
				<a class="easyui-linkbutton" iconCls="icon-search"
					href="javascript:void(0)" onclick="searchb()">确定</a> <a
					class="easyui-linkbutton" href="javascript:void(0)"
					onclick="showAll()">显示所有</a>
					<a class="easyui-linkbutton" href="pdfDown_major">导出为PDF</a>
			</div>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr>
				<th width="50">专业号</th>
				<th width="80">所属学科大类</th>
				<th width="100">专业名</th>
				<th width="100">专业简介</th>
				<th>操作</th>
			</tr>
			<m:iterator value="majorList.recs" var="major">
				<tr>
					<td>${major.specialtyID }</td>
					<td>${major.bigClassName }</td>
					<td>${major.specialtyName }</td>
					<td>${major.descript }</td>
					<td><a class="easyui-linkbutton editBtn" iconCls="icon-edit"
						href="major_edit?specialtyID=${major.specialtyID}">编辑</a> <a
						class="easyui-linkbutton delBtn" iconCls="icon-cancel"
						href="javascript:void(0)" specialtyID="${major.specialtyID }">删除</a></td>
				</tr>
			</m:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination"
				data-options="
                    total:${majorList.num },
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