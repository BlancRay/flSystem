<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../css/main.css"></link>
<link rel="stylesheet" href="../../css/control.css"></link>
<link rel="stylesheet" href="../../js/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" href="../../js/easyui/themes/icon.css"></link>
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/common.js"></script>
<script type="text/javascript">
	function startSelect(){
		var annual = $(".sinput").val();
		if(annual == "" || annual.length<4){
			$.messager.alert("错误","年度没有输入或输入有误","error");
			return;
		}
		location.replace("control_eachSelectStart?curAnnual="+annual);
	}
	
	function endSelect(){
		$.messager.confirm("信息","确定要关闭“导师和学生互选”吗？",function(r){
			if(r){
				location.replace("control_eachSelectEnd?curAnnual=${curAnnual}");
			}
		});
	}
	
	$(function(){
		$(".sinput").onlyNum();
		<s:if test="curAnnual != ''">
			var s = ${eachSelectInfo.passSecond};
			$(".passTime").text(getPassTime(s));
			<s:if test="eachSelectInfo.eachselect == 1">
			setInterval(function(){s++;$(".passTime").text(getPassTime(s));},1000);
			setInterval(function(){$(".easyui-panel").panel("refresh");},1000*120);
			</s:if>
		</s:if>
	});
	
</script>
<style type="text/css">
	.topMargin{
		margin-top: 30px;
	}
</style>
<title>${initParam.systemName}——导师学生互选</title>
</head>
<body>
	<div class="center800">
		<div class="outBorder">
			<s:if test="(wannual == null or wannual.isEmpty()) and curAnnual == ''">
				<div class="toolbar stext" style="color:red">
					没有可分流的年级！！
				</div>
			</s:if>
			<s:else>
			<div class="toolbar stext">
				<s:if test="curAnnual == ''">
					<s:select list="wannual" cssClass="sinput" listKey="grade" listValue="grade"/>
				</s:if>
				<s:else>
					${curAnnual}
				</s:else>
				级导师学生互选
			</div>
			<s:if test="curAnnual != ''">
			<div class="time">
				<s:if test="eachSelectInfo.eachselect == 1">
					开始于：${eachSelectInfo.startTime}<br />已经经过了：<span class="passTime"></span>
				</s:if>
				<s:elseif test="eachSelectInfo.eachselect == 2">
					已经结束!!!
				</s:elseif>
			</div>
			</s:if>
			<div class="toolbar" style="margin-top: 50px">
				<s:if test="curAnnual == ''">
					<a href="javascript:void(0)" class="start Btn" onclick="startSelect()">开  始</a>
				</s:if>
				<s:elseif test="eachSelectInfo.eachselect == 1">
					<a href="javascript:void(0)" class="end Btn" onclick="endSelect()">结  束</a>
				</s:elseif>
			</div>
			</s:else>
		</div>
		<s:if test="curAnnual != ''">
			<div class="easyui-panel" title="互选信息" top="30" headerCls="topMargin" height="400" href="control_eachSelectInfo?curAnnual=${curAnnual}">
				
			</div>
		</s:if>
	</div>
</body>
</html>