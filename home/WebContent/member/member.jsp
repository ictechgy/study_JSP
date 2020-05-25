<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입페이지</title>
<script type="text/javascript">
	function check(){
		if(f.id.value==""){	//name속성을 가지고 아이디입력부분을 가리킨것인데 저 부분 가리키는 방법은 다양하다. id속성을 이용하거나 document.getElementById()등
			alert('아이디를 입력하세요!')
			f.id.focus()
			return;
		}
		if(f.passwd.value=""){
			alert('비밀번호를 입력하세요!')
			f.passwd.focus()
			return;
		}
		document.f.submit()
	}
	//근데 input 태그의 속성으로서 minlength라던지 필수입력같은 속성 이용해서 반드시 입력하도록 만들 수 있지 않나? - required 속성 존재함
</script>
</head>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	String ssn1=request.getParameter("ssn1");
	String ssn2=request.getParameter("ssn2");
%>
<body onload="f.name.focus()">
<form name="f" method="post" action="member_input.jsp">
	<table width="600" align="center">
		<tr>
			<td colspan="2" align="center">회원가입</td>
		</tr>
		<tr>
			<td width="150">이름</td>
			<td>
				<input type="text" name="name" value="<%=name %>" disabled>   <!-- disabled한 부분은 전송이 안된다?! -->
				<input type="hidden" name="name" value="<%=name %>">
			</td>
		</tr>
		<tr>
			<td width="150">아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td width="150">비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td width="150">주민번호</td>
			<td><input type="text" name="ssn1" value="<%=ssn1%>" readonly size="6">-<input type="password" name="ssn2" value="<%=ssn2%>" readonly size="7"></td>
		</tr>
		<tr>
			<td width="150">이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td width="150">연락처</td>
			<td><input type="text" name="ph1" size="3" maxlength="3">-<input type="text" name="ph2" size="4" maxlength="4">-<input type="text" name="ph3" size="4" maxlength="4"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:check()">[전송]</a>
				<a href="#">[취소]</a>
			</td>
		</tr>
	</table>
</form>




</body>
</html>