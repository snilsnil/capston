<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.*" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword1"/>
<jsp:setProperty name="user" property="userPassword2"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<body>

<%
String userID=(String)application.getAttribute("idkey");
String userPassword1=request.getParameter("userPassword1");
String userPassword2=request.getParameter("userPassword2");


userDAO userDAO = new userDAO();
int result=userDAO.changepwd(userID,user.getUserPassword1());

if(!userPassword1.equals(userPassword2)){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 일치하지 않습니다.');");
	script.println("history.back();");
	script.println("</script>");	
}
else if(user.getUserPassword1()==null||user.getUserPassword2()==null){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 일치하지 않습니다.');");
	script.println("history.back();");
	script.println("</script>");	
}

else{
	if(result==1){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 변경되었습니다.')");
	script.println("location.href='findidpassword.jsp';");
	script.println("</script>");	
}

else if(result==0){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호 변경을 실패하였습니다.')");
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

%>
</body>
</html>