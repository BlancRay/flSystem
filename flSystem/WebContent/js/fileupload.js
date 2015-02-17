function uploadFile(input,frm){
	var f = $(input).filebox("getText");
	if(f == ""){
		$.messager.alert("错误","请选择待上传的文件...","Error");
		return;
	}
	$(frm).submit();
}

$(function(){
	$('#fileUpload,#fileUpload1').form({
            success:function(data){
            	d = eval("(" + data + ")");
            	if(d.success){
            		$.messager.alert('信息', "导入完成！！", 'Info');
            		$("#msg,#msg1").html(d.errMsg);
            	}
            	else{
            		$("#msg,#msg1").html(d.errMsg);
            	}
            }
        });
});