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
  		// ��ȡ�û������������Ϣ
  		var username = document.getElementById("username").value;
  		var userpass = document.getElementById("userpass").value;
  		var reuserpass = document.getElementById("reuserpass").value;
  		var birthdate = document.getElementById("birthdate").value;
		
  		if(isNull(username)){
  			alert("�û���Ϊ�գ�����������");
  			return false;
  		}
  		
   		if(isNull(userpass)){
  			alert("����Ϊ�գ�����������");
  			return false;
  		}
  		
  	   	if(isNull(reuserpass)){
  			alert("�ظ�����Ϊ�գ�����������");
  			return false;
  		}
  		
  		if(isPass(userpass, reuserpass)){
  			alert("�������벻ͬ������������");
  			return false;
  		}
  		
  		if(isDate(birthdate)){
  			alert("�������ڴ�������������");
  			return false;
  		}
  		
  		return true;
	}
	
	function isNull(str){
		// �ж��ַ����Ƿ�Ϊ��
		if(str.length == 0)
			return true;
		else 
			return false;
	}
	
	function isPass(str1, str2){
		// �ж����������Ƿ�һ��
		if(str1 != str2)
			return true;
		else
			return false;
	}
	
	
	function isDate(birthdate){
		// �ж������Ƿ���ȷ
		if(birthdate.indexOf("-") != -1 || birthdate.indexOf("/") != -1){
			var year = birthdate.substring(0,4); // ����Ҳ���
			if(birthdate.indexOf("-", 5) != -1 || birthdate.indexOf("/", 5) != -1){
				var month = birthdate.substring(5,7); 
				var day = birthdate.substring(8,10);
				if(year >= 1900 && year <= 2023){
					// ����һ�����飬��������ÿ���µĺϷ�����
        			days = [31,28,31,30,31,30,31,31,30,31,30,31];
					// �ж�ƽ������
				    if ( ( year % 4 == 0 && year % 100 != 0 ) || ( year % 400 == 0 ) ) {
				    	days[1] = 29;// ���������29��
				    }else {
				        days[1] = 28;// ƽ�������28��
				    }
					if(month > 0 && month < 13) {
						if(day <= days[month - 1] && day > 0) {  // ������0�����µ��������
				            return false;  // ����Ϸ�������false
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
    
    <title>�û�ע��</title>
    
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
  <h1>�û�ע��</h1>
  <hr>
 <form name="form" method="post" action="UserServlet" onsubmit="return isValidate()">
 
  <table width="400" border="0" align="center" id="table">
    <tr>
      <td>�û�����</td>
      <td><input name="username" type="text" class="ipt-t" id="username" value=""/></td>
    </tr>
    <tr>
      <td>���룺</td>
      <td><input name="userpass" type="password" class="ipt-t" id="userpass" value=""/></td>
    </tr>
    <tr>
      <td>�ظ����룺</td>
      <td>
        <input name="reuserpass" type="password" class="ipt-t" id="reuserpass" value=""/>
   </td>
    </tr>
    <tr>
      <td>�Ա�</td>
      <td><label>
      <input type="radio" name="gender" value="��" id="gender"  />��</label>
        <label>
        <input type="radio" name="gender" value="Ů" id="gender"  />Ů</label></td>
    </tr>
    
    <tr><td valign="top">�������ڣ�<br /></td>
    <td valign="top"><input type="text" name="birthdate" class="ipt-t" id="birthdate" value=""/></td></tr>
    <tr>
      <td>���᣺</td>
      <td><label>
        <select name="nativeplace" id="nativeplace">
          <option value="����">����</option>
          <option value="����" selected>����</option>
          <option value="�㽭" >�㽭</option>
          <option value="ɽ��">ɽ��</option>
          <option value="����">����</option>
          <option value="�Ϻ�">�Ϻ�</option>
          <option value="���">���</option>
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
  <a href = "http://localhost:8080/ch09/index.jsp">������ҳ</a>
  </body>
</html>
