<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品管理</title>
    
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
       table{
            text-align:center;
            margin: auto;
        }
       body{
            background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
            background-size: 100% 100%;
            text-align:center;
            font-size: 18px;
        }
    </style>
  <body>
  <h1>商品管理</h1>
  <hr>
  	<%
	if(session.getAttribute("username") != null){ // 当用户登录成功
	  DB db = new DB();
	  String sql = "select * from goods";
	  ResultSet rs = db.executeQuery(sql);// 调用DB类的查询数据库函数
  	%> 
	<table border="1">
	  <tr><th>物品编号</th><th>物品名称</th><th>物品价格</th><th>图片</th><th>操作</th></tr>
	<% 
	  while(rs.next()){
		String modifyurl="modifyGoods.jsp?cid="+rs.getString(1);
		String deleteurl="deleteGoods.jsp?cid="+rs.getString(1);
	 %>
	  	<tr>
	     <td><%=rs.getString(1)%></td>
	     <td><%=rs.getString(2)%></td>
	     <td><%=rs.getString(3)%></td>
	     <td><img src="<%=rs.getString(6)%>" /></td>
	     <td><a href="<%=deleteurl%>">删除 </a><a href="<%=modifyurl%>">修改</a></td><br>
	  	</tr>
	 <%}%>
	 </table><br>
     <a href = "http://localhost:8080/ch09/c_manager.jsp">返回</a><br>
     <%
     if(session.getAttribute("message") != null){
	  	out.println(session.getAttribute("message"));
  		session.setAttribute("message", null);}
  	 if(session.getAttribute("info") != null){
	  	out.println(session.getAttribute("info"));
	  	session.setAttribute("info", null);} 
	 %>
 <% }else{%>
	<h1 >错误提示</h1><hr>
	您还未登录，请<a href = "http://localhost:8080/ch09/index.jsp">返回首页</a>登录
<%}%>
	
  </body>
</html>
