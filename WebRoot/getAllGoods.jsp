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
    
    <title>所有商品</title>
    
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
  <h1>显示物品信息</h1>
  <hr/>
  <table border="1">
  <tr><th>物品编号</th><th>物品名称</th><th>物品价格</th><th>图片</th><th>状态</th><th>操作</th></tr>
  <c:forEach items="${goodslist}" var="g">
	  <tr>
		  <td>${g.cid}</td>
		  <td>${g.cname}</td>
		  <td>${g.cprice}</td>
	 	  <td><img src="${g.cimage}" /></td>
	  <c:if test="${g.cnumber == 0}">
		<td>库存不足</td>
		<td>无法购买</td> 
	  </c:if>
	  <c:if test="${g.cnumber <= 3 and g.cnumber > 0}">
		<td>库存紧张</td>
		<td><a href="AddToCart?cid=${g.cid}">添加到购物车</a></td> 
	  </c:if>
	  <c:if test="${g.cnumber > 3}">
		<td>库存充足</td>
		<td><a href="AddToCart?cid=${g.cid}">添加到购物车</a></td> 
	  </c:if>
	  </tr>
  </c:forEach>  
  </table>
  <div id="back">
  <c:if test="${pageNo==1}">
  	第一页 上一页
  </c:if>
  <c:if test="${pageNo!=1}">
  	<a href="GetAllGoodsServlet?pageNo=1">第一页</a> <a href="GetAllGoodsServlet?pageNo=${pageNo-1}">上一页</a>
  </c:if>
  <c:if test="${pageNo==pageCount}">
  	下一页 最后一页
  </c:if>
  <c:if test="${pageNo!=pageCount}">
  	<a href="GetAllGoodsServlet?pageNo=${pageNo+1}">下一页</a> <a href="GetAllGoodsServlet?pageNo=${pageCount}">最后一页</a>
  </c:if>
  <form action="GetAllGoodsServlet">
  	跳转到<input type="text" name="pageNo" />页<input type="submit" value="跳转" />
  </form>
  
 
  <a href="userinfo.jsp">返回</a>
  </div>
  </body>
</html>
