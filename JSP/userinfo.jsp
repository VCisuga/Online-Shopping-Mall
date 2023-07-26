<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript">
	alert(session.getAttribute("mseeage"));
	form.userid.focus();
</script>


<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
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
    </style>
  <body>
  <%
  if(session.getAttribute("username") != null){ // 当用户登录成功
  	DB db = new DB();
  	String sql = "select * from user";
  	ResultSet rs = db.executeQuery(sql);// 调用DB类的查询数据库函数
  %> 
  <h1>欢迎您！<%=session.getAttribute("username") %></h1>
  <hr>
  <a href = "http://localhost:8080/ch09/modifyUser.jsp?id=<%=session.getAttribute("id") %>">个人信息修改</a><br>
  <c:if test="${identity == 0}">
  <a href = "http://localhost:8080/ch09/cart.jsp">我的购物车</a><br>
  <a href = "http://localhost:8080/ch09/showmyorder.jsp">我的订单</a><br>
  <a href = "http://localhost:8080/ch09/GetAllGoodsServlet?pageNo=1">显示商品</a><br>
  </c:if>
  <c:if test="${identity == 1}">
  	<a href = "http://localhost:8080/ch09/c_manager.jsp">管理入口</a><br>
  </c:if><br>
  <a href = "http://localhost:8080/ch09/index.jsp">返回主页</a><br>
  
  <% 
  }else{
  %>
	<h1>错误提示</h1><hr>
	您还未登录，请<a href = "http://localhost:8080/ch09/index.jsp">返回首页</a>登录
  <% }%>
  </body>
</html>
