<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	if(session.getAttribute("logeduser")==null){
		response.sendRedirect("login.jsp");
	}

	out.print(session.getAttribute("logeduser")+"님 안녕하세요!<br>"   //getter가 Object형 반환이기는 한데, 바로 출력은 되네
	+"저희 홈페이지에 방문해주셔서 감사합니다.<br>"
	+"즐거운 시간 되세요~");
%>

<form action="logout.jsp" method="post">
	<input type='submit' value="로그아웃">
	<input type='button' value='로그인페이지' onclick='location.href="login.jsp"'>
</form>

이미 로그인이 되어있는데, 로그인페이지로 가려는 경우 처리방법에 대하여..
방법이 두가지가 있다. 이 페이지는 이미 로그인 한 유저만 접속할 수 있으니 바로 로그인되어있다는 페이지로 가게 만들거나
아니면 로그인페이지로 가지기는 하는데 세션값이 있다면 로그인되어있다는 페이지로 가게 만들거나
또는 선생님처럼 세션의 유무에 따라서 login.jsp파일의 실행코드문이 다르게 작성할 수도 있다.



</body>
</html>