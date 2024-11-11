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
   <style>
     
 .layui-form-pane .layui-form-checkbox {
    margin: 12px 0 4px 10px!important;
}
    </style>  
</head>
<script charset="utf-8" src="/tongchengweixiu/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="/tongchengweixiu/kindeditor/lang/zh-CN.js"></script>
<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/tongchengweixiu/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/tongchengweixiu/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
<body>
    <div class="wangid_conbox">
        <!-- 当前位置 -->
        <div class="zy_weizhi bord_b">
            <i class="fa fa-home fa-3x"></i>
            <a>首页</a>
            <a>商品管理</a>
            <span>商品修改</span>
        </div>
        <!-- 内容 -->    
        <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="updateGoods.do" method="post" enctype="multipart/form-data" > 
            <ul> 
                <li>
                    <div class="left">商品名：</div>
                    <div class="right"> 
                        <input type="text" name="name" required="required" value="${goods.name }" placeholder="请输入商品名" autocomplete="off" class="layui-input">
                    	<input type="hidden" name="id" value="${goods.id }">
                    </div>
                </li>
                <li>
                    <div class="left">图片：</div>
                    <div class="right">
                    <img alt="" src="../upload/${goods.img }" width="50px" height="50px;">
                            <input style="margin-top: 8px;" type="file" name="file" >
                    </div>
                </li>
                 <!-- <li>
                    <div class="left">视频：</div>
                    <div class="right">
                            <input style="margin-top: 8px;" type="file" name="file2">
                    </div>
                </li> -->
                
                <li>
                    <div class="left">价格：</div>
                    <div class="right"> 
                        <input type="number" min="0"  name="price" value="${goods.price }"   placeholder="请输入总价格" autocomplete="off" class="layui-input">
                    </div>
                </li>
               
                 <li style="height: 38px; overflow:initial;">
                    <div class="left">商品类型：</div>
                    <div class="right"> 
                        <select name="fid" >
                        	<c:forEach items="${tlist }" var="t">
                        	<c:if test="${t.id==goods.fid }">
                        	<option value="${t.id }">${t.name }</option>
                        	</c:if>
                        	</c:forEach>
                        	<c:forEach items="${tlist }" var="t">
                        	<c:if test="${t.id!=goods.fid }">
                        	<option value="${t.id }">${t.name }</option>
                        	</c:if>
                        	</c:forEach>
                        </select> 
                    </div>
                </li>
                 <li>
                    <div class="left">介绍：</div>
                    <div class="right"> 
                     	<textarea name="note" id="editor_id" style="width:100%;height:400px;"  placeholder="请输入说明" class="layui-textarea">${goods.note }</textarea>
                    </div>
                </li>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                        <button class="button_qr" type="submit">确定修改</button>
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

