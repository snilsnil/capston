<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="user.userDTO" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 화면</title>
    	<meta charset="utf-8">
    <!-- css 파일 분리 -->
		<link href='./css/signup.css' rel='stylesheet' style='text/css'/>
     <meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>
         <form action="abc2.jsp" method="post" class="loginForm">
          <h2>회원가입</h2>
          <div class="Form">
            <input type="text" class="id" name="userID" placeholder="아이디">
          </div>
          <div class="Form">
            <input type="password" class="pw" name="userPassword1" placeholder="비밀번호">
          </div>
          <div class="Form">
            <input type="password" class="pw" name="userPassword2" placeholder="비밀번호확인">
          </div>
          <div class="Form">
            <input type="email" class="id" name="userEmail" placeholder="이메일">
          </div>
          <input type="submit" class="btn" value="회원가입" >
        </form>
</body>
</html>
