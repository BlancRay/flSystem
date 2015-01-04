function uploadFile(){
	var f = $("#fb").filebox("getText");
	if(f == ""){
		$.messager.alert("错误","请选择待上传的文件...","Error");
		return;
	}
	$('#fileUpload').submit();
}

$(function(){
	$('#fileUpload').form({
            success:function(data){
            	d = eval("(" + data + ")");
            	if(d.success){
            		$.messager.alert('信息', "导入完成！！", 'Info');
            		$("#msg").html(d.errMsg);
            	}
            	else{
            		$("#msg").html(d.errMsg);
            	}
            }
        });
});