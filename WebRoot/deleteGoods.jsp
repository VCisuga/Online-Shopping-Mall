<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ɾ����Ʒ</title>
    
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
  String sql = "select * from goods where cid = '" + request.getParameter("cid") + "'";
  ResultSet rs = db.executeQuery(sql); // ��Ϊָ����λ�ڵ�һ����¼�Ϸ�������ָ����������һ��
  if(rs.next()){
  	  String sql2 = "delete from goods where cid = '" + request.getParameter("cid") + "'";
	  boolean i=db.executeUpdate(sql2);
	  if(i){
		  session.setAttribute("info", "ɾ���ɹ���");
	  }else{
		  session.setAttribute("info", "ɾ��ʧ�ܣ�");
	  }
  }
  response.sendRedirect("showGoods.jsp");
  %>
  </body>
</html>
