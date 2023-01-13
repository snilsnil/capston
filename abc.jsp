<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.*" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDTO" scope="session" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword1"/>
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
	script.println("location.href='main.jsp'");
	script.println("</script>");	
}
userDAO userDAO = new userDAO();
int result=userDAO.login(user.getUserID(),user.getUserPassword1());
if(result==1){
	session.setAttribute("userID",user.getUserID());
	response.sendRedirect(request.getHeader("referer"));
	
}

else if(result==0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");
	script.println("</script>");	
}
else if(result==-1){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('존재하지 않는 아이디입니다..')");
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
%>
</body>
</html>