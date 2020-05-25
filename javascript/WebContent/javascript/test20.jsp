<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var a
	a=prompt("숫자를 입력하세요")
	if(a>0)
		document.write(a+"는 양수입니다.<br>")
	else if(a==0)
		document.write(a+"는 zero입니다.<br>")
	else
		document.write(a+"는 음수입니다.<br>")
	document.wrtie("END")
</script>
</head>
<body>

</body>
</html>