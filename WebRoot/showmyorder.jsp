<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�̳�</title>
    
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
  <h1 >�û�������ʾ</h1><hr>
  <%
  if(session.getAttribute("username") != null){ // ���û���¼�ɹ�
  	DB db = new DB();
  	String sql = "select * from ordertable where username='" + session.getAttribute("username") + "'";
  	ResultSet rs = db.executeQuery(sql);// ����DB��Ĳ�ѯ���ݿ⺯��
  %> 
	<form name="form" method="post" action="">
	<table border = 1>
	  <tr>
	    <td>������</td>
	    <td>����ʱ��</td>
	    <td>�ջ���</td>
	    <td>��ַ</td>
	    <td>�绰</td>
	    <td>����״̬</td>
	    <td>���ʽ</td>
	    <td>����</td>
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
	  	<td><a href = <%=modifyURL %>>�޸���Ϣ </a><a href = <%=deleteURL %>>ɾ�� </a></td>
	  </tr>
	  <% i++;}%>
	</table>
	</form> 
	<a href = "userinfo.jsp">����</a>
  <% 
  }else{
  %>
	<h1 >������ʾ</h1><hr>
	����δ��¼����<a href = "index.jsp">������ҳ</a>��¼
  <% }%>
  </body>
</html>
