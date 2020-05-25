<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function pwdChk(){
		if(pwd.value == pwd2.value){
			label.innerHTML="비밀번호 일치"
		}
		else{
			label.innerHTML="비밀번호 불일치"
		}
	}
	
	function chk(){
		if(id.value==''){
			alert('아이디는 필수 입력 사항입니다')
		}
		else if(pwd.value==''){
			alert('비밀번호는 필수 입력 사항입니다')
		}
		else if(pwd.value!=pwd2.value){
			alert("비밀번호와 비밀번호확인이 일치하지 않습니다")
		}
		else{
			go.submit()
		}
		
	}

</script>

</head>
<body>
<h1>회원가입페이지입니다.</h1>

<form action='registerChk.jsp' method='post' id=go>

<input type='text' id='id' name='id' placeholder='아이디'><br>
<input type='password' id='pwd' name='pwd' placeholder='비밀번호'><br>
<input type='password' id='pwd2' placeholder="비밀번호 확인" onchange="pwdChk()"><label id='label'></label><br>
<input type='text' name='name' placeholder='이름'><br>
<input type='text' name='addr' placeholder="주소"><br>
<input type='text' name='tel' placeholder="연락처"><br>
<input type='button' value="회원가입" onclick="chk()">

</form>


</body>
</html>