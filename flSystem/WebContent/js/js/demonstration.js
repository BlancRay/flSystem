var pro_info = [{pro_id:'001',pro_name:'北京市'},
                {pro_id:'002',pro_name:'上海市'},
                {pro_id:'003',pro_name:'天津市'},
                {pro_id:'004',pro_name:'新疆维尔族自治区'},
                {pro_id:'005',pro_name:'甘肃省'},
                {pro_id:'006',pro_name:'西藏自治区'},
                {pro_id:'007',pro_name:'青海省'},
                {pro_id:'008',pro_name:'内蒙古自治区'},
                {pro_id:'009',pro_name:'宁夏回族自治区'},
                {pro_id:'010',pro_name:'四川省'},
                {pro_id:'011',pro_name:'黑龙江省'},
                {pro_id:'012',pro_name:'吉林省'},
                {pro_id:'013',pro_name:'辽宁省'},
                {pro_id:'014',pro_name:'河北省'},
                {pro_id:'015',pro_name:'山西省'},
                {pro_id:'016',pro_name:'陕西省'},
                {pro_id:'017',pro_name:'河南省'},
                {pro_id:'018',pro_name:'重庆市'},
                {pro_id:'019',pro_name:'云南省'},
                {pro_id:'020',pro_name:'山东省'},
                {pro_id:'021',pro_name:'江苏省'},
                {pro_id:'022',pro_name:'安徽省'},
                {pro_id:'023',pro_name:'湖北省'},
                {pro_id:'024',pro_name:'湖南省'},
                {pro_id:'025',pro_name:'贵州省'},
                {pro_id:'026',pro_name:'浙江省'},
                {pro_id:'027',pro_name:'江西省'},
                {pro_id:'028',pro_name:'福建省'},
                {pro_id:'029',pro_name:'广东省'},
                {pro_id:'030',pro_name:'广西壮族自治区'},
                {pro_id:'031',pro_name:'香港'},
                {pro_id:'032',pro_name:'澳门'},
                {pro_id:'033',pro_name:'海南省'},
                {pro_id:'034',pro_name:'台湾省'}];

$(function(){
	var select_pro_tag = document.getElementById("province");
	for(var i in pro_info){
		select_pro_tag.options.add(new Option(pro_info[i].pro_name,pro_info[i].pro_name));
	}
});

function searchInfo(){
	var proid_tag = document.getElementById("proid");
	var proname_tag = document.getElementById("proname");
	var province_tag = document.getElementById("province");
	var variety_tag = document.getElementById("variety");
	var cddw_tag = document.getElementById("cddw");
	var year_tag = document.getElementById("year");
	
	var proid = proid_tag.value;
	var proname = proname_tag.value;
	var province = province_tag.options[province_tag.selectedIndex].value;
	var variety = variety_tag.value;
	var cddw = cddw_tag.options[cddw_tag.selectedIndex].value;
	var xmrq = year_tag.options[year_tag.selectedIndex].value;
	
	window.open("/argistd/demonstrationArea/searchDAByAllAction!execute?" +
			"proid=" + proid +
			"&proname=" + proname +
			"&province=" + province +
			"&variety=" + variety +
			"&cddw=" + cddw +
			"&xmrq=" + xmrq,"_self");
}