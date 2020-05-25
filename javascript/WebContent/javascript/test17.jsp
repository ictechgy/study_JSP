<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var a=10
	document.write("++a : " + (++a) + "<br>")
	document.write("--a : " + (--a) + "<br>")
	document.write("a++ : " + (a++) + "<br>")
	document.write("a-- : " + (a--) + "<br>")
	document.write("-a : " + (-a) + "<br>")
</script>
</head>
<body>
증감연산자이다. 후치연산의 경우 document.write()가 먼저 작동한 뒤에 값이 변한다
</body>
</html>