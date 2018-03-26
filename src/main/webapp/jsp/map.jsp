<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
  <title>中山电子地图</title>
  <link rel="stylesheet" href="https://js.arcgis.com/4.6/esri/css/main.css">
  <!--样式初始化 -->
  <link rel="stylesheet" href="static/css/initalize.css">
  <link rel="stylesheet" href="static/global/bootstrap/bootstrap.min.css">
  <!-- fonts -->
  <link rel="stylesheet" href="static/global/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="static/global/web-icons/web-icons.min.css">
  <link rel="stylesheet" href="static/global/material-design/material-design.min.css">
  <!-- 自定义样式 -->
  <link rel="stylesheet" href="static/css/test.css">
  
  <!-- script -->
  <script src="static/global/jquery/jquery.min.js"></script>
  <script src="static/global/bootstrap/bootstrap.min.js"></script>
  <script src="static/global/layer/layer.js"></script>
  <!--[if lt IE 9]>-->
  <script src="static/global/html5shiv/html5shiv.min.js"></script>
  <!--<![endif]-->
  <!--[if lt IE 10]>-->
  <script src="static/global/media-match/media.match.min.js"></script>
  <script src="static/global/respond/respond.min.js"></script>
  <!--<![endif]-->
  <script src="https://js.arcgis.com/4.6/"></script> 
  
  <script src="static/js/map.js"></script>
  
  
</head>
<body>
  <!-- 地图切换-->
	<div id="changeMap" >
		<div class="zjditu-global-config-icon ">
			<i class="icon fa fa-paper-plane-o" aria-hidden="true"></i>
			<p class="title">地图</p>
			<i class="fa fa-sort-desc" aria-hidden="true"></i>
			<i class="fa fa-sort-asc" aria-hidden="true" style="display:none;line-height: 22px;"></i>
		</div>
		<!--详细地图 -->
		<div id="projectDirChange">	            	
			<ul class="projectDirChange-div">
			</ul>
		</div> 
	</div>
	<!--搜索按钮-->
	 <div id="search_pane">
		<div id="search_component" >
			<div class="search-component-input-c">
				<input id="keywords" class="search-component-input" autocomplete="off" placeholder="请输入地名/地址/项目名称" oninput="search()" onfocus="showSearchBox()">
			</div>
		</div>
		<!-- 检索结果下拉列表  -->
		<div class="search-box">
			<ul style="margin:0px;"></ul>
		</div>
		<!--搜索按钮  -->
		<div class="search-component-submit " data-toggle="tooltip" data-placement="bottom" title="搜索">
			<div class="global-config-icon ">
				<i class="fa fa-search" aria-hidden="true"></i>
			</div>
		</div>
	</div>  
	<!--工具栏  -->
	<ul id="mapTools">
		
	</ul>
	<!-- 配置 -->
	<div id="configure" onclick="configureShow()">
		<i class="fa fa-cog" aria-hidden="true"></i> 
	</div> 
	<!--地图  -->
    <div id="viewDiv"></div>
   <!--右下角缩略地图  -->
	<div id="mapType-wrapper">
		<div id="mapType">
			<div class="mapTypeCard earth active" data-name="earth" onclick="changeMapType()">
				<span>地图</span>
			</div>
			<div class="mapTypeCard normal" data-name="normalMap" onclick="changeMapType()">
				<span>影像</span>
			</div>
		</div>
	</div>
</body>
</html>
