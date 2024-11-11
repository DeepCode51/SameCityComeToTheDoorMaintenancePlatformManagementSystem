<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html lang="zh-CN">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>后台--同城上门维修平台</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" /> 
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
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
 	  url:"checkCode.do",
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
    obj.src = "autoCode.img?d=" + timenow;
<%--      <%
    String img=(String)session.getAttribute("autoCode");%>
    <%session.removeAttribute("autoCode");%> --%>
   return obj.src;
}  

</script>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form" action="alogin.do" method="post">
					<span class="login100-form-title p-b-49">登录</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
						<span class="label-input100">用户名</span>
						<input class="input100" type="text" name="uname" placeholder="请输入用户名" autocomplete="off">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="请输入密码">
						
						<input class="input100" type="password" name="pwd" placeholder="请输入密码">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="wrap-input100 validate-input" >
						<span class="label-input100">角色</span>
						<select name="utype" class="input100">
						<option value="管理员">管理员</option>
						<option value="员工">员工</option>
						</select>
						<!-- <input class="input100" type="radio" name="utype" value="管理员" checked="checked">管理员
						<input class="input100" type="radio" name="utype" value="普通用户">普通用户 -->
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					 <div class="wrap-input100 validate-input" >
					 <span class="label-input100">验证码:</span>
								   <input type="text" class="input100" name="imgCode" id="imgCode" style="width: 48%;display: inline-block;" placeholder="验证码(忽略大小写)" required="required" onblur="checkCode11()"/>
								    <img id="img" src="autoCode.img"  style=" width: 30%; display: inline-block;" height="38px" name="randImage"  onclick="changeValidateCode(this)"/>
						</div> 
						<div id="checkcode22" style="color:#f00;"></div>

					<div class=" p-t-8 p-b-31">
						<a href="javascript:" style="color:#f00;    font-size: 20px;">${sessionScope.info }</a>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">登 录</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
