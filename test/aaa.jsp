<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script type="text/javascript" src="./js/mainrandom.js"></script>
	
	<style>
	
form{
    padding-right:10px;
    overflow:hidden;
    color:white;

}

input{
    color: black;
    background-color : white; 
}

video {
    position:absolute;
    border-radius:0.3em;
    opacity:0.5;
    top: 0px;
    left: 0px;
    min-width: 100%;
    min-height: 100%;
    width: auto;
    height: auto;
    z-index: -1000;
    overflow:hidden;
}

a { 
    text-decoration:none ;
    color : white;
} 

span{
font-size:40px;
}
table{
color:black;
font-size :16px;
}

input::placeholder {
  color: black;
}



		#login{
			padding-top:7px;
			padding-right:30px;
			float:right;
			color:white;
			font-size:16px;
			background :rgba(0,0,0,0);
			cursor:pointer;
		}

		#ssclogin{
		padding-top: 7px;
  		padding-right: 30px;
   		float: right;
  		color: white;
		}
#mainmenu{
    display:inline-block;
    margin:0;
    padding:0;
    overflow:hidden;		
}
#mainmenu tr td{
    width: 60px;
    height: 40px;
    text-align: center;
    list-style: none;
    float:left;

}
#tdstory{
    vertical-align: top;
}
#schuser{
    display:inline-block;
    padding:5px;
    font-size:10px;
    
}
#idpwd{
border-radius:0.3em;
width:100px;
}

#maindiv{
padding: 10px; margin: 10px;
    overflow:hidden;
}


#nav{
background: linear-gradient(
    to top,
    rgba(20, 20, 20, 0) 10%,
    rgba(20, 20, 20, 0.1) 30%,
    rgba(20, 20, 20, 0.3) 50%,
    rgba(20, 20, 20, 0.5) 70%,
    rgba(20, 20, 20, 0.7) 90%,
    rgba(20, 20, 20, 0.9) 100%
  );
position:fixed;
padding-top:5px;
top:0px;
left:0px;
right:0px;
-webkit-transition: height 0.3s;
-moz-transition: height 0.3s;
transition: height 0.3s;
}
#nav.roll {
background :black;
}


#avc{
border-radius:0.3em;
}

#article{
    overflow:hidden;
}
#menu{width:10%; height:70%; float:left; font-weight : bold; color : white;
background:gray;}

#sevtion{width:70%; height:70%;float:left;
background:yellow;}

#craft{width:100%; height:15%;float:both; font-weight : bold; color : white;
background:black;}
#head{width:100%; height:15%;font-size : 80px; font-weight : bold; color : white;
background:black;}


#footer{
height: 250px;

}

.write{
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	background-color:darkgray;
	border-radius:6px;
	border: 1px solid gray;
	display:inline-block;
	cursor:pointer;
	color: black;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:1px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
    width:100px;
    height:auto;
}

.upperwrite{
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	background-color:darkgray;
	border-radius:6px;
	border: 1px solid gray;
	display:inline-block;
	cursor:pointer;
	color: black;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:1px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
    width:100px;
    height:auto;    
    position: absolute; right: 31px; top:120px;
    
}

table.type {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
  }
  table.type th {
    width: 1060px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
  }
  table.type td {
    width: 1060px;
    padding: 10px;
    vertical-align: top;
  }
  table.type .even {
    background: #efefef;
  }

  table.type .top {
      background: darkgray;
  }

  table.type06 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
  }
  table.type06 th {
    width: 1060px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
  }
  table.type06 td {
    width: 1060px;
    padding: 10px;
    vertical-align: top;
  }
  table.type06 .even {
    background: #efefef;
  }
	</style>
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
				<tr><td style="width:120px; cursor:pointer;" onclick="location.reload(true);"><img style="width:120px; box-shadow:none;" src="./img/logo.png"></td>
					<td><a href="./community/sub.jsp">PC</a></td>
					<td><a href="./community/sub2.jsp">XBOX</a></td>
					<td><a href="./community/sub3.jsp">PS</a></td>
					<td><a href="./community/sub4.jsp">NIN</a></td>
				</tr>
			</table>
						<%
					if(userID==null){
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('로그인을 하세요')");
						script.println("history.back()");
						script.println("</script>");
					}else{
					%>
					<div id="ssclogin"><%=userID %>님이 환영합니다.
					<button id="avc" style="cursor:pointer" type="button" onClick="location.href='logoutaction.jsp'">로그아웃</button>
					</div>
					<% } %>
			</div>
		<div id="article">
		<div id="mainpage"></div>
		</div>
		<br>
		<div id="head">
		PC
		</div>
		<form method="post" action="writeAction.jsp">
		<table class="type">
			<thead>
			<tr>
			<th colspan="2" class="top" style="text-align:left">게시판 글쓰기 양식</th>
			</tr></thead>
			<tbody>
			<tr>
			<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
			</tr>
			<tr>
			<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			</tbody> 
		</table>
		<input type="submit" value="글쓰기">
		</form>
		<div id="craft">
		<br>
		최원준 김민섭 문현준 허준영
		<br><br>
		</div>
</div>
</body>
</html>