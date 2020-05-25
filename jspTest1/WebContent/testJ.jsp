<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="f" method="post" action="testI.jsp">	<!-- action의 위치를 지정하지 않으면 자기 자신의 페이지로 데이터가 넘어간다 -->
	수를 입력 : <input type="text" name="su"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>