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
		response.sendRedirect("login.jsp");
	%>
세션을 삭제하는 법에는
		session.removeAttribute(arg0)    - 특정 속성 삭제
		session.setMaxInactiveInterval(arg0)  - 세션만료시간 설정(단위 : 초)
이러한 메소드도 존재한다.
invalidate() 및 setMaxInactiveInterval()메소드같은 경우에는 다른 페이지를 위한 세션에도 영향을 미치는거 아닐까..?

쿠키삭제는 그냥 setMaxAge(0)하고 다시 response.addCookie로 돌려주는건데

</body>
</html>