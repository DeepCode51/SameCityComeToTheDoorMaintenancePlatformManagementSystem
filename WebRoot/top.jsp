<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>同城上门维修平台</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="img/icon.png">

	<!-- Google font (font-family: 'Roboto', sans-serif;) -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
	<!-- Google font (font-family: 'Poppins', sans-serif;) -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">
	
	<!-- Plugins -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/plugins.css">

	<!-- Style Css -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Custom Styles -->
	<link rel="stylesheet" href="css/custom.css">
</head>

<body>
	<!--[if lte IE 9]>
    <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
  <![endif]-->

	<!-- Add your site or application content here -->

	<!-- Wrapper -->
	<div id="wrapper" class="wrapper">
<!-- Header -->
		<header class="header sticky-header">

			<!-- Header Top Area -->
			<div class="header-top-area">
				<div class="container">
					<div class="header-top-inner">
						<div class="header-top-left">
							<h3>同城上门维修平台</h3>
						</div>
						<ul class="header-options">
							
							<c:if test="${sessionScope.user==null }">
							<li>
								<a href="login.jsp">登录</a>
							</li>
							<li>
								<a href="regist.jsp">注册</a>
							</li>
							</c:if>
							<c:if test="${sessionScope.user!=null }">
							<li>
								<a href="loginout.do">注销</a>
							</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!--// Header Top Area -->

			<!-- Header Bottom Area -->
			<div class="header-bottom-area d-none d-lg-block">
				<div class="container">
					<div class="header-bottom-inner">
						<a href="index.do" class="header-logo">
							<!-- <img src="admin/images/logo01.png" alt="同城上门维修平台"> -->
						</a>
						<nav class="sf-navigation">
							<ul>
								<li><a href="index.do">首页</a>
									<!-- <ul>
										<li><a href="index.html">Home Version 1</a></li>
										<li><a href="index-2.html">Home Version 2</a></li>
									</ul> -->
								</li>
								<li><a href="newsListFore.do">新闻资讯</a></li>
								<li><a href="index.do">分类</a>
									<ul>
										<c:forEach items="${tlist }" var="t">
										<li><a href="showGoodsType.do?fid=${t.id }">${t.name }</a></li>
										</c:forEach>
									</ul>
								</li>
								<li><a href="goodsListFore.do">商品</a></li>
								<li><a href="myBbsList.do">留言</a></li>                                               
								<li><a href="showShop.do">购物车</a></li>
								 <c:if test="${sessionScope.user!=null }">
								 <li><a href="showInfo.do"><img alt="" src="upload/${sessionScope.user.img }" width="50px;" height="50px;"> ${sessionScope.user.uname }</a>
									<ul>
										<li><a href="showInfo.do">我的信息</a></li>
										<li><a href="shopList.do">我的订单</a></li>
										<li><a href="myBbsList.do">我的留言</a></li>
									</ul>
								</li>
								</c:if>                                              
								<li><a href="admin/" target="_blank;">后台</a></li>                                               
							</ul>
						</nav>
						<ul class="header-icons">
							<li>
								<button class="header-search-trigger"><i class="ti ti-search"></i></button>
								<div class="header-searchbox-wrapper">
									<form class="header-searchbox" action="searchGoods.do" method="post">
										<input type="text" name="name" placeholder="输入商品名称">
										<button><i class="ti ti-search"></i></button>
									</form>
								</div>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
			<!--// Header Bottom Area -->

			<!-- Header Mobile Menu -->
			<div class="mobile-menu-area d-block d-lg-none">
				<div class="container">
					<div class="mobile-menu clearfix">
						<ul class="header-icons">
							<li>
								<button class="header-search-trigger"><i class="ti ti-search"></i></button>
								<div class="header-searchbox-wrapper">
									<form class="header-searchbox" action="searchGoods.do" method="post">
										<input type="text" name="name" placeholder="输入商品名称">
										<button><i class="ti ti-search"></i></button>
									</form>
								</div>
							</li>
							
						</ul>
						<a href="index.do" class="logo">
							<img src="admin/images/logo01.png" alt="同城上门维修平台">
						</a>
					</div>
				</div>
			</div>
			<!--// Header Mobile Menu -->

		</header>
		<!--// Header -->








			
