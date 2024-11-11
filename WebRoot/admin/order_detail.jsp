<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="名榜,wangid">
	<title>同城上门维修平台</title>

	<!-- CSS -->
	<link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/children.css">

	<!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- layui css -->
	<link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
	<!-- layui js -->
	<script src="layui/layui.js"></script>
</head>

<body>
<div class="wangid_conbox">
	<!-- 当前位置 -->
	<div class="zy_weizhi bord_b">
		<i class="fa fa-home fa-3x"></i>
		<a>首页</a>
		<a>订单详情管理</a>
		<span>订单详情列表</span>
	</div>
	<!-- 筛选 --> 
	<div class="shuaix">
		  <div class="left" style="margin-right:10px;">  <label>订单编号:</label><input type="text" value="${order.ono }" readonly="readonly"></div>
		  <div class="left" style="margin-right:10px;"> <label>订单总价:</label> <input type="text" value="${order.zprice }" readonly="readonly"> </div>
		  <div class="left" style="margin-right:10px;"><label>订单状态:</label> <input type="text" value="${order.status }" readonly="readonly"></div>
		  <div class="left" style="margin-right:10px;"><label>订单日期:</label> <input type="text" value="${order.pubtime }" readonly="readonly"></div>
	</div>
	<hr>
	<div class="shuaix">
		<c:forEach items="${ulist }" var="u">
		    <c:if test="${u.id==order.uid }">
		  		<div class="left" style="margin-right:10px;">  <label>用户姓名:</label><input type="text" value="${u.tname }" readonly="readonly"></div>
		   		<div class="left" style="margin-right:10px;"> <label>电话:</label> <input type="text" value="${u.tel }" readonly="readonly"> </div>
	    		<div class="left" style="margin-right:10px;"><label>地址:</label> <input type="text" value="${u.address }" readonly="readonly"></div>
		    </c:if>
		</c:forEach>
	</div>
	<hr>
	
	
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
    		<tr>
   				<th lay-data="{field:'sj', align:'center',minWidth:200}" >商品名称</th>
   				<th lay-data="{field:'img', align:'center',minWidth:70}" >商品图片</th>
   				<th lay-data="{field:'xh', align:'center',minWidth:50}" >员工</th>
				<th lay-data="{field:'yx', align:'center',width:160}">单价</th>
				<th lay-data="{field:'fl',align:'center', minWidth:100}" >订单数</th>
      		</tr>
      	<tbody>
      <c:forEach items="${list }" var="s">
        <tr>
          <td > 
	      <c:forEach items="${glist }" var="g">
	      <c:if test="${s.fid==g.id }">
	      ${g.name }
	      </c:if>
	      </c:forEach>
          </td>
          <td > 
	      <c:forEach items="${glist }" var="g">
	      <c:if test="${s.fid==g.id }">
	      <img src="../upload/${g.img }" width="50px" height="50ppx;"> 
	      </c:if>
	      </c:forEach>
          </td>
           <td > 
	      <c:forEach items="${ulist }" var="g">
	      <c:if test="${s.sid==g.id }">
	      ${g.tname }
	      </c:if>
	      </c:forEach>
          </td>
          <td>
	      <c:forEach items="${glist }" var="g">
	      <c:if test="${s.fid==g.id }">
	      ${g.price }
	      </c:if>
	      </c:forEach>
          </td>
          <td >${s.num }</td>
        </tr>
       </c:forEach> 
	</table>
	
	
	
	
	
</div>

<script type="text/javascript">
	//静态表格
    layui.use('table',function(){
    	var table = layui.table;
		//转换静态表格
		table.init('mylist', {
		  height: 'full-130' //高度最大化减去差值,也可以自己设置高度值：如 height:300
		  ,count: 50 //数据总数 服务端获得
		  ,limit: 5 //每页显示条数 注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
		  ,page:true //开启分页
		  ,toolbar: '#toolbarDemo'//工具栏
		  ,defaultToolbar:['filter', 'exports']
		  ,limits:[ 5, 10, 15, 20, 30, 50]//分页显示每页条目下拉选择
		  ,cellMinWidth: 60//定义全局最小单元格宽度，其余自动分配宽度
		}); 
	 
		 
	}); 
	  //  iframe层  详情信息
</script> 
</body>
</html>
