<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
	<h1>修改个人信息</h1>
	<hr>
  <%
  DB db = new DB();
  String sql = "select * from user where id = " + request.getParameter("id");
  ResultSet rs = db.executeQuery(sql); // 因为指针是位于第一条记录上方，所以指针先往下走一条
  if(rs.next()){
  %>
   <form name="form" method="post" action="ModifyServlet?id=<%=request.getParameter("id") %>">
   <table width="300" border="0" align="center">
    <tr>
      <td>用户名：</td>
      <td><input name="username" type="text" class="ipt-t" value=<%=rs.getString(2) %> id="username" /></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input name="userpass" type="password" class="ipt-t" value=<%=rs.getString(3) %> id="userpass" /></td>
    </tr>
    <tr>
      <td>重复密码：</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" value=<%=rs.getString(3) %> id="reuserpass" />
   </td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><label>
      <input type="radio" name="gender" value="男" id="gender" <%if(rs.getString(4).equals("男")) out.print("checked");%>/>男</label>
        <label>
        <input type="radio" name="gender" value="女" id="gender" <%if(rs.getString(4).equals("女")) out.print("checked");%>/>女</label></td>
    </tr>
    
    <tr><td valign="top">出生日期：<br /></td>
    <td valign="top"><input type="text" name="birthdate" value=<%=rs.getString(5) %> class="ipt-t" /></td></tr>
    <tr>
      <td>籍贯：</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="福建" <%if(rs.getString(6).equals("福建")) out.print("selected");%>>福建</option>
          <option value="江苏" <%if(rs.getString(6).equals("江苏")) out.print("selected");%>>江苏</option>
          <option value="山东" <%if(rs.getString(6).equals("山东")) out.print("selected");%>>山东</option>
          <option value="北京" <%if(rs.getString(6).equals("北京")) out.print("selected");%>>北京</option>
          <option value="上海" <%if(rs.getString(6).equals("上海")) out.print("selected");%>>上海</option>
          <option value="浙江" <%if(rs.getString(6).equals("浙江")) out.print("selected");%>>浙江</option>
          <option value="天津" <%if(rs.getString(6).equals("天津")) out.print("selected");%>>天津</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="提交" />
        <input name="reset" type="reset" id="reset" value="重置" />
        <input type="button" name="Submit3" value="返回" onclick="javascript:window.location.href='userinfo.jsp';">
      </label></td>
      </tr>
  </table>
  </form>
  <%} %>
  </body>
</html>
