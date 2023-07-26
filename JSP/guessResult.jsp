<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>有奖活动</title>
    
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
  <h1>活动结果</h1><hr>
    <% 
    	// 系统生成的数字0-10
	    int i = (int)(Math.random()*10);
	    String var2 = String.valueOf(i);
	    // 猜的数字
	    String var1 = request.getParameter("var1");
	    session.setAttribute("var2", var2);
	    String x = (String)session.getAttribute("var2");
	    if(x.equals(var1)){ 
	    	out.println("恭喜，答案是" + x + "，猜对了！您获得一张'G004'商品兑换券");
	%>
	    <a href = "GetAllGoodsServlet?pageNo=1">去使用</a>
	<%	
		}else
			out.println("很抱歉，您猜错了，正确答案是" + x + "。");
     %>
     <p><a href = "guessNum.jsp">再来一次</a></p>
  </body>
</html>
