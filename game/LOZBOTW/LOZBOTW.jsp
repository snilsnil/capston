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
	  <link href='../css/gm_gal.css' rel='stylesheet' type='text/css'/>

	<script>

	var info=navigator.userAgent.toLowerCase();
var oslmg=null;
 if(info.indexOf('android')>=0||info.indexOf('iphone')>=0||info.indexOf('ipad')>=0){
	location.href="mobileindex.jsp";
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
				<tr><td style="width:120px; cursor:pointer;" onclick="location.href='../../index.jsp';"><img style="width:120px; box-shadow:none;" src="../../img/logo.png"></td></tr>
			</table>
			<form style="Vertical-align:top; display: inline-block;" method="post" action="../../gamename.jsp">
			<table>
					<tr><td><input id="gmname" type="text" name="gmname"></td>
					<td><input id="scgmname" name="scgmname" type="submit" value="&#128269;"></td></tr>
					</table>
			</form>
						<%
					if(userID==null){
					%>
						<input id="login" type="button" value="로그인" onclick="window.open('../../loginform.jsp','new','width=700px,height=700px')">
	 
					<%
					}else{
					%>
					<div id="ssclogin"><%=userID %>님이 환영합니다.
					<button id="avc" style="cursor:pointer" type="button" onClick="location.href='../logoutaction.jsp'">로그아웃</button>
					</div>
					<% } %>
			</div>
			</div>
		<br>
		<div id="head">
			<iframe height="720px" width="1280px" src="https://www.youtube.com/embed/hbI1BPgXTQI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>		
		<table class="gm">
			<tr><td class="title"><br>젤다의 전설 브레스 오브 더 와일드<br><br></td></tr>
			<tr style="overflow-y:auto; overflow-x:hidden; width:100%; height:150px;">
				<td style="align:middle;"><img style="width:400px" src="../../img/background/LOZBOTW.PNG"></td>
			</tr>
			<tr>
				<td><br>&nbsp;&nbsp;&nbsp;장르&nbsp;:&nbsp;3인칭 액션에어,&nbsp;액션 어드벤처<br><br>&nbsp;&nbsp;&nbsp;개발사&nbsp;:&nbsp;Nintendo<br><br>&nbsp;&nbsp;&nbsp;배급사&nbsp;:&nbsp;Nintendo<br><br>&nbsp;&nbsp;&nbsp;플랫폼&nbsp;:&nbsp;닌텐도 스위치<br><br>&nbsp;&nbsp;&nbsp;출시일&nbsp;:&nbsp;2017.03.03<br><br>&nbsp;&nbsp;&nbsp;한국어 지원<br><br></td>
			</tr>
			<tr>
				<td style="width:100px" class="summ">대재앙이라고 불리는 재해가 일어나 하이랄 왕국은 멸망했다.&nbsp;&nbsp;그로부터 100년 후, 주인공 링크는 지하유적에서 오랜 잠으로부터 깨어나 신비한 목소리에 이끌려 대지로 발을 내딛는다.<br><br></td>
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
		BbsDAO bbsDAO=new BbsDAO();
		bbs.setUrl((String)request.getRequestURL().substring(34,41));
		System.out.println(bbs.getUrl());
		bbs.setUrl2((String)request.getRequestURL().substring(34,41));
		ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
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
		<table id="pageNum">
		<tr>
		<td><a href="LOZBOTW.jsp?pageNumber=<%if(pageNumber/10==0){%><%=pageNumber=01%><% }else{ %><%=pageNumber -10%><%}%>">이전</a></td>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>1"><%= pageNumber/10%>1</a></td>
		<%if((bbsDAO.getPage()-1)>pageNumber*10){ %>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>2"><%= pageNumber/10%>2</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*20){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>3"><%= pageNumber/10%>3</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*30){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>4"><%= pageNumber/10%>4</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*40){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>5"><%= pageNumber/10%>5</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*50){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>6"><%= pageNumber/10%>6</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*60){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>7"><%= pageNumber/10%>7</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*70){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>8"><%= pageNumber/10%>8</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*80){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>9"><%= pageNumber/10%>9</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*90){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%= pageNumber/10%>0"><%= pageNumber/10+1%>0</a></td>
		<% }if((bbsDAO.getPage()-1)>pageNumber*100){%>
		<td><a href="LOZBOTW.jsp?pageNumber=<%=pageNumber +10%>">다음</a></td>
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
		<td>
		<%if(userID!=null){%>
		<input type=button class=write value=글&nbsp작성 style="float:right" onclick="location.href='write.jsp'"><br>
		<%} %>
		</td>
		</tr>
		</table>
		</form>
		<br><br><br><br><br>
</body>
</html>