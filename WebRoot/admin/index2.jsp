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
    <title>同城上门维修平台</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
	<link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	
</head>

<body class="layui-layout-body control_box">
	<!-- 背景 -->
	<div class="bg_box" style="background: url(images/20190415.jpg) no-repeat center center; background-size: cover;"></div>
	<!-- content box-->
	<div class="layui-layout layui-layout-admin">
		<!-- top -->
		<div class="layui-header">
			<div class="top_box">
		        <div class="logo">
		        	<img src="images/logo01.png" style="width: 300px;">
		        	<!-- <span></span> -->
		        	<!-- <b><img src="images/word.png" /></b> -->
		        </div>

				<div class="top_user">
					<span><img src="../upload/${sessionScope.auser.img }" width="50px" height="50px" /></span>
					<dl>
						<dt>${sessionScope.auser.tname }</dt>
						<dd>${sessionScope.auser.utype }</dd>
					</dl>
				</div>

		        <div class="top_icon">
		        	<a href="<%=basePath %>" title="首页" target="_blank;"><img src="images/top_home.png"></a>
		        	<a href="showUserInfo.do" title="个人设置" target="main_self_frame"><img src="images/top_person.png"></a>
		        	<a href="loginout.do" title="退出"><img src="images/top_exit.png"></a>
		        </div>
		    </div>
		</div> 
	    <!-- side menu -->
		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<c:if test="${sessionScope.auser.utype=='管理员' }">
					<li class="layui-nav-item layui-nav-itemed">
						<a class="" href="javascript:;"><i class="fa fa-clipboard fa-fw"></i>用户管理</a>
						<dl class="layui-nav-child">
							<dd><a href="user_add.jsp" target="main_self_frame">用户添加</a></dd>
							<dd><a href="userList.do" target="main_self_frame">用户列表</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-hourglass-half fa-fw"></i>新闻管理</a>
						<dl class="layui-nav-child">
							<dd><a href="newsList.do" target="main_self_frame">新闻管理</a></dd>
						</dl>
					</li>
					
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-hourglass-half fa-fw"></i>留言管理</a>
						<dl class="layui-nav-child">
							<dd><a href="bbsList.do" target="main_self_frame">留言管理</a></dd>
						</dl>
					</li> 
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i>商品管理</a>
						<dl class="layui-nav-child">
							<dd><a href="typeList.do" target="main_self_frame">商品分类列表</a></dd>
							<dd><a href="goodsList.do" target="main_self_frame">商品列表</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i>订单管理</a>
						<dl class="layui-nav-child">
							<dd><a href="ForderList.do" target="main_self_frame">订单管理</a></dd>
						</dl>
					</li>
					<%--<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i>营销助手管理</a>
						<dl class="layui-nav-child">
							<dd><a href="goods_tj.do" target="main_self_frame">营销助手管理</a></dd>
						</dl>
					</li>--%>
					</c:if>
					<c:if test="${sessionScope.auser.utype=='员工' }">
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-hourglass-half fa-fw"></i>新闻查看</a>
						<dl class="layui-nav-child">
							<dd><a href="newsList.do" target="main_self_frame">新闻查看</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-hourglass-half fa-fw"></i>商品管理</a>
						<dl class="layui-nav-child">
							<dd><a href="goodsList.do" target="main_self_frame">商品列表</a></dd>
						</dl>
					</li> 
					<li class="layui-nav-item">
						<a href="javascript:;"><i class="fa fa-sitemap fa-fw"></i>订单查看</a>
						<dl class="layui-nav-child">
							<dd><a href="ForderList.do" target="main_self_frame">订单查看</a></dd>
						</dl>
					</li>
					</c:if>
					
				</ul>
			</div>
		</div>
	  
		<div class="layui-body">
			<!-- 展开收起按钮 -->
			<div class="open_shrink open" title="展开/收起">
				<span></span>
			</div>
			<script type="text/javascript">
				$(function(){
					$(".open_shrink").click(function(){
						if ($(this).hasClass("open")) {
							$(this).removeClass("open");
							$(".layui-side").stop().animate({left:-220},300);
							$(".layui-body").stop().animate({left:0},300);
						}else{
							$(this).addClass("open");
							$(".layui-side").stop().animate({left:0},300);
							$(".layui-body").stop().animate({left:220},300);
						}
					})
				})
			</script>
			<!-- iframe -->
			<iframe src="user_add.jsp" name="main_self_frame" frameborder="0" class="layadmin-iframe" scrolling="yes"></iframe>
		</div>
	  
	</div>
	<!-- layui js -->
	<script src="layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;
		  
		});
		
	</script>

</body>

</html>

