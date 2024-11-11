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
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit" />
	<meta name="robots" content="index, follow" />
	<title>404_我的网站</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link rel="stylesheet" type="text/css" href="skin/css/font-awesome.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/owl.carousel.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/owl.theme.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/settings.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/style-red.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="skin/css/tk.css" media="screen" />
	<script type="text/javascript" src="skin/js/jquery.min.js"></script>
	<script type="text/javascript" src="skin/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="skin/js/owl.carousel.min.js"></script>
</head>

	<body>
		<div id="container">
		
			<jsp:include page="top.jsp"></jsp:include>

			<div class="breadcrumb-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-4 bcid-cat">404</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>404</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								<div id="contact-wrap">
									<h3 class="msg-title">非常遗憾，您访问的页面不存在！确认下你的操作是否有误！</h3>
							
   <script type="text/javascript" src="skin/js/jquery.form.js"></script>
									<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
									<script type="text/javascript" src="skin/js/iframetools.js"></script>
								</div>
							</div>
						</div>
						<aside class="sidebar col-md-3 inner-right" role="complementary">
							
						</aside>
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
			<footer id="footer-sec">
				<div class="container">
					<div class="footer-widgets">
						<div class="row">
							<div class="col-md-3 col-sm-12 foot-about">
							</div>
						</div>
					</div>
				</div>
				<div class="last-line">
					<div class="container">
						<p class="copyright"> Copyright &copy; 2018  基于信息反馈的同城上门维修平台的设计与实现 </p>
					</div>
				</div>
			</footer>
		</div>
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
					<a href="javascript:;" target="_blank" class="noblock"><i class="fa fa-weibo"></i></a>
					<a href="javascript:;" target="_blank" class="noblock"><i class="fa fa-tencent-weibo"></i></a>
					<!--<a href="javascript:;" target="_blank" class="noblock">English</a>-->
				</div>
				<div class="mm-search">
					<form class="mm-search-form" name="formsearch" action="javascript:;">
						<input type="hidden" name="kwtype" value="0" />
						<input type="text" autocomplete="off" value="" name="q" class="side-mm-keyword" placeholder="输入关键字..." />
					</form>
				</div>
				<ul>
					<li class="m-Lev1 m-nav_0">
						<a href="index.do">网站首页</a>
					</li>
					<li class="Lev1"><!-- product_diy.html -->
									<a href="news2.do" class="menu1 ">医疗设备
									</a>

								</li>
								<li class="Lev1">
									<a href="news.do" class="menu1 ">医院动态
									</a>

								</li>
								<li class="Lev1">
									<a href="doctor.do" class="menu1 ">医生信息</a>

								</li>
								<li class="Lev1">
									<a href="bbs.do" class="menu1 ">留言咨询
									</a>
								</li>
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
