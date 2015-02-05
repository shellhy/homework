<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type1 = "home,Programming,Paper,InfoVisual,more";//此处用于模拟从数据库中查询到的数据
%>
<%@ page import="java.util.*"%>
<%@ page import="homework.News"%>
<%@ page import="homework.findServlet"%>
<!DOCTYPE HTML>
<script type="text/javascript" src="js/d3.js"></script>
<html>
<head>
<meta charset="utf-8">
<link href="CSS/style.css" rel="stylesheet" />
<title>黄勇的主页</title>
</head>
<body>
<header>
<form action="http://www.google.com.hk">
 Google<input type="search" name="googlesearch"> <input type="submit" name="search"><br> 
</form>
<%String user=(String)session.getAttribute("username"); %>
<div align=right>
<a >hello！<%= user %> </a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="./page/userModify.jsp">modify</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="./page/exit.jsp">exit</a>
</div>
</header>
<div id="box">
	<nav>
			<%
				request.setCharacterEncoding("UTF-8"); //不加这句代码乱产生中文乱码
			%>
	<ul>
		<%
			
				String[] type = type1.split(",");	//将获取到的字符串分割为数组
				String str=null;
				//遍历数组并显示数组中的各元素
				if(type.length>0){
				for (int i = 0; i < type.length; i++) {
					if(i==0) str="index.jsp";
					else if(i==1) str="./JsoupServlet";
					else if(i==2) str="./ArticleServlet";
					else str=type[i]+".jsp";
		%>
		<li style="float: left; padding: 0px 10px 0px 10px" font-size:100pt>
		<a class="navigation"  href = <%=str %> > <%=type[i]%></a> |</li>
		<%
				}
			} else {
		%>
		<li style="float: left; padding: 0px 10px 0px 10px" font-size:50pt><a
			class="navigation"  href="#">暂无分类</a></li>
		<%
			}
		%>
	</ul>
	</nav> 
</div><br><br>
<div width="100%" align="center">
		<h2>Today's BBC NEWS</h2>
	</div>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" bgcolor="#666666">
		<tr>
		    <th bgcolor="#FFFFFF">id</th>
			<th bgcolor="#FFFFFF">name</th>
			<th bgcolor="#FFFFFF">href</th>
		</tr>
		<%
			List<News> list = (List<News>)request.getAttribute("list");
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='9'>没有任何信息！</td></tr>");
			} else {
				for (News n : list) {
					
		%>
		<tr align="center">
		    <td bgcolor="#FFFFFF"><%=n.getId()%></td>
			<td bgcolor="#FFFFFF"><%=n.getName()%></td>
			<td bgcolor="#FFFFFF">
			<a href=<%=n.getHref() %> >更多消息 </a>
            </td>
	
		</tr>
		<%
			}				
		}
		%>
	</table>
	<div width="98%" align="center" style="padding-top:10px;">
	<%=request.getAttribute("bar")%>
	</div><br><br><br><br>
<footer>
<ul>
	<li>
	QQ:<a href="http://user.qzone.qq.com/2279689448/main">2279689448</a>&nbsp&nbsp&nbsp&nbsp
	E-mail:<a href="https://mail.google.com/mail/u/0/?shva=1#inbox">shellhys@gmail.com</a>&nbsp&nbsp&nbsp&nbsp&nbsp
	Weibo：<a href="http://weibo.com/u/2530283004/home?topnav=1&wvr=5">shellTT</a></li>
	<li>
	Address:
Beijing Normal University
No. 19, XinJieKouWai St., HaiDian District, 
Beijing 100875, P. R. China&nbsp&nbsp&nbsp&nbsp </li>
<li>
<a href="http://www.bnu.edu.cn/">Beijing Normal University</a>&nbsp&nbsp&nbsp&nbsp
<a href="http://www.sg.bnu.edu.cn/">school of management</a> &nbsp&nbsp&nbsp&nbsp
<a href="http://www.im.bnu.edu.cn/">Information Management</a>     
</li>
<li>
<a href="./page/mgLogin.jsp">Manager Enter</a> &nbsp &nbsp&nbsp&nbsp
Copyright &copy; All Rights Reserved! </li>
</ul>
</footer>
</div>
</body>
</html>
