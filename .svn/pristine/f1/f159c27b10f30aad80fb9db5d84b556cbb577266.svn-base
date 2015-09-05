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
	  location = "tts_list?page=" + page + "&rows=" + pgSize + getSearchParam();
  }
  
  //得到筛选参数
  function getSearchParam(){
	  var tName = $.trim($("#tName").val());
	  var sName = $.trim($("#sName").val());
	  var param = "";
	  if(tName != ""){
		  param += "&tName=" + tName;
	  }
	  if(sName != ""){
		 param += "&sName=" + sName; 
	  }
	  return param;
	  
  }

  function searchb(){
	  var p = getSearchParam();
	  alert(p);
	  if( p == ""){
		  $.messager.alert('错误', "请输入筛选条件！！", 'Error');
		  return;
	  }
	  location = "tts_list?page=1&rows=${rows}" + p;
  }
  
  function showAll(){
	  $("#tName").val("");
	  $("#sName").val("");
	  location = "tts_list?page=1&rows=${rows}";
  }
  
  $(function(){
	  //删除单个专业
	  $(".delBtn").click(function(){
		  var ttsID = $(this).attr("ttsID");
		  $.messager.confirm('删除互选信息', '您确定要删除互选号为“'+ ttsID +'”的互选信息吗?<br />此无法恢复...', function(r){
				if (r){
					$.post(
						"tts_delete",
						{ttsID:ttsID},
						function(data){
							if(data.success){
								location.reload();
							}
							else{
								$.messager.alert("错误","操作失败...","Error");
							}
						},
						'json'
					);
				}
			});
	  });
	  $(".editBtn").click(function(){
		  var ttsID = $(this).attr("ttsID");
		  $.messager.confirm('确认互选信息', '您确定要确认互选号为“'+ttsID +'”的互选信息吗?', function(r){
				if (r){
					$.post(
						"tts_add",
						{ttsID:ttsID},
						function(data){
							if(data.success){
								location.reload();
							}
							else{
								$.messager.alert("错误","操作失败...","Error");
							}
						},
						'json'
					);
				}
			});
	  });
	  
  });
</script>
<title>互选信息</title>
</head>
<body>
	<div class="center800">
		<div class="firstTitle">互选信息列表</div>
		<div class="toolbar">
			<div style="margin-top: 10px">
				筛选条件：
				导师姓名：
				<m:textfield id="tName" name="tName" size="12"></m:textfield>
				学生姓名：
				<m:textfield id="sName" name="sName" size="12"></m:textfield>
				<a class="easyui-linkbutton" iconCls="icon-search"
					href="javascript:void(0)" onclick="searchb()">确定</a> <a
					class="easyui-linkbutton" href="javascript:void(0)"
					onclick="showAll()">显示所有</a>
					<a class="easyui-linkbutton" href="pdfDown_tts">导出为PDF</a>
			</div>
		</div>
		<table class="listBorder" width="100%" cellspacing="0">
			<tr><th>ID</th>
				<th width="100">学生姓名</th>
				<th width="150">所属学科大类</th>
				<th width="100">导师姓名</th>
				<th width="150">所属学科大类</th>
				<th width="50">审核状态</th>
				<th width="150">操作</th>
			</tr>
			<m:iterator value="ttsList.recs" var="tts">
				<tr><td>${tts.ttsID }</td>
					<td>${tts.stuname }</td>
					<td>${tts.stubc }</td>
					<td>${tts.uName }</td>
					<td>${tts.bigClassName }</td>
					<td>${tts.status }</td>
					<td><a class="easyui-linkbutton editBtn" iconCls="icon-ok"
						href="javascript:void(0)" ttsID="${tts.ttsID }">通过</a> <a
						class="easyui-linkbutton delBtn" iconCls="icon-cancel"
						href="javascript:void(0)" ttsID="${tts.ttsID }">不通过</a>
				</tr>
			</m:iterator>
		</table>
		<div class="footbar">
			<div class="easyui-pagination"
				data-options="
                    total:${ttsList.num },
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