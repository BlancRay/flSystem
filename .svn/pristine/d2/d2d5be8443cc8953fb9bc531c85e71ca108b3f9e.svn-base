$(function(){
	$(".menuButton").click(function(){
		$(".menuButton").css({background:"url('../images/btnBg.png')"});
		$(this).css("background-image","url(../images/selectedBtnBg.png)");
		var url = $(this).attr("url");
		window.open(url,"mainframe");
	});
	
	$(".topBtn").click(function(){
		$(".menuButton").css({background:"url('../images/btnBg.png')"});
	});
});

function getPassTime(seconds){
	var s = seconds % 60;
	var hi = parseInt(seconds / 60);
	var m = hi % 60;
	hi = parseInt(hi / 60);
	var h = hi % 60;
	hi = parseInt(hi / 60);
	var d = hi % 24;
	return d + " 天 " + h + " 小时 " + m + " 分 " + s +" 秒";
}

//----------------------------------------------------------------------
// <summary>
// 限制只能输入数字
// </summary>
// ----------------------------------------------------------------------
$.fn.onlyNum = function () {
    $(this).keypress(function (event) {
         var eventObj = event || e;
         var keyCode = eventObj.keyCode || eventObj.which;
         if ((keyCode >= 48 && keyCode <= 57))
             return true;
         else
             return false;
     }).focus(function () {
     //禁用输入法
         this.style.imeMode = 'disabled';
     }).bind("paste", function () {
     //获取剪切板的内容
         var clipboard = window.clipboardData.getData("Text");
         if (/^\d+$/.test(clipboard))
             return true;
         else
             return false;
     });
};