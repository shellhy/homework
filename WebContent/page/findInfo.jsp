<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*"%>
<%@ page import="homework.peopleBean"%>
<%@ page import="homework.findServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language="javascript">
function myFunction(){alert("删除信息！");}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register information</title>
</head>
<body>
<div width="100%" align="center">
		<h2>注册人数信息</h2>
	</div>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" bgcolor="#666666">
		<tr>
		    <th bgcolor="#FFFFFF">id</th>
			<th bgcolor="#FFFFFF">name</th>
			<th bgcolor="#FFFFFF">password</th>
			<th bgcolor="#FFFFFF">email</th>
			<th bgcolor="#FFFFFF">degree</th>
			<th bgcolor="#FFFFFF">PushInfo</th>
			<th bgcolor="#FFFFFF">edit</th>
			<th bgcolor="#FFFFFF">delete</th>
		</tr>
		<%
			List<peopleBean> list = (List<peopleBean>)request.getAttribute("list");
			
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='9'>没有任何信息！</td></tr>");
			} else {
				for (peopleBean people : list) {
					
		%>
		<tr align="center">
		    <td bgcolor="#FFFFFF"><%=people.getId()%></td>
			<td bgcolor="#FFFFFF"><%=people.getName()%></td>
			<td bgcolor="#FFFFFF"><%=people.getPassword()%></td>
			<td bgcolor="#FFFFFF" ><%=people.getEmail()%></td>
			<td bgcolor="#FFFFFF"><%=people.getDegree()%></td>			
			<td bgcolor="#FFFFFF"><%=people.getPushInfo()%></td>
			<td bgcolor="#FFFFFF">
			       <form action="./page/mgModify.jsp" method="post" onsubmit="return check(this);">
                   <input type="hidden" name="id" value="<%=people.getId()%>">
                   <input type="submit" value="edit">
                   </form>
            </td>
            <td bgcolor="#FFFFFF">
			       <form action="./page/delete.jsp" method="post" onclick="myFunction();">
                   <input type="hidden" name="id" value="<%=people.getId()%>">
                   <input type="submit" value="delete">
                   </form>
            </td>
		</tr>
		<%
			}				
		}
		%>
	</table>
	<div width="98%" align="center" style="padding-top:10px;">
				<%=request.getAttribute("bar")%>
	</div>
</body>
</html>