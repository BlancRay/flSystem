
pRelocation = function(w,h){
	var mh = $("#commonFrame").height();
	h = (h-mh)/2;
	h = h>10?h:10;
	$("#commonFrame").css("margin-top",h+"px");
};
//分页跳转
toPage = function(page,pgSize){
	location.replace("?page="+page+"&rows="+pgSize);
};
$(function(){
	//设置登录框提示
	$("#loginBox :input").tooltip({
		 position: 'top',
			 onShow: function(){
				 $(this).tooltip('tip').css({
				 borderColor: '#f00'
			 });
		 }
	});
	
	//鼠标悬停加背景
	$(".notice dl").hover(
			function(){
				$(this).addClass("trBg");
			},
			function(){
				$(this).removeClass("trBg");
			}
	);
});