<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.*" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword1"/>
<jsp:setProperty name="user" property="userPassword2"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<body>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
	userID=(String) session.getAttribute("userID");
}
if(userID!=null){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인이 되어있습니다.')");
	script.println("window.close()");
	script.println("</script>");	
}
if(user.getUserID()==null||user.getUserPassword1()==null||user.getUserPassword2()==null||user.getUserEmail()==null){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항입니다.')");
	script.println("history.back()");
	script.println("</script>");
}else{
	userDAO userDAO = new userDAO();
	int result=userDAO.join(user);
	if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");	
	}
	else {
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 되었습니다.')");
		script.println("window.close()");
		script.println("</script>");
	}
}

%>

</body>
</html>