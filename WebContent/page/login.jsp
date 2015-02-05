<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login page</title>
</head>
<body align="center">
<form  method="get" action="checkLogin.jsp">
用户名： <input name="name" type="text" id="name"  title="用户名" style="width: 120px"><br><br>
密&nbsp;&nbsp;码&nbsp;&nbsp;：
 <input name="password" type="password" id="password" title="密码" style="width: 120px"> <br><br>
&nbsp;&nbsp;&nbsp;
<input type="reset" name="reset" id="reset" value="重置">
&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" id="submit" value="提交"><br/>
</form>
</body>
</html>