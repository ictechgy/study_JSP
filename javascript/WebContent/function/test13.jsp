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
	var arr=new Array(4)
	arr[0]="가"
	arr[1]="A"
	arr[2]="나"
	arr[3]="B"
	for(var i=0; i<arr.length; i++){
		document.write(arr[i]+"&nbsp")
	}
	document.write("<p>arr.reverse()적용 -->")
	arr.reverse()
	for(var i=0; i<arr.length; i++){
		document.write(arr[i]+"&nbsp")
	}
</script>
</body>
</html>