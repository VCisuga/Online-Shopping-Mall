<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�н��</title>
    
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
  <h1>����</h1><hr>
    <% 
    	// ϵͳ���ɵ�����0-10
	    int i = (int)(Math.random()*10);
	    String var2 = String.valueOf(i);
	    // �µ�����
	    String var1 = request.getParameter("var1");
	    session.setAttribute("var2", var2);
	    String x = (String)session.getAttribute("var2");
	    if(x.equals(var1)){ 
	    	out.println("��ϲ������" + x + "���¶��ˣ������һ��'G004'��Ʒ�һ�ȯ");
	%>
	    <a href = "GetAllGoodsServlet?pageNo=1">ȥʹ��</a>
	<%	
		}else
			out.println("�ܱ�Ǹ�����´��ˣ���ȷ����" + x + "��");
     %>
     <p><a href = "guessNum.jsp">����һ��</a></p>
  </body>
</html>
