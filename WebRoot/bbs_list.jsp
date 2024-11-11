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
						<li>留言列表</li>
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
					
					<div><a href="addBbs.jsp" class="sf-button sf-button-dark">发布留言</a></div>
					<!-- 下面写内容 -->
	<table class="layui-table table table-bordered table-hover" lay-filter="mylist" lay-size="lg">
		<thead>
			<tr>
				<th lay-data="{field:'xh', align:'center',width:160}">序号</th>
				<th lay-data="{field:'yx', align:'center',width:160}">标题</th>
				<th lay-data="{field:'sj',align:'center', minWidth:100}">留言内容</th>
				<th lay-data="{field:'ly',align:'center', minWidth:100}">留言时间</th>
				<th lay-data="{field:'hn',align:'center', minWidth:100}">回复内容</th>
				<th lay-data="{field:'hf',align:'center', minWidth:100}">回复时间</th>
				<th lay-data="{field:'addr2',align:'center',minWidth:100}">操作</th> 
			</tr> 
		</thead>
		<tbody>
		 <c:forEach items="${list }" var="u"  varStatus="num">
		 <tr>
				<!-- <td></td> -->
				<td>${num.count }</td>
				<td>${u.name }</td>
				<td>${u.note }</td>
				<td>${u.pubtime }</td>
				<td>${u.note2 }</td>
				<td>${u.etime }</td>
			  <td>
				<a class="layui-btn layui-btn-danger layui-btn-xs color2"  onclick="return del(1,1,1)" href="deleteBbsFore.do?id=${u.id }" >删除</a>
			  </td>
			</tr>
        </c:forEach> 
		</tbody>
		
	</table>
					<%-- 	<table class="table table-bordered table-hover">
							<thead>
								<tr>			
									<th class="cart-column-image" scope="col">标题</th>
									<th class="cart-column-productname" scope="col">留言内容</th>
									<th class="cart-column-price" scope="col">发布时间</th>
									<th class="cart-column-quantity" scope="col">回复内容</th>
									<th class="cart-column-addtocart" scope="col">回复时间</th>
									<th class="cart-column-remove" scope="col">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="b">
								<tr>
									<td>${b.name }</td>
									<td>${b.note }</td>
									<td>${b.pubtime }</td>
									<td>${b.note2 }</td>
									<td>${b.etime }</td>
									<td>
										<a href="deleteBbsFore.do?id=${b.id }"><i class="ti ti-close"></i>删除</a>
									</td>
								</tr>
								</c:forEach>
								<tr><td colspan="6"><a href="addBbs.jsp">发布留言</a></td></tr>

								
								
							</tbody>
						</table> --%>
					</div>
					<!--// Cart Products -->

					

				</div>
			</div>
			<!--// Shopping Cart Area -->

		</main>
		<!--// Page Conttent -->

		
			 <jsp:include page="foot.jsp"></jsp:include>
		
