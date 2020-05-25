<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function test(i){
		if(i<=1){
			return 1
		}else {
			return i*test(i-1)
		}
	}

</script>
</head>
<body>
<script type="text/javascript">
	document.write("5의 팩토리얼은"+test(5)+"입니다.")
</script>
</body>
</html>