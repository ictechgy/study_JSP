<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	Today=new Date()
	document.write("올해는"+Today.getYear()+"년입니다. <p>")
	Today.setYear(Today.getYear()+100)
	document.write("올해로부터 100년 뒤는"+Today.getYear()+"년입니다.")
</script>

</body>
</html>