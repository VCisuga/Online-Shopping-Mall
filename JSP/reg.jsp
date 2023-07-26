<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script language="JavaScript">
  	function isValidate()
  	{
  		// 获取用户输入的所有信息
  		var username = document.getElementById("username").value;
  		var userpass = document.getElementById("userpass").value;
  		var reuserpass = document.getElementById("reuserpass").value;
  		var birthdate = document.getElementById("birthdate").value;
		
  		if(isNull(username)){
  			alert("用户名为空，请重新输入");
  			return false;
  		}
  		
   		if(isNull(userpass)){
  			alert("密码为空，请重新输入");
  			return false;
  		}
  		
  	   	if(isNull(reuserpass)){
  			alert("重复密码为空，请重新输入");
  			return false;
  		}
  		
  		if(isPass(userpass, reuserpass)){
  			alert("两次密码不同，请重新输入");
  			return false;
  		}
  		
  		if(isDate(birthdate)){
  			alert("出生日期错误，请重新输入");
  			return false;
  		}
  		
  		return true;
	}
	
	function isNull(str){
		// 判断字符串是否为空
		if(str.length == 0)
			return true;
		else 
			return false;
	}
	
	function isPass(str1, str2){
		// 判断两次密码是否一致
		if(str1 != str2)
			return true;
		else
			return false;
	}
	
	
	function isDate(birthdate){
		// 判断日期是否正确
		if(birthdate.indexOf("-") != -1 || birthdate.indexOf("/") != -1){
			var year = birthdate.substring(0,4); // 左包右不包
			if(birthdate.indexOf("-", 5) != -1 || birthdate.indexOf("/", 5) != -1){
				var month = birthdate.substring(5,7); 
				var day = birthdate.substring(8,10);
				if(year >= 1900 && year <= 2023){
					// 定义一个数组，数组里是每个月的合法天数
        			days = [31,28,31,30,31,30,31,31,30,31,30,31];
					// 判断平年闰年
				    if ( ( year % 4 == 0 && year % 100 != 0 ) || ( year % 400 == 0 ) ) {
				    	days[1] = 29;// 闰年二月有29天
				    }else {
				        days[1] = 28;// 平年二月有28天
				    }
					if(month > 0 && month < 13) {
						if(day <= days[month - 1] && day > 0) {  // 天数从0到该月的最大天数
				            return false;  // 如果合法，返回false
				        }else
				            return true;
					}else
						return true;
				}else
					return true;
			}else
				return true;
		}else
			return true;
	}

	</script>

    <style type="text/css">
      h1{
            text-align:center;
            margin-top: 50px;
            color:#607d8b;
        }
       hr{border: 3px solid white; width:100%}
       table{
            text-align:center;
            margin: auto;
        }
       body{
            background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
            background-size: 100% 100%;
            text-align:center;
            font-size: 18px;
        }
    </style>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body>
  <h1>用户注册</h1>
  <hr>
 <form name="form" method="post" action="UserServlet" onsubmit="return isValidate()">
 
  <table width="400" border="0" align="center" id="table">
    <tr>
      <td>用户名：</td>
      <td><input name="username" type="text" class="ipt-t" id="username" value=""/></td>
    </tr>
    <tr>
      <td>密码：</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value=""/></td>
    </tr>
    <tr>
      <td>重复密码：</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" id="reuserpass" value=""/>
   </td>
    </tr>
    <tr>
      <td>性别：</td>
      <td><label>
      <input type="radio" name="gender" value="男" id="gender"  />男</label>
        <label>
        <input type="radio" name="gender" value="女" id="gender"  />女</label></td>
    </tr>
    
    <tr><td valign="top">出生日期：<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" id="birthdate" value=""/></td></tr>
    <tr>
      <td>籍贯：</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="福建">福建</option>
          <option value="江苏" selected>江苏</option>
          <option value="浙江" >浙江</option>
          <option value="山东">山东</option>
          <option value="北京">北京</option>
          <option value="上海">上海</option>
          <option value="天津">天津</option>
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
  <a href = "http://localhost:8080/ch09/index.jsp">返回首页</a>
  </body>
</html>
