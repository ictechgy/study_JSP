<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

쿠키는 클라이언트가 가지고 있으며 브라우저를 종료해도 남아있다. 브라우저별로 따로 관리하는지는 모르겠다.
사용자가 어떤 사용자인지, 이전에 접속했던 사용자인지등을 식별한다.

세션은 브라우저가 살아있는동안은 사용자를 식별하기위해 서버에서 쓰는 값이다.
브라우저가 살아있다면, 한번 로그인에 성공한 유저는 페이지를 이동해도 로그인이 유지되도록 해준다.(HTTP의 비연결성 극복)
브라우저를 끈다면 세션은 사라지고, 로그인은 풀린다.
(pageContext request session application)



<%
	session.setAttribute("id", "gildong");
	session.setAttribute("age", "23");
	session.setAttribute("key", "a123");
	//두번째 인자값이 항상 문자열일필요는 없다.
%>
<h1>세션이 설정 되었습니다.</h1>
<br>
<a href="getSession.jsp">getSession(세션 확인) 이동</a><br>
<a href="delSession.jsp">delSession(세션 삭제) 이동</a><br>





</body>
</html>