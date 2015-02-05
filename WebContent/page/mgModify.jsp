<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); //不加这句代码乱产生中文乱码%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.classic.Session" %>
<%@ page import="DAO.DbConn" %>
<%@ page import="homework.peopleBean" %>
<jsp:useBean id="people1" class="homework.peopleBean" scope="request">
<jsp:setProperty name="people1" property="id" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify register information</title>
</head>
<body>
<%
int id=people1.getId();
DbConn dc=new DbConn();
peopleBean p=dc.queryById(id);
%>
<div align="center">
<form  method="post" action="showModify.jsp">
ID：  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input	name="id" type="text" id="id" value="<%=p.getId() %>" title="ID" style="width: 120px"><br><br>

用户名：  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input	name="name" id="name" type="text"  value="<%=p.getName() %>" title="用户名"style="width: 120px"><br><br>

原密码： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="pwd" type="password" id="pwd" disabled="disabled" value="<%=p.getPassword() %>" title="密码" style="width: 120px"> <br><br>

新密码： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="password" type="password" id="password" value="<%=p.getPassword() %>" title="密码" style="width: 120px"> <br><br>

确认密码：&nbsp;&nbsp;&nbsp;&nbsp;
<input type="password" name="repwd" id="repwd" title="确认密码" style="width: 120px"> <br><br>

邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input	name="email" id="email" type="text" value="<%=p.getEmail() %>" title="用户名"style="width: 120px"><br><br>

学历：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="degree" id="degree" type="text" title="学历"value="<%=p.getDegree() %>"><br/><br/>

是否消息推送：&nbsp;&nbsp;&nbsp;
<input name="pushInfo" id="pushInfo" type="text" value="<%=p.getPushInfo() %>"><br/><br/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" name="reset" id="reset" value="重置">

&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit" id="submit" value="提交">
<br/>
</form>
</div>
</body>
</html>