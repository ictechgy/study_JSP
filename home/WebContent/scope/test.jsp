<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>scope 테스트</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>Request Scope Test1</h2>
	<hr color="green" width="300">
	<form name="f" action="scope1.jsp" method="post">
		값 : <input type="text" name="count"><input type="submit" value="전송">
	</form>
</div>
</body>
</html>