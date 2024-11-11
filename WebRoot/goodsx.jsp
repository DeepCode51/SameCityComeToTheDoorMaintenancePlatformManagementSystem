<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
						<li><a href="goodsListFore.do">商品信息</a></li>
						<li>${goods.name }</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Product Page Wrapper -->
            <div class="product-page-wrapper section-padding-lg">
                <div class="container">

                    <!-- Product Details Inner -->
                    <div class="row product-details">

                        <!-- Product Details Left -->
						<div class="col-lg-5 col-md-6">
							<div class="product-details-left">
								<div class="product-details-images slider-navigation-2">
									<a href="upload/${goods.img }">
										<img src="upload/${goods.img }" alt="product image" width="470px;" height="624px;">
									</a>
									<!-- <a href="img/product/large-size/product-image-2.jpg">
										<img src="img/product/thumbnail-size/product-image-2.jpg" alt="product image">
									</a>
									<a href="img/product/large-size/product-image-3.jpg">
										<img src="img/product/thumbnail-size/product-image-3.jpg" alt="product image">
									</a>
									<a href="img/product/large-size/product-image-4.jpg">
										<img src="img/product/thumbnail-size/product-image-4.jpg" alt="product image">
									</a> -->
								</div>
							<%-- 	<div class="product-details-thumbs slider-navigation-2">										
									<img src="upload/${goods.img }" alt="product image thumb"  width="105px" height="140px;">
									<!-- <img src="img/product/small-size/product-image-3.jpg" alt="product image thumb">
									<img src="img/product/small-size/product-image-4.jpg" alt="product image thumb"> -->
								</div> --%>
							</div>
						</div>
                        <!--// Product Details Left -->

                        <!-- Product Details Right -->
                        <div class="col-lg-7 col-md-6">
							<div class="product-details-right">
								<h5 class="product-title">${goods.name }</h5>
								
								<div class="ratting-stock-availbility">
									<div class="ratting-box">
										<!-- <span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span> -->
									</div>
									<span class="stock-available">销量：${goods.xnum }</span>
								</div>
								<p></p>
								
								<span class="pricebox"><!-- <del>$60.00</del>  -->￥：${goods.price }</span>

								<div class="product-details-quantity">
									<!-- <div class="quantity-select">
										<input type="text" value="1">
									</div> -->
									 <c:if test="${sessionScope.user!=null }">
									<a href="addshop.do?fid=${goods.id }" class="sf-button sf-button-sm">
										<span>加入购物车</span>
									</a>
									</c:if>
									<c:if test="${sessionScope.user==null }">
									<a href="login.jsp" class="sf-button sf-button-sm">
										<span>登录</span>
									</a>
									</c:if>
									<c:if test="${sessionScope.user==null }">
									<a href="regist.jsp" class="sf-button sf-button-sm">
										<span>注册</span>
									</a>
									</c:if>
								</div>
								<div class="product-details-color">
									<span>员工 :</span>
									<ul>
										<li><c:forEach items="${ulist }" var="a">
												<c:if test="${a.id==goods.uid }">
													${a.tname }
												</c:if> </c:forEach>
										</li>
									</ul>
								</div>


								<div class="product-details-categories">
									<span>所属类型：</span>
									<ul>
										<li><c:forEach items="${tlist }" var="a">
												<c:if test="${a.id==goods.fid }">
													<a href="showGoodsType.do?fid=${t.id }">${a.name }</a>
												</c:if>
											  </c:forEach></li>
									</ul>
								</div>

								<!-- <div class="product-details-tags">
									<span>Tags :</span>
									<ul>
										<li><a href="shop.html">Electronic</a></li>
										<li><a href="shop.html">Television</a></li>
									</ul>
								</div>

								<div class="product-details-socialshare">
									<span>Share :</span>
									<ul>
										<li><a href="#"><i class="ti ti-facebook"></i></a></li>
										<li><a href="#"><i class="ti ti-twitter"></i></a></li>
										<li><a href="#"><i class="ti ti-google"></i></a></li>
										<li><a href="#"><i class="ti ti-linkedin"></i></a></li>
										<li><a href="#"><i class="ti ti-instagram"></i></a></li>
									</ul>
								</div>  -->
							</div>
                        </div>
                        <!--// Product Details Right -->
        
                    </div>
                    <!--// Product Details Inner -->
                    
                    <!-- Product Details Review -->
                    <div class="product-descripton-review">

                        <ul class="nav" id="product-description-review" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="product-description-tab" data-toggle="tab" href="#product-description" role="tab" aria-controls="product-description" aria-selected="true">说明</a>
                            </li>
                          <!--   <li class="nav-item">
                                <a class="nav-link" id="product-reviews-tab" data-toggle="tab" href="#product-reviews" role="tab" aria-controls="product-reviews" aria-selected="false">Reviews (1)</a>
                            </li> -->
                        </ul>

                        <div class="tab-content" id="product-description-review-content">
                            <div class="tab-pane fade show active" id="product-description" role="tabpanel" aria-labelledby="product-description-tab">
                                <div class="product-description">
                                 <%-- <p><c:if test="${goods.upload!=null }">
                                            <video height="600px" width="800px;" src="upload/${goods.upload}" controls="controls">
                                                你的浏览器不支持video
                                            </video> </c:if>
                                 
                                        <c:if test="${goods.upload==null }">
                                            暂无文件
                                        </c:if></p> --%>
                                    <p>${goods.note }</p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="product-reviews" role="tabpanel" aria-labelledby="product-reviews-tab">
                                <div class="product-review">
                                    <div class="commentlist">
                                        <h6>1 REVIEW FOR AENEAN EU TRISTIQUE</h6>
                                        <div class="single-comment">
                                            <div class="single-comment-thumb">
                                                <img src="img/author-image/author-image-1.png" alt="hastech logo">
                                            </div>
                                            <div class="single-comment-content">
                                                <div class="single-comment-content-top">
                                                    <h6>ADMIN – February 17, 2015</h6>
                                                    <div class="ratting-box">
                                                        <span class="active"><i class="ti ti-star"></i></span>
                                                        <span class="active"><i class="ti ti-star"></i></span>
                                                        <span class="active"><i class="ti ti-star"></i></span>
                                                        <span class="active"><i class="ti ti-star"></i></span>
                                                        <span><i class="ti ti-star"></i></span>
                                                    </div>
                                                </div>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="commentbox mt-5">
                                        <h6>ADD A REVIEW</h6>
                                        <form action="#" class="sf-form">
                                            <div class="sf-form-inner">
												<div class="single-input">
													<label>Your Rating</label>
													<div class="ratting-box hover-action">
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span class="active"><i class="ti ti-star"></i></span>
														<span><i class="ti ti-star"></i></span>
													</div>
												</div>
												<div class="single-input">
													<label for="new-review-textbox">Your Review</label>
													<textarea id="new-review-textbox" cols="30" rows="5"></textarea>
												</div>
												<div class="single-input">
													<label for="new-review-name">Name*</label>
													<input type="text" id="new-review-name">
												</div>
												<div class="single-input">
													<label for="new-review-email">Email*</label>
													<input type="email" id="new-review-email">
												</div>
												<div class="single-input">
													<button class="sf-button sf-button-dark" type="submit"><span>Submit</span></button>
												</div>
                                            </div>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <!--// Product Details Review -->

                </div>
                                        
            </div>
			<!--// Product Page Wrapper -->
		
			<!-- Similliar products -->
			<!-- <div class="similliar-products-area bg-white section-padding-bottom-lg">
				<div class="container">
					<h3 class="small-title">SIMILLIAR PRODUCTS</h3>

					<div class="row products-wrapper products-slider-active slider-navigation-1">

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-1.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-5.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
									<span class="product-item-badge">New</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox">$50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-2.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-6.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
									<span class="product-item-badge">New</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox">$50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-3.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-7.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox"><del>$60.00</del> $50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-4.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-8.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
									<span class="product-item-badge">Sale</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox">$50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-9.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-13.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
									<span class="product-item-badge">Sale</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox"><del>$60.00</del> $50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-10.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-14.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
									<span class="product-item-badge">New</span>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox">$50.00</span>
								</div>
							</div>	
						</div>
						// Single product

						Single product
						<div class="col-12">
							<div class="product-item">
								<div class="product-item-topside">
									<div class="product-item-images">
										<img src="img/product/thumbnail-size/product-image-11.jpg" alt="product image">
										<img src="img/product/thumbnail-size/product-image-15.jpg" alt="product image">
									</div>
									<ul class="product-item-actions">
										<li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
										<li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
										<li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
										<li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
									</ul>
								</div>
								<div class="product-item-bottomside">
									<div class="ratting-box">
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span class="active"><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
										<span><i class="ti ti-star"></i></span>
									</div>
									<h6><a href="product-details.html">Full Body Shapewear</a></h6>
									<span class="pricebox"><del>$60.00</del> $50.00</span>
								</div>
							</div>	
						</div>
						// Single product

					</div>
				</div>
			</div> -->
			<!--// Similliar products -->

		</main>
		<!--// Page Conttent -->
			
			
			

				<jsp:include page="foot.jsp"></jsp:include>
	