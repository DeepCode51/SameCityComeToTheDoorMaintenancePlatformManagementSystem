<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>








			<jsp:include page="top.jsp"></jsp:include>
			
			
			
			 <!-- Bradcrumb Area -->
        <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li><a href="newsListFore.do">新闻信息</a></li>
						<li>${news.name }</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Blog Area -->
            <div class="blog-details-area bg-white section-padding-lg">
				<div class="container">

					<div class="blog-details">
						<div class="blog-item">
							<%-- <div class="blog-item-image">
								<img src="upload/${news.img }" alt="blog image">
							</div> --%>
							<div class="blog-item-content">
								<div class="blog-item-content-inner">
									<h3 class="blog-item-title">${news.name }</h3>
									<span class="blog-item-author">By: <a>admin</a></span>
									<div class="blog-item-meta">
										<span>${news.pubtime }</span>
										<!-- <span><a href="#">Comment’s : 05</a></span>
										<span><a href="#">Like : 08</a></span> -->
									</div>
									<p>${news.note }</p>
									</div>
							</div>
						</div>
						<!-- <div class="blog-item-share">
							<h6>Share This Post: </h6>
							<div class="social-icons">
								<ul>
									<li class="facebook"><a href="#" data-toggle="tooltip" title="" data-original-title="Facebook"><i class="ti ti-facebook"></i></a></li>
									<li class="twitter"><a href="#" data-toggle="tooltip" title="" data-original-title="Twitter"><i class="ti ti-twitter"></i></a></li>
									<li class="pinterest"><a href="#" data-toggle="tooltip" title="" data-original-title="Pinterest"><i class="ti ti-pinterest"></i></a></li>
									<li class="google-plus"><a href="#" data-toggle="tooltip" title="" data-original-title="Google-plus"><i class="ti ti-google"></i></a></li>
									<li class="linkedin"><a href="#" data-toggle="tooltip" title="" data-original-title="Linkedin"><i class="ti ti-linkedin"></i></a></li>
								</ul>
							</div>
						</div> -->
						<!-- <div class="authorbox">
							<div class="authorbox-image">
								<img src="img/author-image/author-image-1.png" alt="author image">
							</div>
							<div class="authorbox-content">
								<h5>About the Author: <a href="blog-right-sidebar.html">Admin</a></h5>
								<p>Praesent pretium tellus in tortor viverra condimentum condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel</p>
							</div>
						</div> -->
						
						<!-- <div class="blog-details-comments-area">
							<div class="commentlist">
								<h6>3 COMMENTS</h6>

								<div class="single-comment">
									<div class="single-comment-thumb">
										<img src="img/author-image/author-image-1.png" alt="hastech logo">
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="blog-right-sidebar.html">ADMIN</a> – February 17, 2015</h6>
											<a href="#" class="reply-button">Reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
									</div>
								</div>

								<div class="single-comment single-comment-reply">
									<div class="single-comment-thumb">
										<img src="img/author-image/author-image-2.png" alt="hastech logo">
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="blog-right-sidebar.html">DEMO</a> – February 17, 2015</h6>
											<a href="#" class="reply-button">Reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
									</div>
								</div>

								<div class="single-comment">
									<div class="single-comment-thumb">
										<img src="img/author-image/author-image-1.png" alt="hastech logo">
									</div>
									<div class="single-comment-content">
										<div class="single-comment-content-top">
											<h6><a href="blog-right-sidebar.html">ADMIN</a> – February 17, 2015</h6>
											<a href="#" class="reply-button">Reply</a>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
									</div>
								</div>

							</div>

							<div class="commentbox mt-5">
								<h6>LEAVE A REPLY</h6>
								<form action="#" class="sf-form">
									<div class="sf-form-inner">
										<div class="single-input">
											<label for="new-review-textbox">Comment</label>
											<textarea id="new-review-textbox" cols="30" rows="5"></textarea>
										</div>
										<div class="single-input single-input-half">
											<label for="new-review-name">Name*</label>
											<input type="text" id="new-review-name">
										</div>
										<div class="single-input single-input-half">
											<label for="new-review-email">Email*</label>
											<input type="email" id="new-review-email">
										</div>
										<div class="single-input">
											<button class="sf-button sf-button-dark" type="submit"><span>Post Comment</span></button>
										</div>
									</div>
								</form>
							</div>
						</div> -->
					</div>

				</div>
            </div>
            <!--// Blog Area -->

		</main>
		<!--// Page Conttent -->

		
					<jsp:include page="foot.jsp"></jsp:include>
		
		 
		 
		 