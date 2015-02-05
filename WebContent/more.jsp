<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type1 = "home,Programming,Paper,InfoVisual,more";//此处用于模拟从数据库中查询到的数据
%>
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
</div>
<body class="sub">
<br>

<br />
<table width="90%" border="0" cellspacing="4" cellpadding="2" style="text-align: center">
  <tr style="vertical-align: top">
    <td width="150" style="text-align: center" rowspan="5">
      <a href="#"><img src="./Media/aa.jpg" alt="image" name="image" width="150" height="200" border="0" id="image" /><br />
      </a>    </td>
    <td class="TitleColor">      <p >黄勇的介绍</p>    </td>
  </tr>
  <tr>
    <td>      <p class="StoryContentColor">
  湖北十堰人。 北京师范大学2011级本科生，政府管理学院信息管理与信息系统专业。<br>
  主修课程C/C++/Java/JSP/算法设计；数据库概念与实现，操作系统/数据挖掘和自然语言处理；竞争情报，知识产权等。<br>
  感兴趣的领域为Mysql/oracle数据库处理和调优、JAVA/python的web编程；数据挖掘和自然语言处理、web信息可视化等。
    </p>    </td>
  </tr>
  <tr>
    <td style="text-align: right">
      <p>&nbsp;</p>
      </td>
  </tr>
  <tr>
    <td class="FooterColor">      以往经历    </td>
  </tr>
  <tr>
    <td style="vertical-align: top" class="StoryContentColor">      <strong>* * * * *</strong><br />
     2012-2014担任班级组织委员两年；<br>
     2012-2014“捡回珍珠计划”北师大总负责人两年;<br>
     2014年ACM竞赛二等奖北师大第四名；<br>
     2013.7~2013.8中信所技术中心实习生。<br>
     
       </td>
  </tr>
  <tr>
    <td width="100" colspan="2">
      <hr noshade="noshade" size="1" />    </td>
  </tr>
</table>
<p>&nbsp;</p>
<br>
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