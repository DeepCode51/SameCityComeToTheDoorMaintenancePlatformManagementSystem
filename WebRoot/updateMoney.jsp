<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>


	
		<jsp:include page="top.jsp"></jsp:include>

		 <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>充值</li>
					</ul>
				</div>
            </div>
        </div>
        
        
        	<!-- Page Conttent -->
		<main class="page-content">

            <!-- Account Page Area -->
            <div class="account-page-area section-padding-lg">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12">
                            <ul class="nav myaccount-tab-trigger" id="account-page-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">用户充值</a>
                                </li>
                              
                            </ul>
                        </div>

                        <div class="col-lg-12">
                            <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
                                <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
                                    <div class="myaccount-details">
                                    
                                    <form class="sf-form" action="chongZhi.do"   method="post"   >
                                    
                                            <div class="sf-form-inner">
												<div class="single-input single-input-half">
													<label for="account-details-firstname">账号*</label>
													<input type="hidden" name="id" value="${user.id }">
													<input id="" type="text" value="${user.uname }"  readonly="readonly"  />
													<span id='checku' class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
													
												</div>
												<div class="single-input single-input-half">
													<label for="account-details-email">用户姓名*</label>
													<input id="" type="text" value="${user.tname }"  readonly="readonly"  />
													<span id='prompt_pwd'  class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
													
												</div>
												<div class="single-input single-input-half">
													<label for="account-details-email">用户余额：*</label>
													<input  type="text" value="${user.money }"  readonly="readonly"  />
													<span  class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
												</div>
												
												<div class="single-input single-input-half">
													<label for="account-details-email">充值金额：*</label>
													<input  type="number"  name="money" min="1" value="1"  required="required" />
													<span  class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
												</div>
												
												<div class="single-input">
													<button class="sf-button sf-button-dark" type="submit" onclick="return checkAll()"><span>充值</span></button>
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
			 
			 
        
