<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û�ɾ��</title>
    
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
  String sql = "select * from user where id = " + request.getParameter("id");
  ResultSet rs = db.executeQuery(sql); // ��Ϊָ����λ�ڵ�һ����¼�Ϸ�������ָ����������һ��
  if(rs.next()){
  	  String sql2 = "delete from user where id = " + request.getParameter("id");
	  boolean i=db.executeUpdate(sql2);
	  if(i){
		  session.setAttribute("message", "ɾ���ɹ���");
	  }else{
		  session.setAttribute("message", "ɾ��ʧ�ܣ�");
	  }
  }
  response.sendRedirect("showUser.jsp");
  %>
  </body>
</html>
