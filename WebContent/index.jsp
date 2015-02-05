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
<div align="right">
<a align=right href='./page/register.jsp'>register </a>&nbsp;&nbsp;&nbsp;&nbsp;
<a align=right href='./page/login.jsp'>login </a>
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
<div>
 <h1 align="center">爱久见人心</h1>
 <div align="center">
 <audio controls>
 <source src="./Media/35144031.mp3" type="audio/mp3">
 <source src="horse.mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>
 <p style="color:yellow" align="center">
 我冷漠 是不想被看出 太容易 被感动触及<br>
我比较喜欢 现在的自己 不太想 回到过去<br>
我常常 为我们之间 忽远忽近的关系 担心或委屈<br>
别人只一句话 就刺痛心里 每一根神经<br><br>

你的孤单 是座城堡 让人景仰 却处处防疫<br>
你的温柔 那么缓慢 小心翼翼 脆弱又安静<br>
也许 我们都意会到 这次面对的幸福 是真的来临<br>
因为太珍惜 所以才犹豫　忘了先把彼此 抱紧<br><br>

我不是流言　不能猜测你<br>
疯狂的游戏　需要谁准许<br>
别人怎么说　我都不介意<br>
我爱不爱你　日久见人心</p> 
</div>
<div align="center">
TED: talking about music &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TED: how to learn? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TED: NEW ways to study
</div><br><br>
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
