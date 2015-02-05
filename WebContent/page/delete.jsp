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
<script language="javascript">
function myfunction(){alert("删除信息！");}
</script>
<%//必须使用request %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>显示注册信息列表</title>
<style type="text/css">
tr {
	height:30px;
}
</style>
<script type="text/javascript">
	function check(form){
		if(form.bookCount.value == ""){
			alert("请输入更新数量！");
			form.bookCount.focus();
			return false;
		}
		if(isNaN(form.bookCount.value)){
			alert("格式错误！");
			form.bookCount.focus();
			return false;
		}
		return true;;
	}
</script>
</head>
<body>
  
  <%
  int id=people1.getId();
  DbConn dc=new DbConn();
  peopleBean people=dc.queryById(id);
  dc.delete(id);
  %>
  <h2 align="center">被删除信息</h2>
  <table border="8">
  <tr>
     <th width="90%">ID</th>
    <th width="200%"><%=people.getId() %></th>
  </tr>
    <tr>
    <th width="90%">userName</th>
    <th width="200%"><%=people.getName() %></th>
  </tr>
    <tr>
    <th width="90%">password</th>
    <th width="200%"><%=people.getPassword() %></th>
  </tr>
    <tr>
    <th width="20%">email</th>
    <th width="200%"><%=people.getEmail() %></th>
  </tr>
  <tr>
    <th width="90%">degree</th>
    <th width="200%"><%=people.getDegree() %></th>
  </tr>
  <tr>
  <th width="90%">pushInfo</th>
    <th width="200%"><%=people.getPushInfo() %></th>
  </tr>
</table>
</body>
</html>