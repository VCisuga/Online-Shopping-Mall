<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商城</title>
    
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
  <h1 >用户订单显示</h1><hr>
  <%
  if(session.getAttribute("username") != null){ // 当用户登录成功
  	DB db = new DB();
  	String sql = "select * from ordertable where username='" + session.getAttribute("username") + "'";
  	ResultSet rs = db.executeQuery(sql);// 调用DB类的查询数据库函数
  %> 
	<form name="form" method="post" action="">
	<table border = 1>
	  <tr>
	    <td>订单号</td>
	    <td>订单时间</td>
	    <td>收货人</td>
	    <td>地址</td>
	    <td>电话</td>
	    <td>订单状态</td>
	    <td>付款方式</td>
	    <td>操作</td>
	  </tr>
	  <%
	  int i = 1;
	  while(rs.next()){
	  %>
	  <tr>
	  	<% String orderURL = "GetOrderList?orderid=" + rs.getString(1);%>
	  	<% String modifyURL = "modifyOrder.jsp?orderid=" + rs.getString(1);%>
	  	<% String deleteURL = "deleteOrder.jsp?orderid=" + rs.getString(1);%>
	  	<td><a href = <%=orderURL %>><%=rs.getString(1) %></a></td>
	  	<td><%=rs.getString(3) %></td>
	  	<td><%=rs.getString(6) %></td>
	  	<td><%=rs.getString(5) %></td>
	  	<td><%=rs.getString(7) %></td>
	  	<td><%=rs.getString(4) %></td>
	  	<td><%=rs.getString(9) %></td>
	  	<td><a href = <%=modifyURL %>>修改信息 </a><a href = <%=deleteURL %>>删除 </a></td>
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
