<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>鲸城</title>
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
       *{
            margin: 0;
            padding: 0;
        }
        h1{
       		top: 440px;
        	left: 22%;
            position : fixed;
            font-size: 50px;
        }
        p{
        	top: 520px;
        	left: 14%;
            position : fixed;
        	color : white;
        	opacity : 0.4;
        }
        body{
            background: linear-gradient(#8CC1DE, rgba(136, 84, 185, 0.404));
            background-size: 100% 100%;
            font-size: 18px;
            color:#607d8b;
        }
        .bbox{
       		top: 100px;
        	right: 18%;
            position : fixed;
        	text-align:center;
            width: 390px;
            height: 500px;
            background: linear-gradient(#e6e9f0, #eef1f5);
            color:#607d8b;
        }
		.logo{
		    top: 120px;
        	left: 15%;
            position : fixed;
        }
        form{
            position: relative;
            top: 10%;
            left: 0%;
            width: 360px;
            height: 400px;
            margin: auto;
        }
        [type="text"],[type="password"]{
            width: 284px;
            height: 45px;
            margin-top: 35px;
            border: 1px solid rgb(164, 125, 172);
        }
        #btn {
		    width: 287px;
		    height: 50px;
		    line-height: 20px;
		    font-size: 18px;
		    text-align: center;
		    padding: 10px;
		    margin-top: 40px;
		    margin: auto;
		    background-image: linear-gradient(to right, #a6c1ee, #fbc2eb);
		    color: #fff;
		    border: 0;
		    cursor: pointer;
            border-radius: 2%;
		    text-align:center;
		}
		ul{
            position: relative;
            left: 63px;
            margin-top: 20px;
        }
        li{
            list-style-type: none;
            display: inline;
            text-align: right;
            font-size: 1px;
        }
        a:link{
            color: gray;
            text-decoration : none;
        }
        a:visited{
            color: gray;
            text-decoration : none;
        }
    </style>
  <body>
	<h1>鲸城</h1>
	<p>---拥有的商品比深海处未知物种还多---</p>
	<div class="logo">
		<a href="https://sm.ms/image/zyka8DxOFtrgJYC" target="_blank">
		<img src="https://s2.loli.net/2023/06/21/zyka8DxOFtrgJYC.png" width="300px" height="300px">
		</a>
	</div>
	<div class="bbox">
		<form name="form" action="LoginServlet" method="post" onsubmit="return isValidate(form1)">
		<input type="text" name="username" placeholder="会员名/邮箱/手机号"><br>
		<input type="password" name="userpass" placeholder="请输入登录密码"><br><br> 
		<label><input type="radio" name="identity" value="0" id="identity"  checked="checked"/>用户</label> 
	    <label><input type="radio" name="identity" value="1" id="identity" />管理员</label><br><br> 
		<input id="btn" type="submit" value="登录"><br>   <br>         
		<input id="btn" type="reset" value="重置">
	    </form>
	    <ul>
	    <li><a href = "http://localhost:8080/ch09/reg.jsp">注册</a></li>
	    <li><a href = "http://localhost:8080/ch09/userinfo.jsp">个人中心</a></li>
	    <li><a href = "http://localhost:8080/ch09/guessNum.jsp">有奖活动</a></li>
		<li><a href = "http://localhost:8080/ch09/logout.jsp">退出</a></li>
		</ul>
	</div>
  </body>
</html>
