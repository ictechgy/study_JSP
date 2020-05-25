<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var k=1
	for(i=1; i<7; i++){
		document.write("여러번 반복<br>")
		k++
		if(k>4){
			continue
		}
		document.write("나도 반복<br>")
	}
</script>
</head>
<body>

</body>
</html>