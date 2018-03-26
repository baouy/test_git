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
  <script type="text/javascript">
  	var resUrl = "http://192.168.1.230:8082/tilemap/";
  </script>
  <!--样式初始化 -->
  <link rel="stylesheet" href="../static/css/initalize.css">
  <link rel="stylesheet" href="../static/global/bootstrap/bootstrap.min.css">
  <!-- fonts -->
  <link rel="stylesheet" href="../static/global/font-awesome/font-awesome.min.css">
  <link rel="stylesheet" href="../static/global/web-icons/web-icons.min.css">
  <link rel="stylesheet" href="../static/global/material-design/material-design.min.css">
  <!-- 自定义样式 -->
  <link rel="stylesheet" href="../static/css/setting.css">
  
  <!-- script -->
  <script src="../static/global/jquery/jquery.min.js"></script>
  <script src="../static/global/bootstrap/bootstrap.min.js"></script>
  <script src="../static/global/layer/layer.js"></script> 
  <script src="../static/js/setting.js"></script>
  
</head>
<body>
    <div id="configureModal">
		<div class="modal-row">
		<!-- 	左侧 -->
			<div class="modal-left">
				<button class="new-btn"  data-toggle="modal" data-target="#addNewMap" >新增</button>
				<button class="delete-btn" onclick="removeMap()">删除</button>
				<ul id="electronicMapList">
					<li class="map-list active" id="0" is-show="" map-sort="" onclick="changeElectronicMap(this)">中山市电子地图  <i class="icon wb-edit" aria-hidden="true" data-toggle="modal" data-target="#addNewMap"></i></li>
					<li class="map-list" id="1" is-show="" map-sort="" onclick="changeElectronicMap(this)">珠海市电子地图 <i class="icon wb-edit" aria-hidden="true" data-toggle="modal" data-target="#addNewMap"></i></li>
					<li class="map-list" id="2" is-show="" map-sort="" onclick="changeElectronicMap(this)">广州市电子地图<i class="icon wb-edit" aria-hidden="true" data-toggle="modal" data-target="#addNewMap"></i></li>
					<li class="map-list" id="3" is-show="" map-sort="" onclick="changeElectronicMap(this)">佛山市电子地图 <i class="icon wb-edit" aria-hidden="true" data-toggle="modal" data-target="#addNewMap"></i></li>
				</ul>
			</div>
			<!-- 右侧 -->
			<div class="modal-right">
				<!-- 图层信息表 -->
				<div id="layerInfo">
					<span class="layer-info-title">图层信息</span>
					<div class="layer-info-head">						
						<button class="new-btn"  data-toggle="modal" data-target="#addlayerInfo" >新增</button>
						
					</div>
					<div style="width:100%;height:225px;overflow:auto;">					
						<table id="layerInfoList">
							<thead>
								<tr>
									<th width="10%">序号</th>
									<th width="25%">名称</th>
									<th width="15%">类型</th>
									<th width="35%">地址</th>
									<th width="15%">操作</th>
								</tr>
							</thead>
							<tbody>						
								<tr>
									<td>1</td>
									<td>中山市</td>
									<td>地图</td>
									<td>http://192.168.1.70:8082/teilmap/test</td>
									<td>
										<button type="button" class="btn btn-icon btn-primary btn-xs btn-outline"><i class="fa fa-pencil" aria-hidden="true"></i></button>
										<button type="button" class="btn btn-icon btn-danger btn-xs btn-outline"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>									
				</div>
				<!-- 图层索引表 -->
				<div id="layerIndex">
					<span class="layer-info-title">图层索引</span>
					<div class="layer-info-head">						
						<button class="new-btn"  data-toggle="modal" data-target="#addlayerIndex" >新增</button>
						<div style="width:100%;height:;overflow:auto;"> 
							<table id="layerIndexList">
								<thead>
									<tr>
										<th width="10%">序号</th>
										<th width="25%">名称</th>
										<th width="25%">索引字段</th>
										<th width="25%">创建状态</th>
										<th width="15%">操作</th>
									</tr>
								</thead>
								<tbody>						
									<tr>
										<td>1</td>
										<td>中山市</td>
										<td>地图</td>
										<td></td>
										<td>
											<button type="button" class="btn btn-icon btn-primary btn-xs btn-outline"><i class="fa fa-pencil" aria-hidden="true"></i></button>
											<button type="button" class="btn btn-icon btn-danger btn-xs btn-outline"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
										</td>
									</tr>
								</tbody>						
							</table>
						</div>
					</div>				
				</div>			
			</div>
		</div>	
	</div> 
	<!-- 新增地图 -->
	<div class="modal fade" id="addNewMap" tabindex="-1" role="dialog" aria-labelledby="electronicMap">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="electronicMap">电子地图</h4>
				</div>
				<div class="modal-body">
					<form action="" id="addNewMapForm">					
						<div><label class="add-new-map" for="mapName">地图名称:<i>*</i></label><input type="text" id="mapName" class="form-control" name="mapName"></div>
						<div><label class="add-new-map" for="mapCode">地图编码:<i>*</i></label><input type="text" id="mapCode" class="form-control" name="mapCode"></div>
						<div>
							<label class="add-new-map" for="mapIsShow">是否显示:<i>*</i></label>
							<select id="mapIsShow" class="form-control" name="mapIsShow">
								<option>显示</option>
								<option>不显示</option>
							</select>
						</div>
						<!-- <div><label class="add-new-map" for="mapIsShow">是否显示:<i>*</i></label><input type="text" id="mapIsShow" class="form-control" name="mapIsShow"></div> -->
						<div><label class="add-new-map" for="mapSort">地图排序:<i>*</i></label><input type="text" id="mapSort" class="form-control" name="mapSort"></div>		
					</form>					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" value="提交" class="btn btn-primary"  id="addNewMapSub" onclick="addNewMapSub()">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 图层信息 -->
	<div class="modal fade" id="addlayerInfo" tabindex="-1" role="dialog" aria-labelledby="layerInfoModel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="layerInfoModel">图层信息</h4>
				</div>
				<div class="modal-body">
					<form action="" id="layerInfoForm">					
						<div><label class="add-layer-info" for="layerName">图层名称:<i>*</i></label><input type="text" id="layerName" class="form-control" name="layerName"></div>
						<div><label class="add-layer-info" for="layerCode">图层编码:<i>*</i></label><input type="text" id="layerCode" class="form-control" name="layerCode"></div>
						<div><label class="add-layer-info" for="layerAddress">图层地址:<i>*</i></label><input type="text" id="layerAddress" class="form-control" name="layerAddress"></div>
						<div><label class="add-layer-info" for="layerType">图层类型:<i>*</i></label><input type="text" id="layerType" class="form-control" name="layerType"></div>
						<div><label class="add-layer-info" for="layerSort">地图排序:<i>*</i></label><input type="text" id="layerSort" class="form-control" name="layerSort"></div>		
					</form>					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" value="提交" class="btn btn-primary"  id="layerInfoSub" onclick="layerInfoSub()">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 图层索引 -->
	<div class="modal fade" id="addlayerIndex" tabindex="-1" role="dialog" aria-labelledby="layerIndexModel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="layerIndexModel">图层索引</h4>
				</div>
				<div class="modal-body">
					<form action="" id="layerIndexForm">					
						<div><label class="add-layer-index" for="indexName">索引名称:<i>*</i></label><input type="text" id="indexName" class="form-control" name="indexName"></div>
						<div><label class="add-layer-index" for="indexAddress">地图地址:<i>*</i></label><input type="text" id="indexAddress" class="form-control" name="indexAddress"></div>
						<div><label class="add-layer-index" for="indexPhotoID">主键字段:<i>*</i></label><input type="text" id="indexPhotoID" class="form-control" name="indexPhotoID"></div>
						<div><label class="add-layer-index" for="IndexField">索引字段:<i>*</i></label><input type="text" id="IndexField" class="form-control" name="IndexField"></div>
						<div><label class="add-layer-index" for="createState">创建状态:<i>*</i></label><input type="text" id="createState" class="form-control" name="createState"></div>					
					</form>					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<input type="submit" value="提交" class="btn btn-primary"  id="layerIndexSub" onclick="layerIndexSub()">
				</div>
			</div>
		</div>
	</div>   
  </body>
</html>
