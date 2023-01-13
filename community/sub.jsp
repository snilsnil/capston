<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<link href='../css/main.css' rel='stylesheet' style='text/css'/>
	<style>
		#menu{
		width:10%; 
		height:70%; 
		float:left; 
		font-weight : bold; 
		color : white;
		background:gray;
		}
		
		#section{margin-right:10%; height:70%;
		background:yellow;}
		
		#craft{width:100%; height:15%; font-weight : bold; color : white;
		background:black;}
		#head{width:100%; height:15%;font-size : 80px; font-weight : bold; color : white;
		background:black;}
	</style>

<title>Hit Game</title>
</head>
<body>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}

%>
	
	<script type="text/javascript">
		document.write(getVideoTag());
	</script>
			
	<div id="maindiv">
		<div id="nav">
			<table id="mainmenu">
				<tr><td style="width:120px"><a href="../main.jsp"><img style="width:120px; box-shadow:none;" src="../img/logo.png"></a></td>
					<td style="cursor:pointer;" onclick="location.reload(true);">PC</td>
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
		<br>
		<div id="head">
		PC
		</div>
		<div id="menu">
		1<br>
		<br>
		2		<br>
		<br>
		3		<br>
		<br>
		4		<br>
		<br>
		5		<br>
		<br>
		6		<br>
		<br>
		7		<br>
		<br>
		8		<br>
		<br>
		9		<br>
		<br>
		10		<br>
		<br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		<div id="section">
			1<br>
		<br>
		2		<br>
		<br>
		3		<br>
		<br>
		4		<br>
		<br>
		5		<br>
		<br>
		6		<br>
		<br>
		7		<br>
		<br>
		8		<br>
		<br>
		9		<br>
		<br>
		10		<br>
		<br>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		<div id="craft">
		<br>
		최원준 김민섭 문현준 허준영
		<br><br>
		</div>
</div>
</body>
</html>