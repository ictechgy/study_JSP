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
Cookie cookie = new Cookie("popkie", "kiekies");
cookie.setMaxAge(86400);
response.addCookie(cookie);
%>


<script>
window.close()
</script>

</body>
</html>

<!--  닫는 window.close()스크립트문장은 스크립틀릿 밑에 있어야 하겠지? 쿠키생성하고 던져준다음에 닫도록 
어차피 JSP코드 먼저 서버에서 처리하고 던져주는거라 상관없나
-->