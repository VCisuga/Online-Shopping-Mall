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
  <h1>�����ֻ</h1><hr>
     ��������һ��������һ�������������Ϸ<br>
  <br>
     ����򣺵��Ի��������һ�����֣�����³����������ʲô�����Դ�Сд��<br>
  <br>
  
  <form name="form" action="guessResult.jsp" method="post">
	���������µ����֣�<br><br>
	<input type="text" name="var1"><br> <br>
	<input type="submit" value="�ύ">
	<input type="button" name="Submit3" value="����" onclick="javascript:window.location.href='index.jsp';">
  </body>
</html>
