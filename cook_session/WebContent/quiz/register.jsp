<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
function pwchk(){
	pwd = document.getElementById('pwd').value
	pwd2 = document.getElementById('pwd2').value
	if(pwd == pwd2){
		document.getElementById('label').innerHTML="일치합니다"
		return;
	}else{
		document.getElementById('pwd').value=""
		document.getElementById('pwd2').value=""
		document.getElementById('label').innerHTML="불일치"
		document.getElementById("pwd").focus()
		return;
	}
}
function chkData(){
	if(document.getElementById('id').value==""){
		alert("아이디는 필수 사항 입니다");
		return;
	}else if(document.getElementById('pwd').value==""){
		alert("비밀번호는 필수 사항 입니다");
		return;
	}else{
		fo.submit()
		return;
	}
}
</script>
</head>
<body>
<h1>계정 등록 페이지 입니다</h1>
<form id="fo" action="success.jsp" method="post">
	<input type="text" placeholder="아이디" name="id" id='id'>(*필수항목)<br>
	<input type="text" placeholder="비밀번호" name="pwd" id="pwd">(*필수항목)<br>
	<input type="text" placeholder="비밀번호 확인" id="pwd2"
		onchange="pwchk()">
	<label id="label">비밀번호 확인 하세요</label><br>
	<input type="text" placeholder="이름" name="name"><br>
	<input type="button" value="등록" onclick="chkData()">
</form>
</body>
</html>










