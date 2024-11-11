<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<script type="text/javascript" src="js/userAdd.js"></script>
		<jsp:include page="top.jsp"></jsp:include>
		
		  <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>订单详情</li>
					</ul>
				</div>
            </div>
        </div>
        <!--// Bradcrumb Area -->

		<!-- Page Conttent -->
		<main class="page-content">

            <!-- Account Page Area -->
            <div class="account-page-area section-padding-lg">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12">
                            <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">订单详情</a>
                                </li>
                              
                            </ul>
                        </div>

                        <div class="col-lg-12">
                            <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
                                <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
                                    <div class="myaccount-details">
                                    <form class="sf-form" action="reg.do" onsubmit="return check();"  method="post"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->
                                            <div class="sf-form-inner">
												<div class="single-input single-input-half">
													<label for="account-details-firstname">订单编号：</label>
													<input type="text" name="uname" id="username" readonly="readonly" value="${order.ono }" readonly="readonly">
													<span id='checku' class="spanInit" ></span>
												</div>
												
												<div class="single-input single-input-half">
													<label for="account-details-lastname">订单时间：</label>
													<input type="text" id="account-details-lastname"  value="${order.stime }" readonly="readonly">
												</div>
												<div class="single-input single-input-half">
													<label for="account-details-lastname">订单总价：</label>
													<input type="text" id="account-details-lastname"  value="${order.zprice }" readonly="readonly">
												</div>
												<div class="single-input single-input-half">
													<label for="account-details-lastname">订单状态：</label>
													<input type="text" id="account-details-lastname"  value="${order.status }" readonly="readonly">
												</div>
												
												<c:forEach items="${list }" var="s">
												<div class="single-input ">
													<label for="account-details-lastname">商品名称：：</label>
													<c:forEach items="${glist }" var="g">
														<c:if test="${s.fid==g.id }">
															<input type="text" id="account-details-lastname"  value="${g.name }" readonly="readonly">
														</c:if>
													</c:forEach>
												</div>
												<div class="single-input ">
													<label for="account-details-email">图片：</label>
													<c:forEach items="${glist }" var="g">
														<c:if test="${s.fid==g.id }">
															<img alt="" src="./upload/${g.img }" width="50" height="50"> 
														</c:if>
													</c:forEach>
												</div>
											<div class="single-input ">
												<label for="account-details-email">商品数量：</label>
												<input type="text" id="account-details-lastname"  value="${s.num }" readonly="readonly">
											</div>
											</c:forEach>
											<div class="single-input single-input-half">
												<label for="account-details-email">用户姓名：</label>
												<input type="text" id="account-details-lastname"  value="${user.tname }" readonly="readonly">
											</div>
											<div class="single-input single-input-half">
												<label for="account-details-email">用户账号：</label>
												<input type="text" id="account-details-lastname"  value="${user.uname }" readonly="readonly">
											</div>
											<div class="single-input single-input-half">
												<label for="account-details-email">用户电话：</label>
												<input type="text" id="account-details-lastname"  value="${user.tel }" readonly="readonly">
											</div>
											<div class="single-input single-input-half">
												<label for="account-details-email">用户地址：</label>
												<input type="text" id="account-details-lastname"  value="${user.address }" readonly="readonly">
											</div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--// Account Page Area -->

		</main>
		
			
			 <jsp:include page="foot.jsp"></jsp:include>
			