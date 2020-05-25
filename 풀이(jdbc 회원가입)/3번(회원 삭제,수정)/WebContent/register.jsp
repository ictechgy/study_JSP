<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function pwchk(){
	pw1 = document.getElementById("pwd1").value;
	pw2 = document.getElementById("pwd2").value;
	if(pw1 == pw2){
		document.getElementById("label").innerHTML="확인!!";
	}else{
		document.getElementById("label").innerHTML="불일치!!";
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";   //근데 굳이 이렇게 불일치시 삭제시킬 필요가 있나.. 등록시에 두 값이 일치하지 않는데도 값이 들어가는걸 막으려는 거 같은데.. 그건 나처럼 가입 자체 메소드에서도 제어가능하고..
	}												//.focus메소드로 커서를 강제로 위치시킬 수도 있다.
}
function chkValidate(){
	if(document.getElementById('id').value == ""){
		alert('아이디는 필수 입력 사항입니다.');
		return;
	}else if(document.getElementById('pwd1').value == ""){
		alert('비밀번호는 필수 입력 사항입니다.');
		return;
	}
	else{ document.form.submit(); }
}
</script>
</head>
<body>
<%response.setCharacterEncoding("utf-8");%>
<form name="form" action="chkRegister.jsp" method="post">
	<input type="text" id="id" name="id" placeholder="아이디">(*필수 항목)<br>
	<input type="text" id="pwd1" name="pwd" placeholder="비밀번호"><br>
	<input type="text" id="pwd2" onchange="pwchk()" placeholder="비밀번호 확인">
	<label id="label">(*필수 항목)</label><br>
	<input type="text" name="name" placeholder="이름"><br>
	<input type="text" name="addr" placeholder="주소"><br>
	<input type="text" name="tel" placeholder="전화번호"><br>
	<input type="button" value="회원가입" onclick="chkValidate();">			
</form>
</body>
</html>