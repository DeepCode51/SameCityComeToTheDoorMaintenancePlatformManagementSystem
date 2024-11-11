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
		<a>订单管理</a>
		<span>订单列表</span>
	</div>
	<!-- 筛选 --> 
	<form action="orderListSearch.do" method="post" >
	<div class="shuaix">
		<div class="left" style="margin-right:10px;"> 
			<select name="status">   
				<option value="">请选择订单状态</option> 
				<option value="已支付，待维修">已支付，待维修</option>
				<option value="维修完成">维修完成</option>
			</select>
		</div> 
		<div class="left" style="margin-right:10px;"> 
			<select name="uid">   
				<option value="">请选择用户</option> 
				<c:forEach items="${ulist }" var="t">
				<option value="${t.id }">${t.tname }</option> 
				</c:forEach>  
			</select>
		</div>
		<div class="right">
			<input type="text" name="ono" placeholder="请输入订单的编号">
			<input type="submit" class="btn" value="查询" >
		</div>
	</div>
	</form>
	<!-- 下面写内容 -->
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{field:'xh', align:'center',width:160}">序号</th>
				<th lay-data="{field:'yx', align:'center',minWidth:200}">订单编号</th>
				<th lay-data="{field:'fl',align:'center', minWidth:50}">用户</th>
				<th lay-data="{field:'sj',align:'center', minWidth:100}">订单状态</th>
				<th lay-data="{field:'www',align:'center',minWidth:100}">总价（元）</th>
				<th lay-data="{field:'img',align:'center',minWidth:70}">订单时间</th>
				<th lay-data="{field:'addr2',align:'center',minWidth:150}">操作</th> 
			</tr> 
		</thead>
		<tbody>
		 <c:forEach items="${list }" var="o"  varStatus="num">
		 <tr>
				<!-- <td></td> -->
				<td>${num.count }</td>
				<td>${o.ono }</td>
				<td>
				<c:forEach items="${ulist }" var="u">
				<c:if test="${u.id==o.uid }">${u.tname }
				</c:if>
				</c:forEach></td>
	          	<td>${o.status }</td>
	          	<td>${o.zprice }</td>
	          	<td>${o.pubtime }</td>
			  <td>
			   <c:if test="${o.status=='已支付，待维修' }">
			   <a class="layui-btn layui-btn-xs"   href="orderQueRen.do?id=${o.kid }" >维修完成</a>
          		</c:if>
          		<c:if test="${o.status=='待确认退货' }">
			   <a class="layui-btn layui-btn-xs"   href="queRenTuiHuo.do?id=${o.kid }" >确认退货</a>
          		</c:if>
			   	<a class="layui-btn layui-btn-danger layui-btn-xs color2"  onclick="return del(1,1,1)"   href="deleteForder.do?id=${o.kid }" >删除</a>
           		<a class="layui-btn layui-btn-xs"   href="showOrderDetail.do?id=${o.kid }" >查看详情</a>
			  </td>
			</tr>
        </c:forEach> 
		</tbody>  
	</table>
	
</div>

<script type="text/javascript">
//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}else{
		return false;
	}
}

</script>
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
		//监听行工具事件
		table.on('tool(mylist)', function(obj){ //注：tool 是工具条事件名，mylist 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
			,layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'del'){
			    layer.confirm('真的删除行么', function(index){
				    obj.del(); //删除对应行（tr）的DOM结构
				    layer.close(index);
				    //向服务端发送删除指令
			    });
			} else if(layEvent === 'edit'){
				alert(layEvent);
			    layer.msg('修改操作');
			}
		}); 
		 //监听头工具栏事件
		 table.on('toolbar(mylist)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据 
                /* switch(obj.event){  
                case 'getCheckLength':
                    if(data.length === 0){
                    layer.msg('请选择一行');
                    } else {
                    layer.msg('删除');
                    }
                break;
                }; */
            }); 
	}); 
	  //  iframe层  详情信息
</script> 
</body>
</html>
