<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����״̬</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  DB db = new DB();
  StringBuffer newsql=new StringBuffer();
  newsql.append("update ordertable set orderstate='");
  newsql.append("�ѷ���");
  newsql.append("'  where orderid=");
  newsql.append(request.getParameter("orderid"));
  db.executeUpdate(newsql.toString());			
  // ��תҳ��
  response.sendRedirect("showorder.jsp");
  %>
  </body>
</html>
