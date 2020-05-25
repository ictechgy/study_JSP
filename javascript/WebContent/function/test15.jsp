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
	Today = new Date()
	document.write(Today.getYear()+"년"+(Today.getMonth()+1)+"월"+Today.getDate()+"일")
	switch(Today.getDay()){
	case 0: document.write("일요일")
	break
	case 1: document.write("월요일")
	break
	case 2: document.write("화요일")
	break
	case 3: document.write("수요일")
	break
	case 4: document.write("목요일")
	break
	case 5: document.write("금요일")
	break
	case 6: document.write("토요일")
	break
	}
	document.write(Today.getHours()+"시"+Today.getMinutes()+"분"+Today.getSeconds()+"초")
</script>

</body>
</html>