<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������Ʒ</title>
    
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
  <h1>��ʾ��Ʒ��Ϣ</h1>
  <hr/>
  <table border="1">
  <tr><th>��Ʒ���</th><th>��Ʒ����</th><th>��Ʒ�۸�</th><th>ͼƬ</th><th>״̬</th><th>����</th></tr>
  <c:forEach items="${goodslist}" var="g">
	  <tr>
		  <td>${g.cid}</td>
		  <td>${g.cname}</td>
		  <td>${g.cprice}</td>
	 	  <td><img src="${g.cimage}" /></td>
	  <c:if test="${g.cnumber == 0}">
		<td>��治��</td>
		<td>�޷�����</td> 
	  </c:if>
	  <c:if test="${g.cnumber <= 3 and g.cnumber > 0}">
		<td>������</td>
		<td><a href="AddToCart?cid=${g.cid}">��ӵ����ﳵ</a></td> 
	  </c:if>
	  <c:if test="${g.cnumber > 3}">
		<td>������</td>
		<td><a href="AddToCart?cid=${g.cid}">��ӵ����ﳵ</a></td> 
	  </c:if>
	  </tr>
  </c:forEach>  
  </table>
  <div id="back">
  <c:if test="${pageNo==1}">
  	��һҳ ��һҳ
  </c:if>
  <c:if test="${pageNo!=1}">
  	<a href="GetAllGoodsServlet?pageNo=1">��һҳ</a> <a href="GetAllGoodsServlet?pageNo=${pageNo-1}">��һҳ</a>
  </c:if>
  <c:if test="${pageNo==pageCount}">
  	��һҳ ���һҳ
  </c:if>
  <c:if test="${pageNo!=pageCount}">
  	<a href="GetAllGoodsServlet?pageNo=${pageNo+1}">��һҳ</a> <a href="GetAllGoodsServlet?pageNo=${pageCount}">���һҳ</a>
  </c:if>
  <form action="GetAllGoodsServlet">
  	��ת��<input type="text" name="pageNo" />ҳ<input type="submit" value="��ת" />
  </form>
  
 
  <a href="userinfo.jsp">����</a>
  </div>
  </body>
</html>
