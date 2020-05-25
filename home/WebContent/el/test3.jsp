<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>표현언어 예제3</title>
</head>
<body>
<%
	request.setAttribute("name", "홍길동");
%>
<h3>표현언어 사용 예제 3 : scope 처리</h3>
<hr>
요청 URI : ${pageContext.request.requestURI}<br>
request의 name 속성 : ${requestScope.name}<br>
</body>
</html>