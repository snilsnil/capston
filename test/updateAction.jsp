<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="bbs.*" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
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
	if(userID==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("window.open('loginform.jsp','new','width=700px,height=700px')");
		script.println("</script>");	
	}
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){
		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("history.back()");
		script.println("</script>");	
	}
	
	Bbs bbs=new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("history.back()");
		script.println("</script>");	
	}
	else{
		if(request.getParameter("bbsTitle")==null||request.getParameter("bbsContent")==null||
				request.getParameter("bbsTitle").equals("")||request.getParameter("bbsContent").equals("")){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 되었습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		BbsDAO bbsDAO = new BbsDAO();
		int result=bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
		if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('글 수정이 실패했습니다.");
			script.println("history.back()");
			script.println("</script>");	
		}
		else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href='LOZBOTW.jsp'");
			script.println("</script>");	
		}
	}

%>
</body>
</html>