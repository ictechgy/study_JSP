<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String id="1";
String pwd="1";
String nickname="홍길동";
if(id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd")) ){
	session.setAttribute("loginUser", nickname);  //접속한 사용자마다 이름은 같아도 value를 다르게 함
	response.sendRedirect("main.jsp");
}
else{
	response.sendRedirect("login.jsp");
}
%>


</body>
</html>