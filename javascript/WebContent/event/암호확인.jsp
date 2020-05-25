<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function pwchk(){
		if(form1.pw1.value==form1.pw2.value){		//또는 태그에 id값을 두고 바로 비교 가능. 아니면 document.getElementById같은거 쓰거나
			alert("당신의 암호를 입력하였습니다.")
		}else{
			alert("암호란과 암호확인란의 \n password가 서로 맞지 않습니다.")
		}
	}
</script>
</head>
<body>
<form name="form1">
	암호:<input type="password" name="pw1"><br>
	암호확인:<input type="password" name="pw2"><p>
	<input type="button" value="확인" onclick="pwchk()">
</form>

</body>
</html>