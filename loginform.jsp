<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='./css/signup.css' rel='stylesheet' style='text/css'/>
      </head>
<body>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}
if(userID==null){
%>
        <form action="abc.jsp" method="post" class="loginForm">
          <h2>로그인</h2>
          <div class="Form">
            <input type="text" class="id" name="userID" placeholder="아이디">
          </div>
          <div class="Form">
            <input type="password" class="pw" name="userPassword1" placeholder="비밀번호">
          </div>
          <input type="submit" class="btn" value="로그인" >
          <div class="bottomText1">
            회원이 아니신가요? <input class="signup" type="button" value="회원가입" onclick="location.href='signup.jsp';">
          </div>
          <div class="bottomText2">
            ID/PWD를 모른가요? <input class="signup" type="button" value="ID/PWD찾기" onclick="location.href='findidpassword.jsp';">
          </div>
        </form>
<%
}else{
%>
<script>
alert("로그인이 되었습니다.");
opener.parent.location.reload();
window.close();
</script>
<% } %>
      </body>
    </html>