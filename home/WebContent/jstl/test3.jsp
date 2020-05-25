<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>실습</title>
</head>
<body>
<table border="1" align="center">
	<tr>
		<th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th>
	</tr>
	<c:forEach var="first" begin="1" end="9" step="1">
		<tr>
		<c:forEach var="second" begin="2" end="9" step="1">
			<td>
				<c:out value="${second} × ${first} = ${first*second }"/>
			</td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</body>
</html>