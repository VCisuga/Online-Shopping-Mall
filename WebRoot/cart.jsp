<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���ﳵ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript">
	function init(){
		alert("${info}");
	}
	<c:if test="${!empty info}">
		window.onload=init;
	</c:if>	
	</script>
	
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
  <h1>���ﳵ�е���Ϣ</h1>
  <hr>
  <c:if test="${!empty cart}">
  <div id="back"><a href="clearcart.jsp">��չ��ﳵ</a>  <a href="GetAllGoodsServlet?pageNo=1">��������</a>  <a href="buyinfo.jsp">�������</a></div>
	  <table border="1">
	  	<tr><th>��Ʒ���</th><th>��Ʒ����</th><th>��Ʒ�۸�</th><th>����</th><th>����</th></tr>
	  	<c:forEach items="${cart}" var="item">
	  	<form action="ProcessCart">
	  	<input type="hidden" name="cid" value="${item.goods.cid }" />
		  <tr>
			  <td>${item.goods.cid}</td>
			  <td>${item.goods.cname}</td>
			  <td>${item.goods.cprice}</td>
			  <td><input name="quantity" type="text" value="${item.quantity}" size="5" /></td>
			  <td><input type="submit" name="action" value="�޸�" />
			      <input type="submit" name="action" value="ɾ��" /></td>	 
		  </tr>	 
		 </form> 
		 <c:set var="msum" value="${msum+item.goods.cprice*item.quantity}" />
	  	</c:forEach>  
	  </table>
	  <c:out value="�ܽ�${msum}"/>
  </c:if>
  <c:if test="${empty cart}">
  	<div id="back"><a href="GetAllGoodsServlet?pageNo=1">����δѡ���κβ�Ʒ�������˴�ѡ��</a></div>
  
  </c:if>
   <div id="back"><a href="userinfo.jsp">����</a></div>
  </body>
</html>
