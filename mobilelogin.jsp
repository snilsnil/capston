<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Insert title here</title>
    <style>
    div{
    text-align:center;
    }
	a { 
	margin:auto;
	text-decoration:none ;
	color:black;
	} 

    table{
    margin:auto;
    text-align:center;
    }
    input{
    margin:auto;
        text-align:center;
    }

    </style>
</head>
<body>
        <br><br>
        <div><b><font size="6"color="gray">로그인</font></b></div>
        <br><br><br>
		
        <form method="post" action="abc.jsp" name="userInfo" onsubmit="return checkValue()" >
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="userID" maxlength="50">
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="userPassword1" maxlength="50">
                    </td>
                </tr>
			</table>
			<br>
			<div>
            <input id="button" type="submit" value="로그인"/>
			<br>
			<br>
			<br>
            <a href="signup.jsp" onclick="window.open(this.href,'팝업창','width=700, height=630');return false;">회원가입</a>&nbsp;&nbsp;&nbsp;
			<a href="findidpassword.jsp" onclick="window.open(this.href,'팝업창','width=700, height=630');return false;">아이디찾기/비밀번호찾기</a>
			</div>
        </form>
</body>
</html>