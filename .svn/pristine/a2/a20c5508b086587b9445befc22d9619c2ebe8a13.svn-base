<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div style="height: 30px;font-size: 15px; font-weight: bold;line-height: 30px; text-align: center;">
	共有 <span style="color:red">${selectInfo.allCount}</span> 人参加互选，
	已有 <span style="color:red"><s:property value="selectInfo.selectedList.size"/> </span> 进行互选，
	还有<span style="color:red"><s:property value="selectInfo.notSelectList.size"/></span>没有进行互选.
</div>
<div class="easyui-tabs" fit="true">
	<div title="未选择导师学生列表">
		<table class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
			</tr>
			<s:iterator value="selectInfo.notSelectList" var="stu">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div title="已选择导师学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>导师</th>
			</tr>
			<s:iterator value="selectInfo.selectedList" var="stu">
				<s:if test="stu.status == 1">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
					<td>${stu.tName }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	<div title="已完成互选学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>导师</th>
			</tr>
			<s:iterator value="selectInfo.selectedList" var="stu">
				<s:if test="stu.status == 2">
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
					<td>${stu.tName }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
</div>