<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>제 목</td><td>조회수</td>
		</tr>
		<tr>
		<td><a href="cont.jsp">안녕하세요</a></td>
		<td><%=application.getAttribute("count") %></td>
		</tr>
	</table>
</body>
</html>













