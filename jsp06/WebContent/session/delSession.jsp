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
	session.removeAttribute("id");
%>

<a href="setSession.jsp">setSession(세션 생성) 이동</a><br>
<a href="getSession.jsp">getSession(세션 확인) 이동</a><br>

이렇게 id라는 세션삭제하고 세션확인페이지가면 해당부분은 null로 뜸
뭐 set으로 설정하기도 전에 get페이지만 실행시키면 다 null뜨는건 당연하고..
set하지도 않았는데 이 페이지에서 remove해도 코드에러같은건 안뜰라나

세션은 기본이 30분동안 유지된다. 기본적으로 로그인같은것도 30분 지나면 로그아웃됨(즉 서버에서 세션을 삭제. 서버의 효율성을 높이기 위해서 이렇게 기본적인 제한시간을 걸어놓은건가)
session.setMaxInactiveInterval(5); 모든 세션의 유효시간이 5초가 됨 (쿠키에서 setMaxAge처럼..) - 5초가 지나면 모든 세션 만료
session.invalidate(); 세션을 전부다 무효하게 만듬



</body>
</html>