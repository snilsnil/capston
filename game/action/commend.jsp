<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bbs.*" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="session" />
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
</head>
<body>
<%
	int bID=(Integer)session.getAttribute("bID");
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("window.open('loginform.jsp','new','width=700px,height=700px')");
		script.println("</script>");	
	}
	else{
		if(bbs.getBbsContent()==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 되었습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		BbsDAO bbsDAO = new BbsDAO();
		int result=bbsDAO.commend(userID, bbs.getBbsContent(), bID);
		System.out.println(result);
		if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다.");
			script.println("history.back()");
			script.println("</script>");	
		}
		else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href='../"+bbs.getUrl()+".jsp'");
			script.println("</script>");	
		}
	}

%>
</body>
</html>