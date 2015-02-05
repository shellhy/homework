<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type1 = "home,Programming,Paper,InfoVisual,more";//此处用于模拟从数据库中查询到的数据
%>
<!DOCTYPE HTML>
<script type="text/javascript" src="JS/d3.js"></script>
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
<br><br>
<div align="center">
<script type="text/javascript">
//第一个图
			//Width and height
			var w = 400;
			var h = 300;
			var width = 600;
			var height = 500;

			//Original data
			var dataset = {
				nodes: [
					{ name: "Adam" },
					{ name: "Bob" },
					{ name: "Carrie" },
					{ name: "Donovan" },
					{ name: "Edward" },
					{ name: "Felicity" },
					{ name: "George" },
					{ name: "Hannah" },
					{ name: "Iris" },
					{ name: "Jerry" },
					{ name: "Feb" },
					{ name: "God" }
				],
				edges: [
					{ source: 0, target: 1 },
					{ source: 0, target: 2 },
					{ source: 0, target: 3 },
					{ source: 0, target: 4 },
					{ source: 1, target: 5 },
					{ source: 2, target: 5 },
					{ source: 2, target: 5 },
					{ source: 3, target: 4 },
					{ source: 5, target: 8 },
					{ source: 5, target: 9 },
					{ source: 6, target: 7 },
					{ source: 7, target: 8 },
					{ source: 8, target: 9 },
					{ source: 8, target: 10 },
					{ source: 8, target: 11 },
					{ source: 10, target: 11}
				]
			};

			//Initialize a default force layout, using the nodes and edges in dataset
			var force = d3.layout.force()
								 .nodes(dataset.nodes)
								 .links(dataset.edges)
								 .size([w, h])
								 .linkDistance([60])
								 .charge([-90])
								 .start();

			var colors = d3.scale.category10();

			//Create SVG element
			var svg = d3.select("body")
						.append("svg")
						.attr("width", w)
						.attr("height", h);
			
			//Create edges as lines
			var edges = svg.selectAll("line")
				.data(dataset.edges)
				.enter()
				.append("line")
				.style("stroke", "#ccc")
				.style("stroke-width", 1);
			
			//Create nodes as circles
			var nodes = svg.selectAll("circle")
				.data(dataset.nodes)
				.enter()
				.append("circle")
				.attr("r", 10)
				.style("fill", function(d, i) {
					return colors(i);
				})
				.call(force.drag);
			
			//Every time the simulation "ticks", this will be called
			force.on("tick", function() {

				edges.attr("x1", function(d) { return d.source.x; })
					 .attr("y1", function(d) { return d.source.y; })
					 .attr("x2", function(d) { return d.target.x; })
					 .attr("y2", function(d) { return d.target.y; });
			
				nodes.attr("cx", function(d) { return d.x; })
					 .attr("cy", function(d) { return d.y; });
	
			});
			
			
			//第二个图
			var dataset = [ 5, 10, 20, 45, 6, 25 ];

			var outerRadius = w / 3;
			var innerRadius = w / 5;
			var arc = d3.svg.arc()
							.innerRadius(innerRadius)
							.outerRadius(outerRadius);
			
			var pie = d3.layout.pie();
			
			//Easy colors accessible via a 10-step ordinal scale
			var color = d3.scale.category10();

			//Create SVG element
			var svg = d3.select("body")
						.append("svg")
						.attr("width", w)
						.attr("height", h);
			
			//Set up groups
			var arcs = svg.selectAll("g.arc")
						  .data(pie(dataset))
						  .enter()
						  .append("g")
						  .attr("class", "arc")
						  .attr("transform", "translate(" + outerRadius + "," + outerRadius + ")");
			
			//Draw arc paths
			arcs.append("path")
			    .attr("fill", function(d, i) {
			    	return color(i);
			    })
			    .attr("d", arc);
			
			//Labels
			arcs.append("text")
			    .attr("transform", function(d) {
			    	return "translate(" + arc.centroid(d) + ")";
			    })
			    .attr("text-anchor", "middle")
			    .text(function(d) {
			    	return d.value;
			    });
			
			//第三张图
 var viewsAndInteraction = [ 
 [ [7057, 2052], [7483, 2089], [3749, 1586], [3846, 1426], [4598, 2632] ], 
 [ [5972, 2071], [5672, 2190], [9152, 7214], [9725, 3782], [8983, 2721] ], 
 [ [8749, 3076], [4768, 3190], [6738, 4532], [9546, 3825], [6983, 4831] ] 
               ]; 

 var viewColors = [ "white", "blue", "gold", "green", "red", "maroon" ]; 
 var interactionColors = [ "white", "lightblue", "yellow", "lightgreen", 
   "lightcoral", "indianred" ]; 
 var widthOfOnePack = 180, heightOfOnePack = 300; 
 var spaceBetweenPacks = 20; 
 var packCalculations = []; 
  for (var count=0; 
           count<3; 
           count++   ){ 
    var pack = d3.layout.pack() 
    .size([widthOfOnePack, heightOfOnePack]) 
    .value(function(d) { return d.size; }); 
    packCalculations[count] = pack.nodes( 
    getJSONForOneWeekOfPopularityAndInteractionData( 
                  count)); 
 } 
  
  
 var svg = d3.select("body").append("svg") 
   .attr("width", width) 
   .attr("height", height); 
 var g1 = svg.selectAll("g") 
         .data(packCalculations).enter().append("g") 
         .attr("transform", function(d,i){ 
         return "translate(" + 
           (widthOfOnePack + spaceBetweenPacks)*i + "," + 
              height / 7 + ")" } 
         ); 
 g1.append("text") 
 .text(function(d, i){return "Week " + (i+1)}) 
  .attr("x", 60); 
 var g2 = g1.selectAll("g") 
   .data(function(d){return d;}) 
   .enter() 
   .append("g"); 

 g2.append("circle") 
  .attr("r", function(d, i){return d.r}) 
  .style("fill", function(d, i){return viewColors[i%6];}) 
  .attr("transform", function(d,i){ 
         return "translate(" + d.x + "," + d.y + ")"}); 

 g2.append("circle") 
  .attr("r", function(d, i){ 
        return ((d.interaction*d.r)/d.value);})
  .style("fill", function(d, i){return interactionColors[i%6];}) 
  .attr("transform", function(d,i){ 
         return "translate(" + d.x + "," + d.y + ")"}); 

 g2.append("text") 
  .attr("x", -15) 
  .attr("y", 35) 
  .attr("fill", "white") 

  .text(function(d, i){return d.value}) 
  .attr("transform", function(d,i){ 
       return "translate(" + d.x + "," + d.y + ")"}); 

 g2.append("text") 
  .attr("x", -15) 
  .attr("y", 5) 

  //.attr("fill", "grey") 
  .text(function(d, i){return d.interaction}) 
  .attr("transform", function(d,i){ 
       return "translate(" + d.x + "," + d.y + ")"}); 

 function getJSONForOneWeekOfPopularityAndInteractionData(week){ 
 var viewsAndInteractionJSON = 
  "{ \"name\": \"week" + week + "\", \"children\": [" ; 
  for (var count=0; count<5; count++){ 
    viewsAndInteractionJSON += 
     "{ \"name\": \"" + viewColors[count+1] + 
      " \", \"size\": \"" + viewsAndInteraction[week][count][0] +       
      "\", \"interaction\": \"" + 
      viewsAndInteraction[week][count][1] + "\"     }   "; 
  if (count<4) viewsAndInteractionJSON += ","; 
  } 
  viewsAndInteractionJSON += "]}"; 
  return JSON.parse(viewsAndInteractionJSON) ; 
 }
			
</script>
</div>
<div align="center">
Social Relationship&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Social Influence  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Social DataVisulization
</div>
<div align="center">
<h1>D3, A New Face In MyWorld!</h1>
</div>
<br><br>

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
