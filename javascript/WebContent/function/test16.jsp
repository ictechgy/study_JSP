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
	document.write("���ش�"+Today.getYear()+"���Դϴ�. <p>")
	Today.setYear(Today.getYear()+100)
	document.write("���طκ��� 100�� �ڴ�"+Today.getYear()+"���Դϴ�.")
</script>

</body>
</html>