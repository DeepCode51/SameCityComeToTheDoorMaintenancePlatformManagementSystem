<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit"/>
    <meta name="force-rendering" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>同城上门维修平台</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script src="js/userAdd.js"></script>
   <style>
     
 .layui-form-pane .layui-form-checkbox {
    margin: 12px 0 4px 10px!important;
}
    </style>  
</head>

<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>用户管理</a>
            <span>用户添加</span>
        </div>
        <!-- 内容 -->    
        <div class="wenxts_ke">
            <p><i>温馨提示：</i>请认真核对用户信息正确无误后再确定添加，并上传用户的对应图片</p>
        </div>
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="addUser.do" method="post" enctype="multipart/form-data" > 
            <ul> 
                <li>
                    <div class="left">用户名：</div>
                    <div class="right"> 
                        <input type="text" name="uname" id="username"  onblur="return checkuname()" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
          				<div id='checku' class="tips"></div>   
                    </div>
                </li>
                <li>
                    <div class="left">图片：</div>
                    <div class="right">
                            <input style="margin-top: 8px;" type="file" name="file" required="required">
                    </div>
                </li>
                <li>
                    <div class="left">密码：</div>
                    <div class="right"> 
                        <input type="password" id="txtPwd" onblur="return checkpwd()" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    	 <div id='prompt_pwd'  class="tips"></div>
                    </div>
                </li>
                <li>
                    <div class="left">确认密码：</div>
                    <div class="right"> 
                        <input type="password"  name="pwd"   id="txtConfirmPwd" onblur="return checkpwdc()" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    	 <div id='prompt_confirmpwd'  class="tips"></div>
                    </div>
                </li>
                <li>
                    <div class="left">姓名：</div>
                    
                    <div class="right"> 
                        <input type="text" name="tname" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">年龄：</div>
                    <div class="right"> 
                        <input type="text" name="age" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left">性别：</div>
                    <div class="right">
                            <input type="radio" name="sex" value="男" title="男" checked>
                            <input type="radio" name="sex" value="女" title="女" >
                    </div>
                </li>
                <li>
                    <div class="left">手机号：</div>
                    <div class="right"> 
                        <input type="text" id="txtPhone" name="tel" onblur="return checktel()"required lay-verify="required" placeholder="请输入手机" autocomplete="off" class="layui-input">
                    	<div  id='prompt_phone' class="tips"></div>
                    </div>
                </li>
                <li style="height: 38px; overflow:initial;">
                    <div class="left">角色：</div>
                    <div class="right"> 
                        <select name="utype" lay-verify="">
                            <option value="用户">用户</option>
                            <option value="员工">员工</option>
                            <option value="管理员">管理员</option>
                        </select> 
                    </div>
                </li>
                <li>
                    <div class="left">地址：</div>
                    <div class="right">
                            <input type="text" name="address" required lay-verify="required" placeholder="请填写地址" autocomplete="off" class="layui-input">
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button class="button_qr">确定添加</button>
                    </div>
                </li>
            </ul> 
            </form>
        </div>
    </div>   
   
	<!-- houl --> 
	<!-- 结束 -->
    <!-- layui js -->
    <script src="layui/layui.js"></script>
    
</body>
<script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
        });
        </script>
</html>

