<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="homework.peopleBean" %>
<%@ page import="DAO.DbConn" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.classic.Session" %>
<%@ page import="org.hibernate.Query" %>
<jsp:useBean id="people" class="homework.peopleBean" scope="session">
<jsp:setProperty name="people" property="name" />
<jsp:setProperty name="people" property="password" />
</jsp:useBean>
<%
String name=people.getName();
String password=people.getPassword();
System.out.println(name+password);
DbConn dc=new DbConn();

  List<peopleBean> list=(List<peopleBean>)dc.queryAll();
  int i=0;
  boolean flag=false;
  for(i=0;i<list.size();i++)
   {if(list.get(i).getName().equals(name)&&list.get(i).getName().equals(password)) 
	   flag=true; break;}
  if(flag){											//如果值为true，表示登录成功
		session.setAttribute("user",name);		//保存用户名到session范围的变量中
		response.sendRedirect("../main.jsp");						//跳转到主页
	}else{
		response.sendRedirect("../index.jsp");						//跳转到用户登录页面
	}
%>