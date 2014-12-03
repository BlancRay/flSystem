
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