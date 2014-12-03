$(function(){
    alert("dd");
	$.post(
		"/argistd/nybUser/pxxx/signupTrainingAction!execute",
		function(data,status){
			alert(data.list);
			var pxid = $("#select_pxxx").attr("title");
			for(var i=0;i<data.list.length;i++){
				if(pxid != 0){
					if(data.list[i].id == pxid){
						$("#select_pxxx").html("");
						$("#select_pxxx").append("<option value=" + data.list[i].id + ">" + data.list[i].name + "</option>");
					}
				}
				else
					$("#select_pxxx").append("<option value=" + data.list[i].id + ">" + data.list[i].name + "</option>");
			}
		}
	);
});

$(function(){
	$("form[name=signup]").submit(function(event){
		$(this).find("input,select").each(function(){
			if(!$(this).hasClass("enable_null")){
				if($(this).val() == "" || $(this).val() == "==%=="){
					alert("[" + $(this).parents("td").prev().text() + "]不能为空!");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			}
			if($(this).hasClass("mobile")){
				var regExp = /^(13|14|15|18)\d{9}/g;
				if(!regExp.test($(this).val())){
					alert("手机号格式输入不正确！");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			}
			else if($(this).hasClass("e-mail")){
				var regExp = /\w{1,30}@\w{1,10}.\w{1,20}/g;
				if(!regExp.test($(this).val())){
					alert("邮箱格式输入不正确！");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			}
		});
	});
});