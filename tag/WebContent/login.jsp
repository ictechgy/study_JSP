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
	<input type="text" name="id" placeholder="���̵�"><br>
	<input type="text" name="pwd" placeholder="��й�ȣ"><br>
	<input type="radio" name="user" value='user' checked='checked'>�����
	<input type="radio" name="user" value='admin'>������<br>
	<input type="submit" value="�α���"><br>

</form>

</body>
</html>