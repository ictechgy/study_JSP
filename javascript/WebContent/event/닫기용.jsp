<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>closewin</title>
</head>
<body>
<form>
	<input type="button" value="현재 윈도우 닫기" onclick="self.close()"><br>
	<input type="button" value="바로 전 윈도우 닫기" onclick="opener.close()">
</form>

</body>
</html>