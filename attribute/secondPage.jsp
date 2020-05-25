<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("secondPage Page<br>");

out.print("하나의 페이지 속성 : "+pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성 : "+request.getAttribute("name")+"<br>");
out.print("하나의 세션 속성 : "+session.getAttribute("name")+"<br>");
out.print("하나의 앱 속성 : "+application.getAttribute("name")+"<br>");
%>
<a href="thirdPage.jsp">thirdPage 이동</a>
</body>
</html>







