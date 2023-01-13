<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.io.*" %>
<%@page import="bbs.*" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <link href='./css/gm_gal.css' rel='stylesheet' style='text/css'/>
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
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}

%>
		
	<div id="maindiv">
		<div id="nav">
			<table id="mainmenu">
				<tr><td style="width:120px; cursor:pointer;" onclick="location.href='../main.jsp';"><img style="width:120px; box-shadow:none;" src="../img/logo.png"></td>
					<td><a href="../community/sub.jsp">PC</a></td>
					<td><a href="../community/sub2.jsp">XBOX</a></td>
					<td><a href="../community/sub3.jsp">PS</a></td>
					<td><a href="../community/sub4.jsp">NIN</a></td>
				</tr>
			</table>
<%
if(userID==null){
%>
						<input id="login" type="button" value="로그인" onclick="window.open('../loginform.jsp','new','width=700px,height=700px')">
	 
<%
}else{
%>
					<div id="ssclogin"><%=userID %>님이 환영합니다.
					<button id="avc" style="cursor:pointer" type="button" onClick="location.href='../logoutaction.jsp'">로그아웃</button>
					</div>
<% 
}
						
int bbsID=0;
if(request.getParameter("bbsID")!=null){
	bbsID=Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID==0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않은 글입니다.')");
	script.println("history.back()");
	script.println("</script>");	
}

Bbs bbs=new BbsDAO().getBbs(bbsID);
Bbs bb=new Bbs();
BbsDAO bbsDAO = new BbsDAO();
int ID=Integer.parseInt(request.getParameter("bbsID"));
System.out.println(ID);
int result=bbsDAO.viewcount(ID);
%>
			</div>
		<div id="article">
		<div id="mainpage"></div>
		</div>
		<br>
		<div id="head">
			<table class="gm">
				<tr>
					<td class="picture" rowspan="2">
						<img style="height:720px" src="../img/background/LOZBOTW.PNG">
					</td>
					<td>z</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
		<table class="type">
			<thead>
				<tr>
					<th colspan="3" class="top" style="text-align:left">게시판 글보기</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td>글 제목</td>
				<td colspan="2"><%= bbs.getBbsTitle().replace(" ","&nbsp;").replace("#","&num;") %></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"><%= bbs.getUserID() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"><%= bbs.getBbsDate().substring(0,11)+bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분"  %></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td colspan="2"><%=bbs.getCount()+1 %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td style="width:100px; height:200px; text-align:left;" colspan="2"><%= bbs.getBbsContent().replace(" ","&nbsp;").replace("#","&num;") %></td> 
				<!-- 특수문자를 출력하기 위해서는 .replace("","&nbsp;")를 쓴다. -->
			</tr>
		</tbody> 
		</table>
		<div id="fix">
		<a style="cursor:pointer;" onclick="history.back()">목록</a>
		<%
			if(userID!=null&&userID.equals(bbs.getUserID())){
		%>
		<a href="update.jsp?bbsID=<%= bbsID%>">수정</a>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID%>">삭제</a>
		<%
			}
		%>
		</div>
		<br>
		<br>
		<div id="craft">
		<%if(userID!=null){%>
		<input type=button class=write value=글&nbsp작성 style="float:right" onclick="location.href='write.jsp'"><br>
		<%} %>
		<br>
		최원준 김민섭 문현준 허준영
		<br><br>
		</div>
</div>
</body>
</html>