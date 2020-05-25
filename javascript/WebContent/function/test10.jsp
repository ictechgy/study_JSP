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
	arr1 = new Array(10,20,30) //값을 여러개 쓰면 각각의 값들이 인덱스 하나씩 차지
	for(i=0; i<3; i++){
		document.write(arr1[i]+"&nbsp&nbsp")
	}
	document.write("<br>")
	arr2= new Array(5)  //값을 하나만 쓰면 방 갯수
	arr2[0]="하나"
	arr2[1]="둘"
	arr2[2]="셋"
	arr2[3]="넷"
	arr2[4]="다섯"
	for(i=0;i<5;i++){
		document.write(arr2[i]+"&nbsp&nbsp")
	}
</script>

</body>
</html>