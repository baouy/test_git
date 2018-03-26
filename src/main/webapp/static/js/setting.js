$(function(){
	electronicMapList(mapListData);
})
//初始化底图列表
var mapListData =[{"id":"0","isShow":"","mapSort":"","name":"中山市电子地图"},{"id":"1","isShow":"","mapSort":"","name":"珠海市电子地图"},{"id":"2","isShow":"","mapSort":"","name":"佛山市电子地图"},{"id":"3","isShow":"","mapSort":"","name":"广州市电子地图"}]

function electronicMapList(mapListData){
	$("#electronicMapList").html("");
	var electronicMapListHtml="";
	for (var i=0;i<mapListData.length;i++){
		if(i<1){
			electronicMapListHtml+="<li class='map-list active' id='"+mapListData[i].id+"' is-show='"+mapListData[i].isShow+"' map-sort='"+mapListData[i].mapSort+"' onclick='changeElectronicMap(this)'>"+mapListData[i].name+" <i class='icon wb-edit' aria-hidden='true' data-toggle='modal' data-target='#addNewMap'></i></li>";
		}else{
			electronicMapListHtml+="<li class='map-list' id='"+mapListData[i].id+"' is-show='"+mapListData[i].isShow+"' map-sort='"+mapListData[i].mapSort+"' onclick='changeElectronicMap(this)'>"+mapListData[i].name+"<i class='icon wb-edit' aria-hidden='true' data-toggle='modal' data-target='#addNewMap'></i></li>";
		}
	}
	$("#electronicMapList").html(electronicMapListHtml);
	
}

//新增底图提交事件
function addNewMapSub(){
	$("#addNewMapForm").submit(function(){
		
	})
}

//底图列表点击切换事件
function changeElectronicMap(that){
	$(".map-list").removeClass("active");
	$(that).addClass("active");
	
}

//底图列表删除事件
function removeMap(){
	//找到当前显示的底图，进行删除
	if ($(".map-list").hasClass("active")){
		//获取id
		var removeId = $(".map-list.active").attr("id");
		$(".map-list.active").remove();
	}
	for (var i=0;i<mapListData.length;i++){
		if (removeId == mapListData[i].id){
			mapListData.splice(i, 1);
		}
	}
	//重新渲染地图列表
	electronicMapList(mapListData);
	//删除图层信息，图层索引
	$("#layerInfoList tbody").html("");
	$("#layerIndexList tbody").html("");
}

//新增图层信息
function layerInfoSub(){
	$("#layerInfoForm").submit(function(){
		
	})
}

//新增图层索引
function layerIndexSub(){
	$("#layerIndexSub").submit(function(){
		
	})
}