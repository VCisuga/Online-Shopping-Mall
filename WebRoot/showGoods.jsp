<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ����</title>
    
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
  <h1>��Ʒ����</h1>
  <hr>
  	<%
	if(session.getAttribute("username") != null){ // ���û���¼�ɹ�
	  DB db = new DB();
	  String sql = "select * from goods";
	  ResultSet rs = db.executeQuery(sql);// ����DB��Ĳ�ѯ���ݿ⺯��
  	%> 
	<table border="1">
	  <tr><th>��Ʒ���</th><th>��Ʒ����</th><th>��Ʒ�۸�</th><th>ͼƬ</th><th>����</th></tr>
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
	     <td><a href="<%=deleteurl%>">ɾ�� </a><a href="<%=modifyurl%>">�޸�</a></td><br>
	  	</tr>
	 <%}%>
	 </table><br>
     <a href = "http://localhost:8080/ch09/c_manager.jsp">����</a><br>
     <%
     if(session.getAttribute("message") != null){
	  	out.println(session.getAttribute("message"));
  		session.setAttribute("message", null);}
  	 if(session.getAttribute("info") != null){
	  	out.println(session.getAttribute("info"));
	  	session.setAttribute("info", null);} 
	 %>
 <% }else{%>
	<h1 >������ʾ</h1><hr>
	����δ��¼����<a href = "http://localhost:8080/ch09/index.jsp">������ҳ</a>��¼
<%}%>
	
  </body>
</html>
