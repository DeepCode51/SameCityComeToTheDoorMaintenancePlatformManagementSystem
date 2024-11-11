<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<script type="text/javascript" src="js/shop.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
<script> 
$(function(){ 
$(".add").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())+1) 
setTotal(); 
}) 
$(".min").click(function(){ 
var t=$(this).parent().find('input[class*=text_box]'); 
t.val(parseInt(t.val())-1) 
if(parseInt(t.val())<=0){ 
t.val(1); 
} 
setTotal(); 
}) 
function setTotal(){ 
var s=0; 
$("#shop-xx #num22").each(function(){ 
s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text()); 
});
document.getElementById("total").value=s.toFixed(2);
//("input[id=total]").html(s.toFixed(2)); 
} 
setTotal(); 


}) 

</script>
	<jsp:include page="top.jsp"></jsp:include>
	
	
	
	  <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>我的购物车</li>
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
						<table class="table table-bordered table-hover">
							<thead>
								<tr>	
									<th class="cart-column-productname" scope="col">名称</th>
									<th class="cart-column-image" scope="col">图片</th>
									<th class="cart-column-price" scope="col">单价/数量</th>
									<th class="cart-column-quantity" scope="col">修改</th>
									<!-- <th class="cart-column-addtocart" scope="col">回复时间</th> -->
									<th class="cart-column-remove" scope="col">操作</th>
								</tr>
							</thead>
							<tbody>
							
							
							<c:forEach items="${list }" var="s">
						 <form action="updateShopNum.do" method="post">
						<tr id="shop-xx">
							<td><c:forEach items="${glist }" var="g">
			               		<c:if test="${g.id==s.fid }">
			                	${g.name }</c:if></c:forEach>
			           		</td>
							<td>
						 	<c:forEach items="${glist }" var="g">
		                	<c:if test="${g.id==s.fid }">
		                	<img src="./upload/${g.img }" width="87" height="58"  />
		                	</c:if>
		                	</c:forEach>
		                	</td>
							<td id="num22" >
							总价:￥<span class="price">
					       	<c:forEach items="${glist }" var="g">
					        <c:if test="${g.id==s.fid }">
					            ${g.price }
					         </c:if>
					         </c:forEach>
					         </span>元/
		                    <input class="min btn  btn-info" type="button"   value="-" style="width:10px" /> 
		                    <input class="text_box" size="2" name="num" min="1" type="text" value="${s.num }" style="width:50px"/> /<c:forEach items="${glist }" var="g">
		           			</c:forEach>
		                    <input class="add btn  btn-info"  type="button" value="+" style="width:10px"/> 
		                    <input   type="hidden" name="id"  value="${s.id }" />
                     	</td>
						<td><input type="submit" class="btn btn-info" value="确认修改"/></td>
						<td> <a href="deleteShop.do?id=${s.id }"  class="btn btn-warning"><i class="ti ti-close"></i>删除</a></td>
						</tr>
						 </form>
						</c:forEach>
							</tbody>
							<tr>
						<td colspan="3">
						<img alt="" src="img/zhifu.png" width="600px;" height="300px;">
						</td>
						<td colspan="2">
						<form action="addOrder.do" method="post">
						<div id="js">
						<ul style="    list-style: none;">
						<li>您的余额为：${user.money }</li>
						<li style="    margin-top: 10px;">应付金额：<label ><input type="text" name="zprice" id="total" readonly="readonly" style="width:100px"/>元 </label>
						<li style="    margin-top: 10px;">
						<input name="id" type="hidden"  value="${sessionScope.user.id }"  />
						</li>
						<li style="margin-top: 10px;"> 
						<input name="button" type="submit" id="button" class="btn btn-warning" value="确认支付"  /></li>
						</ul>
						</div>
						</form>
						</td>
						</tr>
						</table>
					</div>
					<!--// Cart Products -->

					

				</div>
			</div>
			<!--// Shopping Cart Area -->

		</main>
		<!--// Page Conttent -->

		
			 <jsp:include page="foot.jsp"></jsp:include>
		
		
	