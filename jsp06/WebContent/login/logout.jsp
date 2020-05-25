<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	session.invalidate();
%>
<script>
	alert("로그아웃")
	location.href='login.jsp'  //로그인페이지로 다시 이동시키는 것.. response.sendRedirect()는?
</script>

이 페이지를 요청받으면 서버는 세션을 삭제하게 되고, 스크립트코드만 있는 이 파일을 클라이언트에 던짐. 그러면 alert문자를 클라이언트에서 띄우고 location.href에 의해 login.jsp파일에 대해 서버에 요구하게 됨
그럼 서버는 해당 페이지를 또 넘겨줌
만약 response를 썼다면 이 페이지를 넘겨주는게 아니라 인자로 쓰인 페이지를 넘겨주는거니까.. 세션만료는 시킬 수 있겠지만 alert메시지는 못띄우겠지

</body>
</html>