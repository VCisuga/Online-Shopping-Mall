<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
    
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
        table{
            text-align:center;
            margin: auto;
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
  	String sql = "select * from orderlist where orderid='" + session.getAttribute("orderid") + "'";
  	ResultSet rs = db.executeQuery(sql);// 调用DB类的查询数据库函数
  %> 
  	<h1 >用户订单显示</h1><hr>
	<form name="form" method="post" action="">
	<table border = 1>
	  <tr>
	    <td>订单号</td>
	    <td>商品号</td>
	    <td>数量</td>
	  </tr>
	  <%
	  int i = 1;
	  while(rs.next()){
	  %>
	  <tr>
	  	<td><%=rs.getString(1) %></td>
	  	<td><%=rs.getString(2) %></td>
	  	<td><%=rs.getString(3) %></td>
	  </tr>
	  <% i++;}%>
	</table>
	</form> 
	<a href = "userinfo.jsp">返回</a>
  <% 
  }else{
  %>
	<h1 >错误提示</h1><hr>
	您还未登录，请<a href = "index.jsp">返回首页</a>登录
  <% }%>
  </body>
</html>
