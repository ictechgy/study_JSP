<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function display(img){
		alert("�̹�������"+img.src+"�� �ҷ��� �� �����ϴ�.")
	}
</script>
</head>
<body>
<center>
	<form>
		<img src="coffe2.jpg" onerror=display(this)>
	</form>
</center>

</body>
</html>