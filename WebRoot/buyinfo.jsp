<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>֧������</title>
    
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
  <h1>֧������</h1>
  <hr>
 <form name="form" method="post" action="BuyServlet">
  <table width="400" border="2" align="center">
    <tr>
      <td>�ջ��ˣ�</td>
      <td><input name="receivename" type="text" class="ipt-t" id="receivename" /></td>
    </tr>
    <tr>
      <td>��ϵ�绰��</td>
      <td><input name="tele" type="text" class="ipt-t" id="tele" /></td>
    </tr>
    <tr>
      <td>�ջ���ַ��</td>
      <td>
        <input name="address" type="text" class="ipt-t" id="address" />
   </td>
    </tr>
    <tr>
      <td>�ʱࣺ</td>
      <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" /></td>
    </tr>
      <td>���ʽ��</td>
      <td><label>
        <select name="paymode" id="paymode" multiple>
          <option value="֧����" selected>֧����</option>
          <option value="΢��">΢��</option>
          <option value="����">����</option>
          <option value="�̳�Ǯ��">�̳�Ǯ��</option>
          <option value="�й�����">�й�����</option>
          <option value="���·���">���·���</option>
          <option value="��������">��������</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="�ύ" />
        <input name="reset" type="reset" id="reset" value="����" />
      </label></td>
      </tr>
  </table>
  </form>
  <a href = "userinfo.jsp">����</a>
  </body>
</html>
