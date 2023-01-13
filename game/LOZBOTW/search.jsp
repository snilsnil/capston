<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.*" %>
<%@page import="bbs.*" %>
<%@page import="java.util.*" %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="session" />
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <link href='../css/gm_gal.css' rel='stylesheet' style='text/css'/>

	<script>

	var info=navigator.userAgent.toLowerCase();
var oslmg=null;
 if(info.indexOf('android')>=0||info.indexOf('iphone')>=0||info.indexOf('ipad')>=0){
	location.href="mobilemain.jsp";
}
 
</script>
	<script>
	//사이트 스크롤시 메뉴에 있는 그라데이션이 단일색상으로 바뀜
	$(function(){
	 var rollHeader = 500;
	  $(window).scroll(function() {
		var scroll = getCurrentScroll();
		  if ( scroll >= rollHeader ) {
			   $('#nav').addClass('roll');
			}
			else {
				$('#nav').removeClass('roll');
			}
	  });
	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
	</script>

<title>Hit Game</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}
int pageNumber=1;
if(request.getParameter("pageNumber")!=null){
	pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
}

%>
		
	<div id="maindiv">
		<div id="nav">
			<table id="mainmenu">
				<tr><td style="width:120px; cursor:pointer;" onclick="location.href='../../main.jsp';"><img style="width:120px; box-shadow:none;" src="../../img/logo.png"></td>
					<td><a href="../../community/sub.jsp">PC</a></td>
					<td><a href="../../community/sub2.jsp">XBOX</a></td>
					<td><a href="../../community/sub3.jsp">PS</a></td>
					<td><a href="../../community/sub4.jsp">NIN</a></td>
				</tr>
			</table>
						<%
					if(userID==null){
					%>
						<input id="login" type="button" value="로그인" onclick="window.open('../../loginform.jsp','new','width=700px,height=700px')">
	 
					<%
					}else{
					%>
					<div id="ssclogin"><%=userID %>님이 환영합니다.
					<button id="avc" style="cursor:pointer" type="button" onClick="location.href='../../logoutaction.jsp'">로그아웃</button>
					</div>
					<% } %>
			</div>
			</div>
		<br>
		<div id="head">
			<table class="gm">
				<tr>
					<td class="picture" rowspan="2">
						<img style="height:720px" src="../img/background/LOZBOTW.PNG">
					</td>
					<td><%= request.getHeader("referer") %></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
		<table class="type">
		<thead>
			<tr>
			<th class="top" style="text-align:left">글 번호</th>
			<th class="top">제목</th>
			<th class="top">작성자</th>
			<th class="top">작성일</th>
			<th class="top">조회수</th>
			</tr>
		</thead>
		<tbody class="type06">
		<%
		String shList=request.getParameter("shList");
		String sech=request.getParameter("sech");
		System.out.println(sech);
		BbsDAO bbsDAO=new BbsDAO();
		bbs.setShList(shList);
		bbs.setSech(sech);
		ArrayList<Bbs> list = bbsDAO.getSearch(); 
		for(int i=0;i<list.size();i++){
		%>
  		<tr>
    		<td><%= list.get(i).getBbsID() %></td>
    		<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
			<td><%= list.get(i).getUserID() %></td>
			<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
			<td><%= list.get(i).getCount() %></td>
 		</tr>
 		<%} %>
 		</tbody>
		</table>
		<table style="margin:auto; font-size:18px;" id="pageNum">
		<tr>
		<td><a href="search.jsp?pageNumber=<%if(pageNumber/10==0){%><%=pageNumber=01%><% }else{ %><%=pageNumber -10%><%}%>">이전</a></td>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>1"><%= pageNumber/10%>1</a></td>
		<%if((bbsDAO.getPage()-1)>pageNumber*10){ %>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>2"><%= pageNumber/10%>2</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*20){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>3"><%= pageNumber/10%>3</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*30){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>4"><%= pageNumber/10%>4</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*40){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>5"><%= pageNumber/10%>5</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*50){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>6"><%= pageNumber/10%>6</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*60){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>7"><%= pageNumber/10%>7</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*70){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>8"><%= pageNumber/10%>8</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*80){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>9"><%= pageNumber/10%>9</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*90){%>
		<td><a href="search.jsp?pageNumber=<%= pageNumber/10%>0"><%= pageNumber/10+1%>0</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*100){%>
		<td><a href="search.jsp?pageNumber=<%=pageNumber +10%>">다음</a></td>
		<%} %></tr>
		</table>
		<form method="post" action="search.jsp">
		<table style="margin:auto;">
		<tr>
		<td>
		<select name="shList">
		<option value="bbsTitle">제목</option>
		<option value="userID">작성자</option>
		</select>
		</td>
		<td>
		<input name="sech" type="text">
		<input type=submit value="검색">
		</td>
		</tr>
		</table>
		</form>
		<div id="craft">
		<%if(userID!=null){%>
		<input type=button class=write value=글&nbsp작성 style="float:right" onclick="location.href='write.jsp'"><br>
		<%} %>
		<br>
		최원준 김민섭 문현준 허준영
		<br><br>
		</div>
</body>
</html>