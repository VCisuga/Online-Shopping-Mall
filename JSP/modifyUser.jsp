<%@ page language="java" import="java.util.*,java.sql.*,Bean.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�û�����</title>
    
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
	<h1>�޸ĸ�����Ϣ</h1>
	<hr>
  <%
  DB db = new DB();
  String sql = "select * from user where id = " + request.getParameter("id");
  ResultSet rs = db.executeQuery(sql); // ��Ϊָ����λ�ڵ�һ����¼�Ϸ�������ָ����������һ��
  if(rs.next()){
  %>
   <form name="form" method="post" action="ModifyServlet?id=<%=request.getParameter("id") %>">
   <table width="300" border="0" align="center">
    <tr>
      <td>�û�����</td>
      <td><input name="username" type="text" class="ipt-t" value=<%=rs.getString(2) %> id="username" /></td>
    </tr>
    <tr>
      <td>���룺</td>
      <td><input name="userpass" type="password" class="ipt-t" value=<%=rs.getString(3) %> id="userpass" /></td>
    </tr>
    <tr>
      <td>�ظ����룺</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" value=<%=rs.getString(3) %> id="reuserpass" />
   </td>
    </tr>
    <tr>
      <td>�Ա�</td>
      <td><label>
      <input type="radio" name="gender" value="��" id="gender" <%if(rs.getString(4).equals("��")) out.print("checked");%>/>��</label>
        <label>
        <input type="radio" name="gender" value="Ů" id="gender" <%if(rs.getString(4).equals("Ů")) out.print("checked");%>/>Ů</label></td>
    </tr>
    
    <tr><td valign="top">�������ڣ�<br /></td>
    <td valign="top"><input type="text" name="birthdate" value=<%=rs.getString(5) %> class="ipt-t" /></td></tr>
    <tr>
      <td>���᣺</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="����" <%if(rs.getString(6).equals("����")) out.print("selected");%>>����</option>
          <option value="����" <%if(rs.getString(6).equals("����")) out.print("selected");%>>����</option>
          <option value="ɽ��" <%if(rs.getString(6).equals("ɽ��")) out.print("selected");%>>ɽ��</option>
          <option value="����" <%if(rs.getString(6).equals("����")) out.print("selected");%>>����</option>
          <option value="�Ϻ�" <%if(rs.getString(6).equals("�Ϻ�")) out.print("selected");%>>�Ϻ�</option>
          <option value="�㽭" <%if(rs.getString(6).equals("�㽭")) out.print("selected");%>>�㽭</option>
          <option value="���" <%if(rs.getString(6).equals("���")) out.print("selected");%>>���</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="�ύ" />
        <input name="reset" type="reset" id="reset" value="����" />
        <input type="button" name="Submit3" value="����" onclick="javascript:window.location.href='userinfo.jsp';">
      </label></td>
      </tr>
  </table>
  </form>
  <%} %>
  </body>
</html>
