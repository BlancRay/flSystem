<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="easyui-tabs"  style="height:340px;">   
	<div title="未选择通道学生列表">
		<table class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
			</tr>
			<s:set name="nc" value="0" />
			<s:set name="nospec" value="0" />
			<s:set name="hasspec" value="0" />
			<s:iterator value="eachSelectInfo" var="stu">
				<s:if test="#stu.chl == null">
				<s:set name="nc" value="#nc+1" />
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	<div title="未选择专业学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>通道</th>
			</tr>
			<s:iterator value="eachSelectInfo" var="stu">
				<s:if test="#stu.chl != null and #stu.specselected == 0">
				<s:set name="nospec" value="#nospec+1" />
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
					<td>${stu.chl }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	<div title="等待导师审核学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>通道</th>
				<th>专业</th>
			</tr>
			<s:set name="beCheck" value="0" />
			<s:iterator value="eachSelectInfo" var="s">
				<s:if test="#s.specselected == 2">
				<s:set name="beCheck" value="#beCheck+1" />
				<tr>
					<td>${s.loginName }</td>
					<td>${s.uName }</td>
					<td>${s.className }</td>
					<td>${s.chl }</td>
					<td>${s.spcName }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	<div title="已完成专业选择学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>通道</th>
				<th>专业</th>
			</tr>
			<s:iterator value="eachSelectInfo" var="s">
				<s:if test="#s.specselected == 3">
				<s:set name="hasspec" value="#hasspec+1" />
				<tr>
					<td>${s.loginName }</td>
					<td>${s.uName }</td>
					<td>${s.className }</td>
					<td>${s.chl }</td>
					<td>${s.spcName }</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
	<div title="跨学科专业选择学生列表">
		<table  class="listBorder tb" cellspacing="0">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>通道</th>
				<th>专业</th>
				<th>操作</th>
			</tr>
			<s:set name="checked" value="0" />
			<s:iterator value="eachSelectInfo" var="stu">
				<s:if test="#stu.specselected == 1">
				<s:set name="checked" value="#checked+1" />
				<tr>
					<td>${stu.loginName }</td>
					<td>${stu.uName }</td>
					<td>${stu.className }</td>
					<td>${stu.chl }</td>
					<td>${stu.spcName }</td>
					<td>
						<a href="javascript:void(0)" onclick="specCheck(${stu.loginName })">审核</a>
					</td>
				</tr>
				</s:if>
			</s:iterator>
		</table>
	</div>
</div>
<div style="height: 30px;font-size: 15px; font-weight: bold;line-height: 30px; text-align: center;">
	
	未进行通道选择： <span style="color:red">${nc}</span>人，
	未进行专业选择：<span style="color:red"><s:property value="#nospec"/></span>人，
	等待导师审核：<span style="color:red">${beCheck}</span>人，
	已完成专业选择：<span style="color:red"><s:property value="#hasspec"/></span>人，
	跨学科需审核：<span style="color:red"><s:property value="#checked"/></span>人
</div>
<script type="text/javascript">
	function specCheck(stuid){
		$.messager.confirm("信息确认","确认审核通过学号为：" + stuid + "学生的专业选择!!",function(r){
			$.post(
				"control_adminCheckSpec",
				{stuID:stuid},
				function(data){
					if(data.flPassed){
						$.messager.alert("错误","服务器端错误：" + data.errMsg,"error");
					}
					else{
						$(".easyui-panel").panel("refresh");
					}
				},
				'json'
			);
		});
	}
</script>