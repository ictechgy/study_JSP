<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function test(k){
		re=k*k
		return re
	}
</script>
</head>
<body>
<script type="text/javascript">
	for(i=1; i<10; i++){
		document.write(i+"*"+i+"="+test(i)+"&nbsp&nbsp")
	}
</script>

</body>
</html>