<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>값 입력해서 다른 페이지로 넘기기</title>
</head>
<body>
	<form name="f" action="testR.jsp" method="post">
	<!-- method가 get방식일 때는 데이터가 전부 주소창을 통해 전송된다. -->
	<!-- method가 post방식일 때는 데이터가 body에 같이 섞여서 전송된다. -->
	<!-- post방시을 꼭 써야하는 경우
		1. 많은 데이터를 전송하고자 할 때
		2. 비밀스러운 데이터를 전송하고자 할 때
		3. 파일을 전송하고자 할 때 -->
		이름:<input type="text" name="name"><br>
		나이:<input type="text" name="age"><br>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>