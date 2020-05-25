<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>표현언어 예제</title>
</head>
<body>
<div align="left">
<h3>연산자와 내장객체를 사용한 예</h3>
	<table border="1" width="600">
		<tr>
			<th width="35%">표현식</th><th>값</th>
		</tr>
		<tr>
			<td>\${2+3}</td><td>${2+3}</td>
		</tr>
		<tr>
			<td>\${2/3}</td><td>${2/3}</td>
		</tr>
		<tr>
			<td>\${2 div 3}</td><td>${2 div 3}</td>
		</tr>
		<tr>
			<td>\${2 % 3}</td><td>${2 % 3}</td>
		</tr>
		<tr>
			<td>\${2 mod 3}</td><td>${2 mod 3}</td>
		</tr>
		<tr>
			<td>\${2 == 3}</td><td>${2 == 3}</td>
		</tr>
		<tr>
			<td>\${2 eq 3}</td><td>${2 eq 3}</td>
		</tr>
		<tr>
			<td>\${header.host}</td><td>${header.host}</td> <!-- 서버쪽(호스트) 정보보기? -->
		</tr>
		<tr>
			<td>\${header["host"]}</td><td>${header["host"]}</td>
		</tr>
		<tr>
			<td>\${header["user-agent"]}</td><td>${header["user-agent"]}</td> <!-- 페이지를 요청한 클라이언트의 브라우저 정보 -->
		</tr>
	</table>
</div>
</body>
</html>