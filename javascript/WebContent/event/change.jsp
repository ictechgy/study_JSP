<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function display1(){
		alert("이름을 입력하셨나요?")
	}
	function display2(){
		alert("주소를 입력하셨나요?")
	}
</script>
</head>
<body>
<center>
	<form>
		이름 : <input type="text" onchange=display1()><p>
		주소 : <input type="text" onchnage=display2()>
	</form>
</center>

</body>
</html>