<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="chkUser.jsp">
	<input type="text" name="id" placeholder="아이디"><br>
	<input type="text" name="pwd" placeholder="비밀번호"><br>
	<input type="radio" name="user" value='user' checked='checked'>사용자
	<input type="radio" name="user" value='admin'>관리자<br>
	<input type="submit" value="로그인"><br>

</form>

</body>
</html>