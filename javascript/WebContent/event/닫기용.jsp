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
	<input type="button" value="���� ������ �ݱ�" onclick="self.close()"><br>
	<input type="button" value="�ٷ� �� ������ �ݱ�" onclick="opener.close()">
</form>

</body>
</html>