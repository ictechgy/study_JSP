<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function num1(){
		pan1 = prompt("첫번째 숫자")
	}
	function num2(){
		pan2=prompt("두번째 숫자")
	}
	function hap(){
		pan3 = parseInt(pan1)+parseInt(pan2) //또는 eval()
		alert("결과는" + pan3+"입니다.")
	}
</script>
</head>
<body>
<form>
	<input type="button" value="첫번째 숫자" onclick="num1()">
	<input type="button" value="두번째 숫자" onclick="num2()">
	<input type="button" value="결과" onclick="hap()">

</form>

</body>
</html>