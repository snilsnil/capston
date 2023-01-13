<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="user.*" %>
<%@page import="java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDTO" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userEmail"/>

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
String userID=request.getParameter("userID");
String userEmail=request.getParameter("userEmail");
if(user.getUserEmail()!=null&&user.getUserID()!=null){
	userDAO userDAO = new userDAO();
	int result=userDAO.findpwd(user.getUserID(),user.getUserEmail());
	if(result==1){

%>
        <form action="changepwd.jsp" method="post" class="loginForm">
          <h2><%=userID %>님</h2>
          <div class="Form">
            <input type="password" class="pw" name="userPassword1" placeholder="변경할 비밀번호">
          </div>
          <div class="Form">
            <input type="password" class="pw" name="userPassword2" placeholder="비밀번호 확인">
          </div>
          <input type="submit" class="btn" value="변경" >
        </form>
<%	
application.setAttribute("idkey",userID);
}

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