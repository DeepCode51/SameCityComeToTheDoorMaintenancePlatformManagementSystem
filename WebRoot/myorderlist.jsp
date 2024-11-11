<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




			<jsp:include page="top.jsp"></jsp:include>
			<!-- layui css -->
	<link rel="stylesheet" href="admin/layui/css/layui.css" media="all">
	<script type="text/javascript" src="admin/js/jquery-1.11.0.min.js"></script> 
	<!-- layui js -->
	<script src="admin/layui/layui.js"></script>
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

</script> 		
			  <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>我的订单</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

			<!-- Shopping Cart Area -->
			<div class="wishlist-page-area section-padding-lg bg-white">
				<div class="container">
					
					<!-- Cart Products -->
					<div class="cart-table table-responsive">
					
					
					<!-- 下面写内容 -->
	<table class="layui-table table table-bordered table-hover" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{field:'xh', align:'center',minWidth:160}">订单编号</th>
				<th lay-data="{field:'yx', align:'center',width:160}">用户</th>
				<th lay-data="{field:'sj',align:'center', minWidth:100}">订单总价(元)</th>
				<!-- <th lay-data="{field:'ly',align:'center', minWidth:100}">订单类型</th> -->
				<th lay-data="{field:'hn',align:'center', minWidth:100}">订单时间</th>
				<th lay-data="{field:'hf',align:'center', minWidth:100}">目前状态</th>
				<th lay-data="{field:'addr2',align:'center',minWidth:100}">操作</th> 
			</tr> 
		</thead>
		<tbody>
		 <c:forEach items="${list }" var="o">
						
						<tr>
						<td>${o.ono }</td>
						<td>
						<c:forEach items="${ ulist}" var="u">
							<c:if test="${u.id==o.uid }">
								${u.tname }
							</c:if>
						</c:forEach></td>
						<td>${o.zprice }</td>
						<%-- <td>${o.otype }</td> --%>
						<td>${o.pubtime }</td>
						<td>${o.status }</td>
						<td>
						<a href="doAddpj.do?id=${o.kid }" class="btn btn-info" >查看</a>
						<c:if test="${o.status=='已支付，待维修' }">
						<a href="tuiHuo.do?id=${o.kid }" class="btn btn-info">退货</a>
						</c:if>
                            <c:if test="${o.status=='维修完成' }">
                            <a href="wanChen.do?id=${o.kid }" class="btn btn-info">确认</a>
                            </c:if>
						<c:if test="${o.status=='已退货，退款' }">
						<a href="deleteForderF.do?id=${o.kid }" class="btn btn-info">删除</a>
						</c:if>
						</tr>
						</c:forEach>
					</tbody>
			</table>
					
					</div>
					<!--// Cart Products -->

					

				</div>
			</div>
			<!--// Shopping Cart Area -->

		</main>
		<!--// Page Conttent -->

		
			 <jsp:include page="foot.jsp"></jsp:include>
		
