<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

response - 응답

<%
	response.sendRedirect("http://www.google.co.kr");
%>
사용자가 이 현재페이지를 요청하면 그 대신에 저 페이지를 보내주겠다는 것. 

로그인에 있어서 성공 또는 실패등에 있어서 페이지를 다르게 구성할때..
if문을 통해 로그인에 성공하면 어떤 로그인된 홈페이지를 보내주고.. 실패한 경우에는 다른 메시지를 출력하고자 할때..





</body>
</html>