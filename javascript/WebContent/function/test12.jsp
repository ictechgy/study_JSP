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
	var arr=new Array(300,200,100)
	for(var i=0; i<arr.length; i++){
		document.write(arr[i]+"&nbsp")
	}
	document.write("<p>arr.sort()적용-->")
	arr.sort()
	for(var i=0; i<arr.length; i++){
		document.write(arr[i]+"&nbsp")
	}
</script>
</body>
</html>