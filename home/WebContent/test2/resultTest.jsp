<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Cookie ck = new Cookie("id", id);
	Cookie ck2 = new Cookie("pwd", pwd);
	ck.setMaxAge(24*60*60);
	response.addCookie(ck);
	ck2.setMaxAge(24*60*60);
	response.addCookie(ck2);
%>
</body>
</html>