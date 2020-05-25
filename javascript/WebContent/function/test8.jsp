<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	//생성자 함수
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
	document.write("<b>rabbit1의 정보</b><p>");
	document.write("색깔:"+rabbit1.color+"<br>");
	document.write("나이:"+rabbit1.age+"<p>");
	document.write("<b>rabbit2의 정보</b><p>");
	document.write("색깔:"+rabbit2.color+"<br>");
	document.write("나이:"+rabbit2.age+"<p>");
</script>

</body>
</html>