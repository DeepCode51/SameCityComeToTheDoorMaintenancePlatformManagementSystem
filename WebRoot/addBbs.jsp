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
						<li>添加留言</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Contact Area -->
            <div class="contact-us-area section-padding-lg">

				<!-- Contact Us Info -->
				<div class="container">
					<div class="row">
						
						<div class="col-lg-8">
							<div class="commentbox">
								<h3 class="small-title">添加留言</h3>
								<form id="contact-form" action="addBbs.do" method="POST" class="sf-form contact-form">
									<div class="sf-form-inner mt-0">
										<div class="single-input ">
											<label for="new-review-name">标题*</label>
											<input type="text" name="name" id="new-review-name" required="required">
										</div>
										<div class="single-input">
											<label for="new-review-textbox">留言内容</label>
											<textarea id="new-review-textbox" name="note" cols="30" rows="5" required="required"></textarea>
										</div>
										<div class="single-input">
											<button class="sf-button sf-button-dark" type="submit"><span>提交</span></button>
										</div>
									</div>
								</form>
								<p class="form-message"></p>
							</div>
						</div>

						<div class="col-lg-4">
							<div class="mt-30 mt-lg-0">
								<div class="image-banner">
									<a href="#">
										<img src="img/banners/contact-banner.jpg" alt="contact banner">
									</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!--// Contact Us Info -->

            </div>
			<!--// Contact Area -->

			<div class="google-map-wrapper">
				<div class="google-map" id="google-map"></div>
			</div>

		</main>
		<!--// Page Conttent -->
				 <jsp:include page="foot.jsp"></jsp:include>
