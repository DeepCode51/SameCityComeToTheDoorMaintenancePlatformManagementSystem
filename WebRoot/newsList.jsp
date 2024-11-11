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
						<li>新闻</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

        <!-- Page Conttent -->
		<main class="page-content">

            <!-- Shop Grid Area -->
            <div class="shop-grid-area section-padding-lg bg-white">
                <div class="container">
                <form class="header-searchbox" action="searchNews.do" method="post">		
                    <div class="toolbox">
                        <div class="toolbox-view">
                            <!-- <button class="active" data-product-view="grid"><i class="ti ti-layout-grid3"></i></button>
                            <button data-product-view="list"><i class="ti ti-list"></i></button> -->
                            <input type="text" name="name" placeholder="输入新闻名称">
                        </div>
                        <div class="toolbox-sorting" style="text-align:left; width: 200px;">
                            <button style="width: 100px; height: 50px; margin-left: 100px;background: #b18c8c;"><i class="ti ti-search"></i></button>
                        </div>
                    </div>
                    </form>

                    <div class="row products-wrapper shop-page-products">

                        <!-- Single product -->
                        <c:forEach items="${list }" var="g">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="product-item">
                                <div class="product-item-topside">
                                    <div class="product-item-images">
                                        <a href="showNews.do?id=${g.id }"><img src="upload/${g.img }" alt="product image"  width="270px;" height="350px;">
                                        </a><!-- <img src="img/product/thumbnail-size/product-image-5.jpg" alt="product image"> -->
                                    </div>
                                    <!-- <ul class="product-item-actions">
                                        <li class="trigger-add-to-cart"><a href="#"><i class="ti ti-shopping-cart"></i></a></li>
                                        <li class="quick-view-trigger"><a href="#"><i class="ti ti-eye"></i></a></li>
                                        <li class="trigger-add-to-compare"><a href="#"><i class="ti ti-reload"></i></a></li>
                                        <li class="trigger-add-to-wishlist"><a href="#"><i class="ti ti-heart"></i></a></li>
                                    </ul> -->
                                    <span class="product-item-badge">新闻</span>
                                </div>
                                <div class="product-item-bottomside">
                                    <div class="ratting-box">
                                   				 发布时间：${g.pubtime }
                                       <!--  <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span class="active"><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span>
                                        <span><i class="ti ti-star"></i></span> -->
                                    </div>
                                    <h6><a href="showNews.do?id=${g.id }">${g.name }</a></h6>
                                    <span class="pricebox"> </span>
                                    <p></p>
                                </div>
                            </div>	
                        </div>
                        </c:forEach>
                       


                    </div>

                    <div class="sf-pagination text-center">
                        <ul>
                        <c:if test="${sessionScope.p==1 }">
						<c:if test="${page.page>1}">
						    <li><a href="newsListFore.do?page=${page.page-1 }"><<</a></li>
                            <li><a href="newsListFore.do?page=1">首页</a></li>
                            <li><a >末页</a></li>
                            <li><a >>></a></li>
			             </c:if>
			    	     <c:if test="${page.page<page.totalPage}">
			    	     	<li><a ><<</a></li>
                            <li><a>首页</a></li>
                            <li><a href="newsListFore.do?page=${page.totalPage }" >末页</a></li>
                            <li><a href="newsListFore.do?page=${page.page+1 }">>></a></li>
					    </c:if>
					    </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <!--// Shop Grid Area -->

            <!-- Popular products -->
          
                        <!--// Single product -->

        </main>
        <!--// Page Conttent -->
			
		
			
			<jsp:include page="foot.jsp"></jsp:include>
