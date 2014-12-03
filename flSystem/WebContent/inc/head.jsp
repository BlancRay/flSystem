<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script type="text/javascript">
    function realSysTime(dateBox){ 
    	var now=new Date(); //创建Date对象 
    	var year=now.getFullYear(); //获取年份 
    	var month=now.getMonth(); //获取月份 
    	var date=now.getDate(); //获取日期 
    	var day=now.getDay(); //获取星期 
    	var hour=now.getHours(); //获取小时 
    	var minu=now.getMinutes(); //获取分钟 
    	month=month+1; 
    	var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
    	var week=arr_week[day]; //获取中文的星期 
    	var time=year+"年"+month+"月"+date+"日 "+week+" "+hour+":"+minu; //组合系统时间 
    	dateBox.innerHTML=time; //显示系统时间 
    	} 
    	window.onload=function(){ 
    	window.setInterval("realSysTime(dateBox)",1000); //实时获取并显示系统时间 
    	} 
	</script>
<div id="logoBox">
	<img alt="logo" src="../images/logo.png"><p>
	<img alt="logonEn" src="../images/logoEn.png">
</div>
<div id="headInfoBox">
	<div>欢迎您, xxx！！【<a href="javascript:">退出</a>】</div>
	<div id="dateBox">
	
	</div>
	<div>
		<a href="../notice_list" class="easyui-linkbutton" plain="true">系统公告</a>
		<a href="javascript:" class="easyui-linkbutton" plain="true">站内短信</a>
		<a href="javascript:" class="easyui-linkbutton" plain="true">口令修改</a>
		<a href="javascript:" class="easyui-linkbutton" plain="true">个人信息</a>
		<a href="javascript:" class="easyui-linkbutton" plain="true">使用指南</a>
	</div>
</div>