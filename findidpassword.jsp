<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="user.userDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
    <title>ID/PWD 찾기</title>
    
    <!-- css 파일 분리 -->
    <link href='./css/signup.css' rel='stylesheet' style='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
</head>
<body>
		<div><form action="findid.jsp" method="post" class="findid">
          <h2>ID찾기</h2>
          <div class="Form">
            <input type="email" class="id" name="userEmail" placeholder="이메일">
          </div>
          <input type="submit" class="btn" value="ID찾기" >
        </form></div>
        
        <div><form action="findpwd.jsp" method="post" class="findpwd">
          <h2>PWD찾기</h2>
          <div class="Form">
            <input type="text" class="id" name="userID" placeholder="아이디">
          </div>
          <div class="Form">
            <input type="email" class="id" name="userEmail" placeholder="이메일">
          </div>
          <input type="submit" class="btn" value="ID찾기" >
        </form></div>
</body>
</html>
