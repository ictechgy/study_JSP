<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function num1(){
		pan1 = prompt("ù��° ����")
	}
	function num2(){
		pan2=prompt("�ι�° ����")
	}
	function hap(){
		pan3 = parseInt(pan1)+parseInt(pan2) //�Ǵ� eval()
		alert("�����" + pan3+"�Դϴ�.")
	}
</script>
</head>
<body>
<form>
	<input type="button" value="ù��° ����" onclick="num1()">
	<input type="button" value="�ι�° ����" onclick="num2()">
	<input type="button" value="���" onclick="hap()">

</form>

</body>
</html>