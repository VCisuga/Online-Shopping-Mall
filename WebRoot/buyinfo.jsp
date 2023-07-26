<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>支付界面</title>
    
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
  <h1>支付界面</h1>
  <hr>
 <form name="form" method="post" action="BuyServlet">
  <table width="400" border="2" align="center">
    <tr>
      <td>收货人：</td>
      <td><input name="receivename" type="text" class="ipt-t" id="receivename" /></td>
    </tr>
    <tr>
      <td>联系电话：</td>
      <td><input name="tele" type="text" class="ipt-t" id="tele" /></td>
    </tr>
    <tr>
      <td>收货地址：</td>
      <td>
        <input name="address" type="text" class="ipt-t" id="address" />
   </td>
    </tr>
    <tr>
      <td>邮编：</td>
      <td><input name="zipcode" type="text" class="ipt-t" id="zipcode" /></td>
    </tr>
      <td>付款方式：</td>
      <td><label>
        <select name="paymode" id="paymode" multiple>
          <option value="支付宝" selected>支付宝</option>
          <option value="微信">微信</option>
          <option value="花呗">花呗</option>
          <option value="商城钱包">商城钱包</option>
          <option value="中国银行">中国银行</option>
          <option value="花呗分期">花呗分期</option>
          <option value="建设银行">建设银行</option>
        </select>
      </label></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><label>
        <input name="submit" type="submit" id="submit" value="提交" />
        <input name="reset" type="reset" id="reset" value="重置" />
      </label></td>
      </tr>
  </table>
  </form>
  <a href = "userinfo.jsp">返回</a>
  </body>
</html>
