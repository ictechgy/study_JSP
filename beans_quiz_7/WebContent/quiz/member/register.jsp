<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
function pwchk(){ //비밀번호 체크 메소드
	pw1 = document.getElementById("pwd1").value;
	pw2 = document.getElementById("pwd2").value;
	if(pw1 == pw2){
		document.getElementById("label").innerHTML="확인!!";
	}else{
		document.getElementById("label").innerHTML="불일치!!";
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";
	}
}
function chkValidate(){ // 아이디 필수 체크 메소드
	if(document.getElementById('id').value == ""){
		alert('아이디는 필수 입력 사항입니다.');	return;
	}else if(document.getElementById('pwd1').value == ""){
		alert('비밀번호는 필수 입력 사항입니다.');	return;
	}else{ document.form.submit(); }
}
//변수에 저장해서 값이 있는지 없는지 검증해도 되고.. document.getElementById().value를 써도 되고 아니면 그냥 id이름으로 바로 쓸 수도 있다.
//물론 name값을 이용 할 수도 있는 것 같은데.. 
</script>

</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div align="center">
<h1>회원등록</h1>
<table border="0">
<tr><td>
<form name="form" action="regChk.jsp" method='post'>
<input type="text" id="id" name="id" placeholder="아이디">(*필수 항목)<br>
<input type="text" id="pwd1" name="pwd" placeholder="비밀번호"><br>
<input type="text" id="pwd2" onchange="pwchk();" placeholder="비밀번호 확인">
<label id="label">(*필수 체크)</label><br>
<input type="text" id="id" name="name" placeholder="이름"><br>
<input type="text" id="id" name="addr" placeholder="주소"><br>
<input type="text" id="id" name="tel" placeholder="전화번호"><br>
<input type="button" value="회원가입" onclick="chkValidate();"><br>
</form>
</td></tr>
</table>
</div>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>
<!-- id속성은 단일한 경우 및 해당 페이지에서만 쓰는 경우 사용하는 속성이며 name은 해당페이지 및 다음 페이지에서도 request로 사용 가능 
또한 document.getElementByNames()라는 스크립트함수 존재하며 스크립틀릿메소드로는 request.getParameterNames() 였나. 그걸로 아예 모든 이름값을 얻어올 수 있으며
checkbox같은 경우 같은 name에 여러 값이 존재하는데 그런경우 배열로 반환하던거같은데
-->