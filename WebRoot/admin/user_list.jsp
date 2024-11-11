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
		<a>用户管理</a>
		<span>用户列表</span>
	</div>
	<!-- 筛选 --> 
	<form action="userListQuery.do" method="post" >
	<div class="shuaix">
		<div class="left" style="margin-right:10px;"> 
			<select name="utype">   
				<option value="">请选择角色</option>   
				<option value="用户">用户</option>   
				<option value="员工">员工</option>
				<option value="管理员">管理员</option>   
			</select>
		</div> 
		<div class="right">
			<input type="text" name="tname" placeholder="请输入姓名查询">
			<input type="text" name="uname" placeholder="请输入用户名查询">
			<input type="submit" class="btn" value="查询" >
		</div>
	</div>
	</form>
	<!-- 下面写内容 -->
	<table class="layui-table" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<!-- <th lay-data="{type:'checkbox',fixed:'left'}"></th> -->
				<th lay-data="{field:'xh', align:'center',width:160}">序号</th>
				<th lay-data="{field:'yx', align:'center',width:160}">姓名</th>
				<th lay-data="{field:'time',align:'center', minWidth:70}">用户名</th>
				<th lay-data="{field:'www',align:'center',minWidth:100}">密码</th>
				<th lay-data="{field:'company',align:'center',minWidth:50}">性别</th>
				<th lay-data="{field:'user',align:'center',width:130}">电话</th>
				<th lay-data="{field:'tel',align:'center',width:130}">用户身份</th>
				<th lay-data="{field:'result',align:'center',minWidth:50}">年龄</th>
                <th lay-data="{field:'addr',align:'center',minWidth:130}">地址</th>
				<th lay-data="{field:'addr1',align:'center',minWidth:100}">图片</th> 
				<th lay-data="{field:'option',align:'center',minWidth:100}">操作</th> 
				<!-- <th lay-data="{field:'option',align:'center',width:130,toolbar:'#barDemo',fixed: 'right'}">操作</th> -->
			</tr> 
		</thead>
		<tbody>
		 <c:forEach items="${list }" var="u"  varStatus="num">
		 <tr>
				<!-- <td></td> -->
				<td>${num.count }</td>
				<td>${u.tname }</td>
				<td>${u.uname }</td>
				<td >${u.pwd }</td>
	          	<td>${u.sex }</td>
	          	<td>${u.tel }</td>
	          	<td>${u.utype }</td>
	          	<td>${u.age }</td>
	          	<td>${u.address}</td>
				<td><!-- <a href="#" class="jianl_list_img"  onclick=" YuanG_IMG()"> --><img src="../upload/${u.img }" width="50px" height="50ppx;"><!-- </a> --></td>                
			  <td><!-- <script type="text/html" id="barDemo"> lay-event="edit"  lay-event="del"-->
				<a class="layui-btn layui-btn-xs"   href="doUpdateUser.do?id=${u.id }" >修改</a>
				<c:if test="${u.uname!=admin }">
				<a class="layui-btn layui-btn-danger layui-btn-xs color2"  onclick="return del(1,1,1)" href="deleteUser.do?id=${u.id }" >删除</a>
				</c:if>
			<!-- </script> --> </td>
			</tr>
        </c:forEach> 
		</tbody>  
	</table>
	
	<!--  <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit"> 修改</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>-->
</div>
<!-- 
<script type="text/html" id="toolbarDemo">
	<div class="layui-btn-container"> 
		<button class="layui-btn layui-btn-sm" onclick=" YuanG_IMG()" lay-event="userAdd">添加</button> 
	</div>
</script>-->
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
    function YuanG_IMG(){
        //iframe层 
        layer.open({
            type: 2,//层类型
            title: "添加",//标题
            closeBtn: 1, //不显示关闭按钮
            shade: [0.3],//遮罩
            skin: 'demo_class_color',//iframe皮肤
            shadeClose:Boolean,//点击遮罩关闭
            area: ['800px', '460px'],
            // offset: 'rb', //右下角弹出
            // time: 2000, //2秒后自动关闭
            anim: 5,//动画
            content: ['user_add.jsp', 'no'], //iframe的url，no代表不显示滚动条 
        }); 
        
    }
</script> 


</body>

</html>

