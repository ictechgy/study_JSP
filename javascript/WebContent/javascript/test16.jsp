<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var a=3, b=1
	document.write(a+"<<"+b+"="+(a<<b)+"<br>")
	document.write(a+">>"+b+"="+(a>>b)+"<br>")
	document.write(a+">>>"+b+"="+(a>>>b)+"<br>")
</script>
</head>
<body>
shift 연산이다. 3이라는 숫자는 2진수로 11이며 이 2진수를 왼쪽과 오른쪽으로 각각 1자리 밀어내기를 한 연산이다.
>>> 연산은 unsigned shift연산으로서 시프트연산후 남은자리는 무조건 0으로 채운다.(음수 삭제)
</body>
</html>