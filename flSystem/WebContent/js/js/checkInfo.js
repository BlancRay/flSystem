
function checkMail(){
	var regExp = /\w{1,30}@\w{1,10}.\w{1,20}/g;
	var getMail = document.getElementById("item_mobile_tel8");
	if(getMail.value == "" || getMail.value == null){
		alert("请输入邮箱");
		return false;
	}else if(!regExp.test(getMail.value)){
		alert("邮箱格式不对，请重新输入");
		return false;
	}
	return true;
}
function checkInfo(){
	alert(checkMail());
	return checkMail();
}

function showWindow1(){
	document.getElementById("light").style.display = "block";
	document.getElementById("fade").style.display = "block";
}
function hideWindow1(){
	document.getElementById("light").style.display = "none";
	document.getElementById("fade").style.display = "none";
}
function changeImage(){
	var imagePath = document.getElementById("imageFile").value;
	alert(imagePath);
	var image_tag = document.getElementById("img");
	image_tag.setAttribute("src",imagePath);
}
function checkMail(){
	var regExp = /\w{1,30}@\w{1,10}.\w{1,20}/g;
	var getMail = document.getElementById("item_mobile_tel8");
	if(getMail.value == "" || getMail.value == null){
		alert("请输入邮箱");
		return false;
	}else if(!regExp.test(getMail.value)){
		alert("邮箱格式不对，请重新输入");
		return false;
	}
	return true;
}
function checkInfo(){
	alert(checkMail());
	return checkMail();
}

function printpage(){
	window.print();
}

function showWindow(){
	document.getElementById("light").style.display = "block";
	document.getElementById("fade").style.display = "block";
	document.getElementById("File").value = "";
	document.getElementById("file_succ").innerHTML = "";
}
function hideWindow(){
	document.getElementById("light").style.display = "none";
	document.getElementById("fade").style.display = "none";
}
function changeImage(){
	var imagePath = document.getElementById("imageFile").value;
	alert(imagePath);
	var image_tag = document.getElementById("img");
	image_tag.setAttribute("src",imagePath);
}
