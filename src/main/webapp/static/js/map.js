$(function(){
	//地图列表
	loadProjectList();
	//地图工具列表
	loadMapTools();
	
	//鼠标点击弹出专题切换
	$("#changeMap").click(function(){
		$("#changeMap").toggleClass("active");
		if($("#changeMap").hasClass("active")){
			$("#projectDirChange").addClass("fade");
			$(".fa-sort-desc").hide();
			$(".fa-sort-asc").show();
		}else{
			$("#projectDirChange").removeClass("fade");
			$(".fa-sort-desc").show();
			$(".fa-sort-asc").hide();
		}
	})
	
	//右下角缩略地图鼠标移入事件
	$("#mapType-wrapper").hover(function(){
	    $("#mapType-wrapper").addClass("expend");
	},function(){
		 $("#mapType-wrapper").removeClass("expend");
	});
})


var map, view;
require([
     "esri/config",
     "esri/Map",
     "esri/views/MapView",
     "esri/layers/TileLayer",
     "dojo/domReady!"
], function(
     esriConfig,
     Map,
     MapView,
     TileLayer
) {
     titleLayer  = new TileLayer({
     	//url: "http://113.119.59.34:8563/arcgis/rest/services/zsdt/MapServer"
    	 url:"http://192.168.1.16:6080/arcgis/rest/services/zsdt/MapServer"
     });
     map = new Map({
    	 layers: [titleLayer]
     });
     view = new MapView({
     container: "viewDiv",
     map: map
     });
});

//地图切换列表
var mapList =[{"id":"zhs_map","name":"中山电子地图"},{"id":"fs_map","name":"佛山电子地图"},{"id":"zh_map","name":"珠海电子地图"}];
function loadProjectList(){	
	var projectListHtml="";
	//专题列表初始化
	for(var i=0;i<mapList.length;i++){
		projectListHtml += "<li id='"+mapList[i].id+"' class='city-planning' style='cursor:pointer;'>" +
		"<i class='fa fa-map-o' aria-hidden='true'></i>" +
		"<span>"+ mapList[i].name +"</span></li>";
	}
	$(".projectDirChange-div").html(projectListHtml);
};

//地图工具条列表
var mapToolsList = [{"id":"measureLength","name":"测距","icon":"icon md-ruler"},{"id":"measureArea","name":"测面","icon":"fa fa-square-o"},{"id":"fullMap","name":"全图","icon":"fa  fa-globe"}];
function loadMapTools(){
	var index = mapToolsList.length-1;
	var MapToolsHtml ="";
	//工具列表初始化
	for (var i=0;i<mapToolsList.length;i++){
		MapToolsHtml+="<li id='"+mapToolsList[i].id+"' class='map-tools-list'>"+
		"<i class='"+mapToolsList[i].icon+"' aria-hidden='true'></i><span class='title'>"+mapToolsList[i].name+"</span>";
		if (i<index){
			MapToolsHtml+="<span class='border'></span></li>";
		}else{
			MapToolsHtml+="</li>";
		}		
	}
	$("#mapTools").html(MapToolsHtml);
}

//配置
function configureShow(){	
	$("#configure").toggleClass("active");
	if($("#configure").hasClass("active")){
		$("#configureModal").fadeIn();
	}else{
		$("#configureModal").fadeOut();
	}
	//打开layer
	var url ='jsp/setting.jsp';
	layer.open({
		id:"layerConfigMap",	
  		type: 2,
  		offset: ['20%'],
  		title :'地图配置',
  		area: ['830px','600px'], //['700px', '450px']
  		fixed: false, //不固定
  		resize: false, //禁止拉伸
  		maxmin: true,
  		content:url
	});
		
}

//右下角缩略地图类型切换
function changeMapType (){
	$(".mapTypeCard").removeClass("active");
	$(that).addClass("active");
};
