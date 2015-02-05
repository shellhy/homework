<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="homework.admin" %>
<%@ page import="DAO.DbConn" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.classic.Session" %>
<%@ page import="org.hibernate.Query" %>
<jsp:useBean id="admin" class="homework.admin" scope="session">
<jsp:setProperty name="admin" property="name" />
<jsp:setProperty name="admin" property="password" />
</jsp:useBean>
<%
String name=admin.getName();
String password=admin.getPassword();
//System.out.println(name+password);
  DbConn dc=new DbConn();
  List<admin> list=(List<admin>)dc.queryAllName("admin");   
  int i=0;
  boolean flag=false;
  for(i=0;i<list.size();i++)
   {if(list.get(i).getName().equals(name)&&list.get(i).getName().equals(password)) flag=true; break;}
  if(flag){											//如果值为true，表示登录成功
		session.setAttribute("username",name);		//保存用户名到session范围的变量中
		session.setAttribute("password",password);
		response.sendRedirect("../findServlet");						//跳转到管理员主页
	}else{
		response.sendRedirect("../index.jsp");						//跳转到用户登录页面
	}
%>