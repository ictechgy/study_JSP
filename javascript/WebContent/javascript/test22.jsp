<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var a=prompt("혈액형을 입력하세요")
	switch(a){
	case "A":
	case "a":
		document.write("당신은 원리원칙주의자")
		break
	case "B":
	case "b":
		document.write("당신은 호기심이 왕성한 바람둥이 ^^!")
		break
	case "O":
	case "o":
		document.write("당신은 목적지향적")
		break
	case "AB":
	case "ab":
		document.write("당신은 단정짓기 어려운 타입")
		break
		default : document.write("혈액형을 입력하세요")
	}
	
</script>
</head>
<body>

</body>
</html>