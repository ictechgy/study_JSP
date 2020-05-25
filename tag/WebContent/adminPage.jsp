<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
아이디 : <%= request.getParameter("id") %><br>
비밀번호 : <%= request.getParameter("pwd") %><br>
사용자 : <%= request.getParameter("user") %><br>
param value : <%= request.getParameter("name") %><br>
<a href='javascript:history.back()'>이전</a>

</body>
</html>