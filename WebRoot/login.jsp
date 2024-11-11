<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


	<script type="text/javascript" src="js/userAdd.js"></script>
		<jsp:include page="top.jsp"></jsp:include>
<script type="text/javascript">
function checkCode11(){
 	  //alert("ddd");
 	  var incode=$("#imgCode").val();
 	 // alert(incode);
 	  if(incode==""){
 	    $("#checkcode22").html("验证码不能为空！");
 	     $("input[id=imgCode]").focus();
 	  }else{
 	  $.ajax({
 	  url:"checkCodeF.do",
 	  type:"post",
 	  data:"code="+incode,
 	  dataType:"json",
 	  success:function(result){
 	  msga=result.res;
 	 // alert(msga);
 	    if(msga=="ok"){
 	    	
 	    $("#checkcode22").html("验证码正确！");
 	   return true;
 	    }else{
 	  	//alert("验证码不正确！请重新输入！");
 	    $("#checkcode22").html("验证码不正确！请重新输入！");
 	    $("#imgCode").val("");
 	  $("input[id=imgCode]").focus();
 	    return false;
 	    }
 	  },
 	  error:function(){
 	    alert("请求失败！");
 	  }
 	  })
 	  }
 	  }


//页面加载刷新图片验证码  
$("#img").click();  
//生成图片验证码  
function changeValidateCode(obj) {  
    //获取当前的时间作为参数，无具体意义     
    var timenow = new Date().getTime();  
   // alert("dddimg");
    //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
    obj.src = "admin/autoCode.img?d=" + timenow;
<%--      <%
    String img=(String)session.getAttribute("autoCode");%>
    <%session.removeAttribute("autoCode");%> --%>
   return obj.src;
}  

</script>		
		  <div class="sn-breadcrumb-area bg-breadcrumb-1 section-padding-sm" data-white-overlay="7">
            <div class="container">
				<div class="sf-breadcrumb">
					<ul>
						<li><a href="index.do">首页</a></li>
						<li>登录</li>
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
                                    <a class="nav-link active" id="account-details-tab" data-toggle="tab" href="#account-details" role="tab" aria-controls="account-details" aria-selected="true">登录</a>
                                </li>
                              
                            </ul>
                        </div>

                        <div class="col-lg-12">
                            <div class="tab-content myaccount-tab-content" id="account-page-tab-content">
                                <div class="tab-pane fade show active" id="account-details" role="tabpanel" aria-labelledby="account-details-tab">
                                    <div class="myaccount-details">
                                    
                                    <form class="sf-form" action="login.do"   method="post"   >
                                            <div class="sf-form-inner">
												<div class="single-input single-input-half">
													<label for="account-details-firstname">用户名*</label>
													<input type="text" name="uname" id="username" required="required"  >
													<span id='checku' class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
													
												</div>
												<div class="single-input single-input-half">
													<label for="account-details-email">密码*</label>
													<input name="pwd" id="txtPwd" type="password" placeholder="密码" required="required" >
													<span id='prompt_pwd'  class="spanInit" ></span>
												</div>
												<div class="single-input single-input-half">
													
												</div>
												 <div class="single-input single-input-half">
												 <label for="account-details-email">验证码：</label>
                									<input type="text" class="input input-big" name="imgCode" id="imgCode" placeholder="验证码(忽略大小写)" style="width:180px;" required="required"  onblur="checkCode11()"/>
               											 <div class="Codes_region" style="  width: 79px; height: 38px; margin-top: -40px;margin-left: 200px;">
														<img id="img" src="admin/autoCode.img"  width="100%" height="38px" name="randImage"  onclick="changeValidateCode(this)"/>
			  									 </div>
			  									 <div class="single-input single-input-half" id="checkcode22" style="color:#f00;"></div> 
               									</div>
               									<div class="single-input single-input-half">
												</div>
               									<div class="single-input single-input-half" style="color:#f00;">
													${sessionScope.suc }
												</div>
           									 
												
												<div class="single-input">
													<button class="sf-button sf-button-dark" type="submit" onclick="return checkAll()"><span>登录</span></button>
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
			 
			 
		