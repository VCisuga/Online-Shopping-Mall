<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理入口</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
    *{
        margin: 0;
        padding: 0;
    }  
    h1{
        text-align:center;
        margin-top: 50px;
        color:#607d8b;
    }
    hr{border: 3px solid white; width:100%}
    body{
        background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
        background-size: 100% 100%;
        text-align:center;
        font-size: 18px;
    }
    #box{
    	margin : auto;
    }
    #box1{
    	top: 160px;
        right: 23%;
    	width: 350px;
	    height: 350px;
	    float: left;
	    margin: 20px;
	    background: linear-gradient(#8CC1DE, rgba(136, 84, 185, 0.404));
	    position : fixed;
	    
	}

    #box2{
    	top: 160px;
        left: 23%;
    	width: 350px;
	    height: 350px;
	    float: left;
	    margin: 20px;
	    background: linear-gradient(#8CC1DE, rgba(136, 84, 185, 0.404));
	    position : fixed;
	}
	#box3{
		top: 530px;
        left: 70%;
		position : fixed;
	}
    </style>
  <body>
  <h1>管理入口</h1>
  <hr>
  <div id=box>
  <div id="box1">
  	<a href = "http://localhost:8080/ch09/showUser.jsp">用户管理</a><br>
  	<a href = "http://localhost:8080/ch09/showorder.jsp">订单发货</a>
  </div>
  <div id="box2">
	  <a href = "http://localhost:8080/ch09/c_add.jsp">商品添加</a><br>
	  <a href = "http://localhost:8080/ch09/showGoods.jsp">商品管理</a>
  </div><br>
  <a href = "http://localhost:8080/ch09/index.jsp" id="box3">返回主页</a><br>
  </div>
    <%
	  if(request.getAttribute("info") != null){
	  	out.println(request.getAttribute("info"));
	  	request.setAttribute("info", null);}
 	%>
  </body>
</html>
