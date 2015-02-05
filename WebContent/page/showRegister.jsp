<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="homework.peopleBean" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.classic.Session" %>
<jsp:useBean id="people" class="homework.peopleBean" scope="session">
<jsp:setProperty name="people" property="name" />
<jsp:setProperty name="people" property="password" />
<jsp:setProperty name="people" property="email" />
<jsp:setProperty name="people" property="pushInfo" />
<jsp:setProperty name="people" property="degree" />
</jsp:useBean>
<body>
<%
//System.out.println(people.getName());
//System.out.println(people.getPassword());
Configuration cfg = new Configuration().configure();
SessionFactory factory = cfg.buildSessionFactory();
Session s=null;
try{
s=factory.openSession();
s.beginTransaction();
peopleBean p=new peopleBean();
p.setName(people.getName());
p.setPassword(people.getPassword());
p.setEmail(people.getEmail());
p.setDegree(people.getDegree());
p.setPushInfo(people.getPushInfo());
s.save(p);
s.getTransaction().commit();
}catch(Exception e){
	e.printStackTrace();
	s.getTransaction().rollback();
}finally{
	if(s!=null)
	{
		if(s.isOpen())
		{s.close();}
	}
}//
%>
</br></br>
<% 
session.setAttribute("username", people.getName());
session.setAttribute("id", people.getId());
 %>
<h1>注册成功！</h1>
<a href="../main.jsp">back to homePage</a>
</body>

