<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	//������ �Լ�
	function myrabbit(color, age){
		this.color=color
		this.age=age
	}
</script>
</head>
<body>
<script type="text/javascript">
	rabbit1 = new myrabbit("red",5);
	rabbit2 = new myrabbit("white", 2);
	document.write("<b>rabbit1�� ����</b><p>");
	document.write("����:"+rabbit1.color+"<br>");
	document.write("����:"+rabbit1.age+"<p>");
	document.write("<b>rabbit2�� ����</b><p>");
	document.write("����:"+rabbit2.color+"<br>");
	document.write("����:"+rabbit2.age+"<p>");
</script>

</body>
</html>