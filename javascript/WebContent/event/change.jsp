<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function display1(){
		alert("�̸��� �Է��ϼ̳���?")
	}
	function display2(){
		alert("�ּҸ� �Է��ϼ̳���?")
	}
</script>
</head>
<body>
<center>
	<form>
		�̸� : <input type="text" onchange=display1()><p>
		�ּ� : <input type="text" onchnage=display2()>
	</form>
</center>

</body>
</html>