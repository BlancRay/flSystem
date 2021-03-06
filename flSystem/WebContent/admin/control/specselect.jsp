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
		location.replace("control_specSelectStart?curAnnual=${curAnnual}");
	}
	
	function endSelect(){
		$.messager.confirm("信息","确定要关闭“专业”吗？",function(r){
			if(r){
				location.replace("control_specSelectEnd?curAnnual=${curAnnual}");
			}
		});
	}
	
	$(function(){
		$(".sinput").onlyNum();
		<s:if test="curAnnual != ''">
			var s = ${eachSelectInfo.passSecond};
			$(".passTime").text(getPassTime(s));
			<s:if test="eachSelectInfo.specSelect == 1">
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
			<s:if test="eachSelectInfo ==null or eachSelectInfo.eachselect !=2">
				<div class="toolbar stext" style="color:red">
					分流尚未开始，或导师学生互选选择还未结束！！
				</div>
			</s:if>
			<s:else>
			<div class="toolbar stext">
					${curAnnual}级专业选择
			</div>
			<div class="time">
				<s:if test="eachSelectInfo.specSelect == 1">
					开始于：${eachSelectInfo.startTime}<br />已经经过了：<span class="passTime"></span>
				</s:if>
				<s:elseif test="eachSelectInfo.specSelect == 2">
					已经结束!!!
				</s:elseif>
			</div>
			<div class="toolbar" style="margin-top: 50px">
				<s:if test="eachSelectInfo.specSelect == 0">
					<a href="javascript:void(0)" class="start Btn" onclick="startSelect()">开  始</a>
				</s:if>
				<s:elseif test="eachSelectInfo.specSelect == 1">
					<a href="javascript:void(0)" class="end Btn" onclick="endSelect()">结  束</a>
				</s:elseif>
			</div>
			</s:else>
		</div>
		<s:if test="curAnnual != '' && eachSelectInfo.specSelect != 0">
			<div class="easyui-panel" title="通道选择信息" top="30" headerCls="topMargin" height="400" href="control_specSelectInfo?curAnnual=${curAnnual}">
				
			</div>
		</s:if>
	</div>
</body>
</html>