<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="JS/test.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  method="post" action="showRegister.jsp" onSubmit="return check(this)">
用户名：  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input	name="name" type="text" id="name"  title="用户名" style="width: 120px"><br><br>

密码： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="password" type="password" id="password" title="密码" style="width: 120px"> <br><br>
确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="password" name="repwd" id="repwd" title="确认密码" style="width: 120px"> <br><br>
邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="email" type="email" id="email" title="邮箱" style="width: 120px"> <br><br>
学历：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="degree" id="degree" title="学历"><br/><br/>
<option value="bachelor">bachelor</option>
<option value="graduate">graduate</option>
<option value="doctor">doctor</option>
<option value="post-doctor" selected="selected">post-doctor</option>
</select><br/><br/>

是否消息推送：
<select name="pushInfo" id="pushInfo" title="是否推送">
<option value="no">No</option>
<option value="yes" selected="selected">Yes</option>
</select><br/><br/>
&nbsp;&nbsp;&nbsp;
<input type="reset" name="reset" id="reset" value="重置">
&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" id="submit" value="提交"><br/>
</form>
</body>
</html>