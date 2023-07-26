<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyGoods.jsp' starting page</title>
    
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
	<h1>修改商品信息</h1>
	<hr>
  <%
  if(session.getAttribute("info") != null){
  	out.println(session.getAttribute("info"));
  	session.setAttribute("info", null);
  } 
  DB db = new DB();
  String sql = "select * from goods where cid = '" + request.getParameter("cid") + "'";
  ResultSet rs = db.executeQuery(sql); // 因为指针是位于第一条记录上方，所以指针先往下走一条
  if(rs.next()){
  %>
	<form method="post"  name="form1" action="ModifyGoods?cid=<%=request.getParameter("cid") %>" enctype="multipart/form-data">
	      <table border="0" align="center">
	        <tr>
	          <td height="40">商品编号：</td>
	          <td> <input name="cid" type="text" class="cbox1" id="cid" value=<%=rs.getString(1) %>></td>
	        </tr>
	      	<tr>
	          <td height="40">商品名称：</td>
	          <td> <input name="cname" type="text" class="cbox1" id="cname" value=<%=rs.getString(2) %>></td>
	        </tr>
	        <tr>
	          <td height="40">商品价格：</td>
	          <td> <input name="cprice" type="text" class="cbox1" id="cprice" value=<%=rs.getString(3) %>></td>
	        </tr>
	        <tr>
	          <td height="40">商品数量：</td>
	          <td> <input name="cnumber" type="text" class="cbox1" id="cnumber" value=<%=rs.getString(4) %>></td>
	        </tr>
	        <tr>
	          <td height="40">商品介绍：</td>
	          <td> <input name="cintro" type="text" class="cbox1" id="cintro" value=<%=rs.getString(5) %>></td>
	        </tr>
	<tr>  <td>商品图片：</td>
	          <td> <input name="cimage" type="file" id="cimage" value=<%=rs.getString(6) %>>   </td>
	        </tr>
	        <tr>  <td colspan="2" align="center">
	            <input type="submit" name="Submit" value="提交">
	            <input type="reset" name="Submit2" value="重置">
	            <input type="button" name="Submit3" value="返回" onclick="javascript:window.location.href='c_manager.jsp';">  </td> </tr>
	      </table>
	</form><br><br>
  	<%}%> 
  </body>
</html>
