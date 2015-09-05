<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${contextPath}/css/main.css"></link>
<link rel="stylesheet" href="${contextPath}/js/easyui/themes/metro/easyui.css"></link>
<link rel="stylesheet" href="${contextPath}/js/easyui/themes/icon.css"></link>
<link rel="stylesheet" href="${contextPath}/js/kindeditor/themes/default/default.css"></link>
<script type="text/javascript" src="${contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${contextPath}/js/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="${contextPath}/js/kindeditor/lang/zh_CN.js"></script>
<s:if test='self_Rec.specselected == 0'>
<script>
    function submit(ck){
		if(ck == 1){
			$.messager.confirm("信息","确认要提交吗？提交后不能再进行修改...",function(r){
				if(r){
					save(1);
				}
			});
		}
	}
	
	function save(chked){
		editor1.sync();
		var rec = $("#content1").html();
		$.post(
			"stu_saveSelfRec",
			{
				'self_Rec.self_rec':rec,
				'self_Rec.loginName':"${sessionScope.loginUser.loginName}",
				'self_Rec.checked':chked
			},
			function(data){
				if(data.success){
					$.messager.alert("信息","保存成功..","info");
					if(chked == 1){
						location.reload();
					}
				}
				else{
					$.messager.alert("服务器端错误",data.errMsg,"info");
				}
			},
			'json'
		);
	}
	
	//得到筛选参数
	  function getSearchParam(){
		  var spec = $("#spec").val();
		 
		  var param = "";
		  if(spec != -1 ){
			  param += "&specId=" + spec;
		  }
		  return param;
	  }
</script>
</s:if>
<title>${initParam.systemName}——</title>
</head>
<body>
    
	<div class="center800 <s:if test='self_Rec.specselected ！= 0'></s:if>">
		<div class="tabHead">修改专业</div>
			<center>
			<table class="listBorder" width="70%" cellspacing="0">
			<tr>
				<th>所选专业名称：</th>
				<td>
				
				<s:select id="spec" list="specMap" listKey="value" listValue="key" headerKey="-1" headerValue="所有专业" value="specId"></s:select>
				
				
				<%-- <select id="select1" name="select1" style="width:180px">
  					<option value="请选择" selected="selected">请选择</option>
					</select> --%>
				</td>
			</tr>
			</table>
			</center>
		<s:if test='self_Rec.specselected == 0'>
		<div style="padding: 20px;text-align: center;">
			<a class="easyui-linkbutton" href="javascript:void(0)" iconCls="icon-save" onclick="save(0)">保存</a>
			<a class="easyui-linkbutton" href="javascript:void(0)" iconCls="icon-ok" onclick="submit(1)">提交</a>
		</div>
		</s:if>
	</div>
</body>
</html>