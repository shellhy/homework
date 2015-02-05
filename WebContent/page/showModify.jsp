<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("UTF-8"); //不加这句代码乱产生中文乱码%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.classic.Session" %>
<%@ page import="DAO.DbConn" %>
<%@ page import="homework.peopleBean" %>
<jsp:useBean id="people1" class="homework.peopleBean" scope="request">
<jsp:setProperty name="people1" property="name" />
<jsp:setProperty name="people1" property="password" />
<jsp:setProperty name="people1" property="email" />
<jsp:setProperty name="people1" property="pushInfo" />
<jsp:setProperty name="people1" property="degree" />
<jsp:setProperty name="people1" property="id" />
</jsp:useBean>
<%
int id=people1.getId();
String name = people1.getName();	//获取用户名参数
String password = people1.getPassword();	//获取用户输入的密码参数
String email = people1.getEmail();	//获取用户输入的邮箱
String degree = people1.getDegree();	//获取用户输入学历
String push = people1.getPushInfo();	//获取用户其他信息
//System.out.println(id+"\t"+name+"\t"+password+"\t"+email+"\t"+degree+"\t"+push);
DbConn dc=new DbConn();
dc.update(people1);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>showModify page</title>
</head>
<body>
<div align="center">
<table border="8">
    <tr>
    <th width="40%">userName</th>
    <th width="90%"><%=name %></th>
  </tr>
    <tr>
    <th width="40%">password</th>
    <th width="90%"><%=password %></th>
  </tr>
    <tr>
    <th width="40%">email</th>
    <th width="90%"><%=email %></th>
  </tr>
    <tr>
    <th width="40%">degree</th>
    <th width="90%"><%=degree %></th>
  </tr>
    <tr>
    <th width="40%">pushInfo</th>
    <th width="90%"><%=push %></th>
  </tr>
</table>
</div>         
<a href="userModify.jsp" align="center">返回修改</a>
<a href="main.jsp" align="center">返回主页</a>
</body>
</html>