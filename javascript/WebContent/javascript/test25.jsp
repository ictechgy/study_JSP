<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var i,j, sum=0
	for(i=10; i<=50; i=i+10){
		for(j=1;j<=i;j=j+1){
			sum=sum+j
		}
		document.write("<p>1����"+i+"������ ����"+sum+"�̴�")
		sum=0
	}
</script>
</head>
<body>

</body>
</html>