<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ����</title>
    
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
  <h1>��Ʒ����</h1>
  <hr>
	<form action="AddGoodsServlet" method="post"  name="form1" enctype="multipart/form-data">
	      <table border="0" align="center">
	        <tr>
	          <td height="40">��Ʒ��ţ�</td>
	          <td> <input name="cid" type="text" class="cbox1" id="cid"></td>
	        </tr>
	      	<tr>
	          <td height="40">��Ʒ���ƣ�</td>
	          <td> <input name="cname" type="text" class="cbox1" id="cname"></td>
	        </tr>
	        <tr>
	          <td height="40">��Ʒ�۸�</td>
	          <td> <input name="cprice" type="text" class="cbox1" id="cprice"></td>
	        </tr>
	        <tr>
	          <td height="40">��Ʒ������</td>
	          <td> <input name="cnumber" type="text" class="cbox1" id="cnumber"></td>
	        </tr>
	        <tr>
	          <td height="40">��Ʒ���ܣ�</td>
	          <td> <input name="cintro" type="text" class="cbox1" id="cintro"></td>
	        </tr>
	<tr>  <td>��ƷͼƬ��</td>
	          <td> <input name="cimage" type="file" id="cimage">   </td>
	        </tr>
	        <tr>  <td colspan="2" align="center">
	            <input type="submit" name="Submit" value="�ύ">
	            <input type="reset" name="Submit2" value="����">
	            <input type="button" name="Submit3" value="����" onclick="javascript:window.location.href='c_manager.jsp';">  </td> </tr>
	      </table>
	</form><br><br>
  	<%
	  if(request.getAttribute("info") != null){
	  	out.println(request.getAttribute("info"));
	  	request.setAttribute("info", null);}
 	%> 
  </body>
</html>
