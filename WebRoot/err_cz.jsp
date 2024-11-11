<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="top.jsp"></jsp:include>
    <div class="" align="center">
    
    <h1>对不起！操作失败</h1>
    
    <div class="reindex"><a href="index" target="_parent">返回</a></div>
    
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
