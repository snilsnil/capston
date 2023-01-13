<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	 <script type="text/javascript" src="./js/mainrandom.js"></script>
	 <link href='./css/main.css' rel='stylesheet' style='text/css'/>
	<script>
	$(document).ready(function(){
    	//마우스를 올리면 팝업으로 영상나옴
    	$('.image').hover(function(){
    		var a=$(this).attr("id");
    		$(".a"+a).fadeIn();
        	$(".a"+a)[0].play();
    	}, function(){
    		var a=$(this).attr("id");
    		$(".a"+a).hide();
    		$(".a"+a)[0].pause();
    		$(".a"+a)[0].currentTime=0;
    		
    	});
 });
	
	</script>
	
	 <script>
	 function getVideoTag() {
			var video ='<video id=\"vdio\" muted autoplay loop>'; 
			video +='<source src=\"./video/main/';
			video += videoURLs[randomIndex];
			video += '\" type=\"video/mp4\">';
			video += '</video>';
			return video;
			}
	 </script>
	<script>
	var info=navigator.userAgent.toLowerCase();
var oslmg=null;
 if(info.indexOf('android')>=0||info.indexOf('iphone')>=0||info.indexOf('ipad')>=0){
	location.href="mobilemain.jsp";
}
 
 
	//사이트 스크롤시 메뉴에 있는 그라데이션이 단일색상으로 바뀜
	$(function(){
	 var rollHeader = 1100;
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
					%>
						<input id="login" type="button" value="로그인" onclick="window.open('loginform.jsp','new','width=700px,height=700px')">
	 
					<%
					}else{
					%>
					<div id="ssclogin"><%=userID %>님이 환영합니다.
					<button id="avc" style="cursor:pointer" type="button" onClick="location.href='logoutaction.jsp'">로그아웃</button>
					</div>
					<% } %>
			</div>
		<div id="article">
			<div id="contents">
				<div id="gm_prolog">
				<table>
				<tr>
				<td>
								<script type="text/javascript">
					document.write(getVideoTag());
				</script>	
				</td>
				<td>
					<a href="https://www.naver.com">
					<script type="text/javascript">
						document.write(getImageTag());
					</script>
					</a>
				</td>
				<td id="tdstory">
					<script type="text/javascript">
						document.write(getGM());
					</script>
				</td></tr>
				</table>					
				</div>
			</div>
		</div>
		<!-- 여기까지 동영상 배경 -->
<div id="nodrag"><br><br><br><br>
</div>
		<div style="color:white" id="footer">
		<strong  style="margin-left:70px; font-size:30px">닌텐도</strong><br>
		
		 <!-- 1번째 줄 -->
		<table class="imagepr">
			<tr>
				<td  class="image" id=image1>
					<a href="./game/LOZBOTW/LOZBOTW.jsp">
					<video muted class="aimage1" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image2>
					<a href="./game/LOZSS/LOZSS.jsp">
					<video muted class="aimage2" id="aimage"><source src="./video/main/LOZSS.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZSS.png">
					</a>
				</td>
				<td class="image" id=image3>
					<a href="./game/supermario/supermario.jsp">
					<video muted class="aimage3" id="aimage"><source src="./video/main/supermario.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/supermario.png">
					</a>
				</td>
				<td class="image" id=image4>
					<a href="">
					<video muted class="aimage4" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image5>
					<a href="">
					<video muted class="aimage5" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image6>
					<a href="">
					<video muted class="aimage6" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image7>
					<a href="">
					<video muted class="aimage7" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image8>
					<a href="">
					<video muted class="aimage8" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
			<tr>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 스카이워드 소드</td>
				<td style="font-size:19px;text-align:center;">슈퍼마리오</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
			</tr>
		</table>
		
		
		<!-- 2번째 줄 -->
		<table class="imagepr">
			<tr>
				<td class="image" id=image9>
					<a href="">
					<video muted class="aimage9" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image10>
					<a href="">
					<video muted class="aimage10" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image11>
					<a href="">
					<video muted class="aimage11" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image12>
					<a href="">
					<video muted class="aimage12" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image13>
					<a href="">
					<video muted class="aimage13" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image14>
					<a href="">
					<video muted class="aimage14" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image15>
					<a href="">
					<video muted class="aimage15" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
				<td class="image" id=image16>
					<a href="">
					<video muted class="aimage16" id="aimage"><source src="./video/main/LOZBOTW.mp4" type="video/mp4"></video>
					<img style="border-radius:0.3em; width:178px; height:250px;" src="./img/main/LOZBOTW.png">
					</a>
				</td>
			<tr>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
				<td style="font-size:19px;text-align:center;">젤다의 전설<br> 브레스오브더 와일드</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>