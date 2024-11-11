<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


		
		<jsp:include page="top.jsp"></jsp:include>
		
		
		
		
		
		
		<!-- Hero Area -->
		<div class="hero-area slider-navigation-1">

			<!-- Single Slide Item -->
			
			<c:forEach items="${nlist }" var="n">
			<div class="single-hero-item bg-grey d-flex align-items-center">
				<div class="container">
					<div class="hero-item-inner">
						<div class="row align-items-center justify-content-center">
							<div class="col-xl-6 col-lg-7 col-md-7 col-12 order-2 order-md-1">
								<div class="hero-content">
									<h1><span></span>${n.name }</h1>
									<p>发布时间：${n.pubtime }</p>
									<a href="showNews.do?id=${n.id }" class="sf-button">
										<span>查看详情</span>
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-5 col-md-5 col-sm-6 order-1 order-md-2 align-self-end">
								<div class="hero-image">
									<img src="./upload/${n.img }" alt="hero image">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!--// Single Slide Item -->
			
			


		</div>
		<!--// Hero Area -->

		<!-- Page Conttent -->
		<main class="page-content">

			
			<!--// Fullwidth Banner -->



			<!-- Featured Shop Item -->
			<div class="sf-section featured-shop-item section-padding-lg bg-white">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="section-title text-center">
								<h6></h6>
								<h3>商品信息</h3>
							</div>
						</div>
					</div>

					<div class="row products-wrapper">

						<!-- Single product -->
						
							<c:forEach items="${glist }" var="g">
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="upload/${g.img }" alt="product image" width="270px;" height="350px;">
										<!-- <img src="img/product/thumbnail-size/product-image-13.jpg" alt="product image"> -->
									</div>
									<!-- <ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul> -->
									<span class="product-item-badge">Sale</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
									销量：${g.xnum }
										<!-- <span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span> -->
									</div>
									<h6><a href="showGoodsx.do?id=${g.id }">${g.name }</a></h6>
									<span class="pricebox"><!-- <del>$60.00</del> -->￥： ${g.price }</span>
								</div>
							</div>	
						</div>
						</c:forEach>
						<!--// Single product -->


					</div>

				</div>
			</div>
			<!--// Featured Shop Item -->

			<!-- Banner Area -->
			
			<!--// Random Products View -->

			<!-- Blog Area -->
			<div class="sf-section blog-area bg-white section-padding-lg">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="section-title text-center">
								<h6></h6>
								<h3>新闻信息</h3>
							</div>
						</div>
					</div>

					<div class="row blog-slider-active slider-navigation-1">

						<!-- Single Blog -->
						<c:forEach items="${nlist2 }" var="n2">
						<div class="col-12">
							<div class="blog-item">
								<div class="blog-item-image">
									<img src="upload/${n2.img }" alt="blog image" width="370px;" height="450px;">
								</div>
								<div class="blog-item-content">
									<div class="blog-item-content-inner">
										<span class="blog-item-author">By: <a href="blog.html">admin</a></span>
										<h6 class="blog-item-title"><a href="showNews.do?id=${n2.id }">${n2.name } </a></h6>
										<p></p>
										<div class="blog-item-meta">
											<span>${n2.pubtime }</span>
											<span><a href="#"></a></span>
											<span><a href="#"></a></span>
										</div>
										<a href="newsListFore.do" class="sf-button sf-button-transparent sf-button-sm">
											<span>查看更多</span>
										</a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						<!--// Single Blog -->

						

					</div>
				</div>
			</div>
			<!--// Blog Area -->

			

		</main>
		<!--// Page Conttent -->
		
		
	
			
			<jsp:include page="foot.jsp"></jsp:include>
			