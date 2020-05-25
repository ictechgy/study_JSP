<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>include 지시어</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th><th>국어</th>
		</tr>
		<%@ include file="test2.jsp" %> 		<!-- 코드가 여기로 온것과 동일하다. 소스를 통째로 가져와서 여기에서 컴파일을 한다.-->
	</table>
	
	<!-- include로는 주로 메뉴바같은걸 만듦 스프링에서도 잘 쓰나? -->
</body>
</html>