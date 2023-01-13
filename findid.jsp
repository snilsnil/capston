<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.*" %>
<%@page import="java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDTO" scope="page" />
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userID"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>아이디 찾기</title>
    <link href='./css/signup.css' rel='stylesheet' style='text/css'/>

</head>
<body>
<%
userDAO userDAO = new userDAO();
int result=userDAO.findid(user.getUserEmail());
if(user.getUserEmail()!=null){
String rs=userDAO.findid1(user.getUserEmail());
if(result==1){
%>
<div class="loginForm">
<div style="font-size:16px; margin:20px;">당신의 아이디는</div>
<div style="margin-bottom:20px;"><%=rs %>입니다.</div>
<button class="btn" onclick="location.href='findidpassword.jsp';">확인</button>
</div>
<%}

else if(result==0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('정보가 일치하지 않습니다.')");
	script.println("history.back()");
	script.println("</script>");	
}
else if(result==-1){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('회원의 정보가 존재하지 않습니다.')");
	script.println("history.back()");
	script.println("</script>");	
}
else if(result==-2){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 오류가 발생했습니다.')");
	script.println("history.back()");
	script.println("</script>");	
}
}
else{
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('정보를 입력하세요')");
	script.println("history.back()");
	script.println("</script>");
}
%>
</body>
</html>