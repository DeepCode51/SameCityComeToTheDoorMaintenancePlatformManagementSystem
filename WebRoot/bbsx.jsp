<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<title>论坛信息详情_我的网站</title>
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
						<div class="col-md-3 col-sm-4 bcid-cat">论坛信息</div>
						<div class="col-md-9 col-sm-8 location"><i class="fa fa-map-marker"></i> &nbsp;<span>当前位置： <a href='javascript:;'>主页</a> > <a href='javascript:;'>论坛信息</a></span></div>
					</div>
				</div>
			</div>
			<div class="page-container" id="innerpage-wrap">
				<div class="container">
					<div class="row">
						<div class="main col-md-9 inner-left" role="main">
							<div class="about-page-wrap">
								<div class="com-cnt page-content">${bbs.note }<br />
									<p>&nbsp;</p>
									${bbs.note2 }

									<c:forEach items="${list }" var="b">
									<p>发布人：
									<c:forEach items="${ulist }" var="u">
									<c:if test="${b.uid==u.id }">
									${u.tname }
									</c:if>
									</c:forEach></p>
									<p>发布时间：${b.pubtime }</p>
									发布内容：
									<div id="pages" class="page">${b.note2 }</div>
									</c:forEach>
									
									</div>
									<div id="contact-wrap">
								    <c:if test="${sessionScope.user!=null }">
								    <div id="contact-wrap">
									<h3 class="msg-title">回复留言</h3>
									<form class="add-msg-form" action="addHuiFu.do"   method="post" ><!-- enctype="multipart/form-data" -->
										<div class="row">
										
											<!-- <div class="cf-column col-md-12"> 
												<input name="note" type="text" placeholder="标题"   />
											</div> -->
											
											<div class="cf-column col-md-12 cf-tarea">
											<input type="hidden" value="${bbs.id }" name="gid">
												<textarea name="note2" id="content" placeholder="留言内容" validate="minlength:2, maxlength:200, required:true"></textarea>
											</div>
											<div class="cf-column col-md-12 submit-column">
												<button type="submit" id="submit-btn" class="submit-button" >提交</button>
											</div>
										</div>
									</form>
									</div>
									</c:if>
									<c:if test="${sessionScope.user==null }">
									<p>请登录后操作！</p>
									<h3 class="msg-title"><a href="login.jsp" class="btn btn-info">登录</a></h3>
									</c:if>
									<script type="text/javascript" src="skin/js/jquery.form.js"></script>
									<script type="text/javascript" src="skin/js/jquery.artdialog.js"></script>
									<script type="text/javascript" src="skin/js/iframetools.js"></script>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="for-bottom-padding"></div>
				<jsp:include page="foot.jsp"></jsp:include>
		</div>
		 <jsp:include page="foot2.jsp"></jsp:include>