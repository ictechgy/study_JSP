<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
pageContext.setAttribute("name", "page man");
request.setAttribute("name", "request man");
session.setAttribute("name", "session man");
application.setAttribute("name", "application man");

%>
�׳� ��� : ${name}<br>
page �Ӽ� : ${ pageScope.name }<br>
request �Ӽ� : ${ requestScope.name }<br>
session �Ӽ� : ${ sessionScope.name }<br>
application �Ӽ� : ${ applicationScope.name }<br>
<a href="attribute2.jsp">�̵�</a>


</body>
</html>