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
    <meta name="description" content="名榜,wangid">
    <title>视线在线投票系统</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/children.css">

    <!-- 在线图标库 地址：http://fontawesome.dashgame.com/-->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- layui css -->
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script src="js/echarts.min.js"></script>
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
            <a>营销助手管理</a>
            <span>营销助手结果的统计</span>
        </div>
        <!-- 内容 -->    
       
        <div class="chart-panel panel panel-default">
            <div class="panel-body" id="chart" style="height: 376px;">
            </div>
        </div>
         <div class="kehubh_tj_k">
            <form class="layui-form layui-form-pane" action="addType.do" method="post" enctype="multipart/form-data" > 
            <ul>
            <li>
                    <div class="left">序号：</div>
                    <div class="right"> 
                        <input type="text" name="name"  value="名称  /销量" readonly="readonly" autocomplete="off" class="layui-input">
          				<div class="tips" id="checku"></div>
                    </div>
                </li>
             <c:forEach items="${list}" var="t">
                <li>
                    <div class="left">${t.id }：</div>
                    <div class="right"> 
                        <input type="text" name="name"  value="${t.name } /销量：${t.xnum}" readonly="readonly" autocomplete="off" class="layui-input">
          				<div class="tips" id="checku"></div>
                    </div>
                </li>
                </c:forEach>
                <li>
                    <div class="left"> &nbsp;</div>
                    <div class="right"> 
                       <!--  <button class="button_qr">确定添加</button> -->
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
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
    // 直接页面写的调用ajax的方法
    function callbackFn(myChart, jsonURL) {
        $.ajax({
            url: jsonURL,
            dataType: "json",
            success: function (jsonData) {

                myChart.setOption({
                    xAxis: {
                        data: jsonData.sj
                    },
                    series: [{
                        // 根据名字对应到相应的系列
                        name: '销量',
                        data: jsonData.hp
                    },

                    ]
                });
                // 设置加载等待隐藏
                myChart.hideLoading();
            }
        });
    }

    // 初始化echar报表的方法
    function initReport(myChart) {

        // 显示标题，图例和空的坐标轴
        myChart.setOption({
            title: {
                text: '商品销量的统计'
            },
            tooltip: {},
            legend: {
                data: ['销量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                //type: 'line', //折线
                data: []
            }

            ]
        });
    }

    function createTestReport(showDivId, jsonURL) {
        var myChart = echarts.init(document.getElementById(showDivId));
        // 初始化report对象
        initReport(myChart);
        myChart.showLoading({text: '正在努力的读取数据中...'});
        // 调用后台获取json数据
        callbackFn(myChart, jsonURL);
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var showDivId = 'chart';
        var jsonURL = "tj2.do";
        createTestReport(showDivId, jsonURL);
    });
</script>

<script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
        });
        </script>
</html>

