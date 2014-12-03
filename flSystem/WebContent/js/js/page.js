var xmlHttp;
var data;
function createXMLHttpRequest() {
	if (window.ActiveXObject)
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	else if (window.XMLHttpRequest)
		xmlHttp = new XMLHttpRequest();
}
function startRequest() {
	createXMLHttpRequest();
	xmlHttp.open("GET", "/argistd/nybUser/nbbg/pageNumAction", true);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
			data = eval("(" + xmlHttp.responseText + ")");
			addOptionForPage(data);
		}
	};
	xmlHttp.send(null);
}

function addOptionForPage(info){
	var select_page_tag = document.getElementById("rpage");
	for(var i in info){
		select_page_tag.options.add(new Option(info[i].page_num,info[i].page_num));
	}
}