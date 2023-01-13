<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.io.*" %>
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
int pageNumber=1;
if(request.getParameter("pageNumber")!=null){
	pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
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
					<td>z</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
		<form method="post" action="writeAction.jsp">
		<table class="t">
			<thead>
			<tr>
			<th colspan="2" class="top" style="text-align:left">게시판 글쓰기 양식<input style="float:right" type="submit" value="글쓰기"></th>
			</tr></thead>
			<tbody>
			<tr>
			<td><input class="tt" type="text" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
			</tr>
			<tr>
			<td><textarea class="tt" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			</tbody> 
		</table>
		</form>
		<div id="craft">
		<br>
		최원준 김민섭 문현준 허준영
		<br><br>
		</div>
</body>
</html>