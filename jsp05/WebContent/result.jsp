<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("가입을 축하합니다!!")
</script>
<% request.setCharacterEncoding("utf-8"); 
	//getCharacterEncoding은 인코딩방식이 뭐였는지 불러오기? 이전페이지의 인코딩방식? 아니면 현재페이지의 인코딩방식?
%> 

이름 : <%= request.getParameter("username") %><br>
아이디 : <%= request.getParameter("ID") %><br>
비밀번호 : <%= request.getParameter("PWD") %><br>


request.getParmeterNames를 쓸 수도 있을 것이다.

</body>
</html>