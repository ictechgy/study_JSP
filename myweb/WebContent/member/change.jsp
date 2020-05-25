<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id='user' class='members.memberDTO'/>
<jsp:setProperty name='user' property='*'/>

<jsp:useBean id='db' class='members.memberDAO'/>

<%
	String id = (String)session.getAttribute("id");
	user.setId(id);
	
	db.update(user);
%>
<script>
	alert('변경되었습니다.')
	location.href="userInfo.jsp"
</script>

</body>
</html>