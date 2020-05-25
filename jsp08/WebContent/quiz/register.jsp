<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>


	function pwdchk(){
		if ( pwd.value != pwd2.value ){
			label.innerHTML="비밀번호 불일치"   //document.getElementById("label").innerHTML="비밀번호 불일치"
		}
		else{
			label.innerHTML="비밀번호 일치"
		}
	}

	
	function chk(){
		if (id.value==''){
			alert("아이디는 필수 입력 사항입니다.")
		}
		else if(pwd.value==''){
			alert("비밀번호는 필수 입력 사항입니다.")
		}
		else if(pwd.value != pwd2.value  ){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.")
		}
		else{
			go.submit()
		}
	}
	
	//아이디가 일치하는 것이 있는지를 확인해야하는데..chkRegister.jsp에서 일치하는 id값이 존재한다면 다시 이 페이지로 돌려줘도 되기는 하는데
	//그냥 일반적인 페이지들처럼 아예 회원가입창에서 id값이 존재하는지를 확인하는게 낫지 않나
	
	
//처음에는 document.getElementById()를 쓰려고 했는데 조건식이 너무 복잡해져서 함수선언 앞에 따로 변수에 또 저장시켜서 쓰려고 했었음
//근데 그냥 id이름으로 위와같이 쓸 수도 있었음.. name값도 그대로 쓸 수 있나 -> 안되네. 그냥 id.value, pwd2.value같이 쓰는거..
//그래서 따로 변수에 저장해서 하자 -> 그것도 안되네
//아 그냥 id.value같이 쓰는거 되네.. 뭐지

//잘 동작하지 않는경우 브라우저에서 F12로 개발자모드로 확인해도 됨
</script>


</head>
<body>


<form action=chkRegister.jsp id=go method='post'>

<input type='text' placeholder="아이디" id='id' name='id'>*필수항목<br>
<input type='password' placeholder="비밀번호" id='pwd' name='pwd'>*필수항목<br>
<input type='password' placeholder="비밀번호 확인" id='pwd2' onchange='pwdchk()'><label id='label'>비밀번호와 일치하게 입력</label><br>
<input type='text' placeholder="이름" name='name'><br>
<input type='text' placeholder="주소" name='addr'><br>
<input type='text' placeholder="전화번호" name='tel'><br>
<input type='button' value="회원가입" onclick='chk()'>

</form>

</body>
</html>