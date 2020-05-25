<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var num=prompt("원하는 단을 입력하세요")
	document.write("<h3>"+num+"단</h3>")
	for(i=1; i<10; i++){
		document.write(num+"*"+i+"="+(num*i)+"&nbsp&nbsp&nbsp")
	}
	
</script>
</head>
<body>

</body>
</html>