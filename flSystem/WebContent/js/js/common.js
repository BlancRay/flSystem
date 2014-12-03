//弹出窗口
	function strToFloat(str){
		x = parseFloat(str);
		if(isNaN(x))x=0;
		return x;
	}
	
	keypress = function(event){
		if((event.which < 48 || event.which > 57) && event.which != 8 && event.which != 46)
		{
			return false;
		}
	};
	
	change = function(){
		x = parseFloat($(this).val());
		if(isNaN(x))x=0;
		$(this).val(x);
	};
$(function(){
	//数字过滤
	$(".number").keypress(keypress);
	$(".number").change(change);
	
	$("input[type=text],textarea").blur(function(){
		$(this).val($.trim($(this).val()));
	});
  $(".next,#subSaveAndNext").button();	
  //设定框架高度
  $("#mainDiv").height($(this).height() - 175);
	$(window).resize(function(){
		$("#mainDiv").height($(this).height() - 175);
		
	});
});