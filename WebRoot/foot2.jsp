<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<script type="text/javascript" src="skin/js/jquery.migrate.js"></script>
		<!--<script type="text/javascript" src="skin/js/jquery.bxslider.min.js"></script>-->
		<script type="text/javascript" src="skin/js/jquery.imagesloaded.min.js"></script>
		<script type="text/javascript" src="skin/js/retina-1.1.0.min.js"></script>
		<script type="text/javascript" src="skin/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="skin/js/jquery.themepunch.revolution.min.js"></script>
		<script type="text/javascript" src="skin/js/script.js"></script>
		<nav id="mmenu" class="noDis">
			<div class="mmDiv">
				<div class="MMhead">
					<a href="#mm-0" class="closemenu noblock">X</a>
					
				</div>
				<div class="mm-search">
					<form class="mm-search-form" name="formsearch" method="post" action="searchCar.do">
						<input type="text" autocomplete="off" name="name" class="side-mm-keyword" placeholder="输入商品名称" />
						<input type="submit" id="searchsubmit" value="查询" style="margin-top:10px;"/>
					</form>
				</div>
				<div class="mm-search">
				</div>
				<ul>
					<li class="m-Lev1 m-nav_0">
						<a href="index.do">网站首页</a>
					</li>
					<li class="m-Lev1 m-nav_4">
						<a href="showGoods.do" class="menu1 " >商品</a>
					</li>
					<li class="m-Lev1 m-nav_4">
						<a href="fnewsList.do" class="menu1">新闻资讯</a>
					</li>
					<li class="m-Lev1 m-nav_4">
						<a href="showGoods3.do" class="menu1">特价商品</a>
					</li>
					<li class="m-Lev1 m-nav_4">
						<a href="bbsList.do" class="menu1 ">论坛</a>
					</li>
					<li class="m-Lev1 m-nav_4">
						<a href="showShop.do" class="menu1">购物车 </a>
					</li>
					
					<c:if test="${sessionScope.user==null }">
				<li class="m-Lev1 m-nav_4" >
					<a href="login.jsp" class="menu1 ">登录
					</a>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="regist.jsp" class="menu1 ">注册
					</a>
				</li>
				</c:if>
					<c:if test="${sessionScope.user!=null }">
				  <li class="m-Lev1 m-nav_4">
					<a href="javascript:;" class="m-menu1" style="color:#f00;">${sessionScope.user.uname }
					<!-- <i class="fa fa-caret-down"></i> --></a>
					<ul class="submenu">
						<li class="m-Lev2">
							<a href="showInfo.do" class="m-menu2">我的信息</a>
						</li>
						<li class="m-Lev2">
							<a href="shopList.do" class="m-menu2">我的订单</a>
						</li>
						<!-- <li class="m-Lev2 m-nav_4">
							<a href="myBbsList.do" class="m-menu2">我的论坛</a>
						</li> -->
					</ul>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="loginout.do" class="menu1 ">注销
					</a>
				</li>
				</c:if>
				</ul>
			</div>
		</nav>
		<link type="text/css" rel="stylesheet" href="skin/css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="skin/js/jquery.mmenu.all.min.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				var mmenu = $('nav#mmenu').mmenu({
					slidingSubmenus: true,
					classes: 'mm-white', //mm-fullscreen mm-light
					extensions: ["theme-white"],
					offCanvas: {
						position: "right", //left, top, right, bottom
						zposition: "front" //back, front,next
						//modal		: true
					},
					searchfield: false,
					counters: false,
					//navbars		: {
					//content : [ "prev", "title", "next" ]
					//},
					navbar: {
						title: "网站导航"
					},
					header: {
						add: true,
						update: true,
						title: "网站导航"
					}
				});
				$(".closemenu").click(function() {
					var mmenuAPI = $("#mmenu").data("mmenu");
					mmenuAPI.close();
				});
			});
		</script>
	</body>

</html>
