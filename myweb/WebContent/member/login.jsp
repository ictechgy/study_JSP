<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function chk(){
		if(id.value==''){
			alert('아이디를 입력하십시오')
		}
		else if(pwd.value==''){
			alert('비밀번호를 입력하십시오')
		}
		else{
			go.submit()
		}
	}
	
	
</script>

</head>
<body>

<jsp:include page="..\default\header.jsp"/>

<h1>로그인 페이지입니다.</h1>

<form action="loginChk.jsp" method="post" id=go>
<table align='right'>

<tr>
	<td><input type="text" name='id' id='id' placeholder="아이디"></td>
	<td rowspan='2'><input type="button" value="로그인" onclick="chk()"></td>
	
</tr>
<tr>
	<td><input type="password" name='pwd' id='pwd' placeholder="비밀번호"></td>
</tr>

<tr>
	<td><a href="register.jsp">회원가입</a></td>
</tr>


</table>
</form>

<jsp:include page="..\default\footer.jsp"/>



</body>
</html>