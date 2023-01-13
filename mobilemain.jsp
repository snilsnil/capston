<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript" src="./js/mobilemain.js"></script>

<meta charset="utf-8">
<title>Hit Game</title>

<style>
		body{
			background-color:black;
		}
		a { 
		text-decoration:none ;
		color:white;
		}
 		button{
		float:right;
		}
		
		#login1{
		float:right;
		color:white;
		}		
		#mainmenu{
			margin:0;
			padding:0;
			overflow:hidden;
			color : white;

		}
	
		#menuop{
		font-size:20px;
		width: 50px;
		height: 30px;
		text-align: center;
		list-style: none;
		float:left;
		}
		#nav{
		display:inline-block;
		}
		#index_03{ 
		width: 400px;
		margin:0px; 
		}
		#imgul{
		margin:0px;
		padding:0px;
		border-radius:0.3em;
		}
		#imgli{
		display:none;
		} 
		#slide3>ul>li{ 
		position: absolute; 
		font-size: 0; 
		}
		#mainimg{
		width:395px;
		}

</style>

</head>
<body>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}

				if(userID==null){
				%>
				<button id="login" type="button" onClick="location.href='mobilelogin.jsp'">로그인</button>
								<%
				}else{
				%><div id="login1"><%=userID %>&nbsp;
				<button type="button" onClick="location.href='logoutaction.jsp'">로그아웃</button></div>
				<%}%>


		<div id="nav">
			<table id="mainmenu">
				<tr><td style="width:80px"><a href="./main.jsp"><img style="width:80px" src="./img/logo.png"></a></td>
					<td><a href="https://www.naver.com">PC</a></td>
					<td><a href="https://www.naver.com">XBOX</a></td>
					<td><a href="https://www.naver.com">PS</a></td>
					<td><a href="https://www.naver.com">NIN</a></td>
				</tr>
			</table>
		</div>
		<div id="index_03">
			<div id="slide3">
				<ul id="imgul">
					<li><a href="https://www.youtube.com"><img id="mainimg" src="img/background/LOZSS.PNG" alt="슬라이드7"></a></li> 
					<li id="imgli"><a href="https://www.naver.com"><img id="mainimg" src="img/background/supermariobros.PNG" alt="슬라이드8"></a></li> 
					<li id="imgli"><a href="https://www.google.com"><img id="mainimg" src="img/background/LOZBOTW.PNG" alt="슬라이드9"></a></li>
				</ul>
			</div>
		</div>
</body>
</html>