<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

그냥 출력 : ${name}<br>
page 속성 : ${ pageScope.name }<br>
request 속성 : ${ requestScope.name }<br>
session 속성 : ${ sessionScope.name }<br>
application 속성 : ${ applicationScope.name }<br>

그냥 name이라고만 쓰면 page - request - session - application 순서로 속성값 찾아나가다가 값이 있는 곳 발견하면 그 곳의 attribute를 출력한다.
이전페이지에서 속성값을 지정해주었는데 page쪽은 어차피 존재하지 않으니 null값일뿐이고 request는 이전페이지에서 값을 전송하느냐 전송하지 않느냐에 따라서 출력여부가 달라진다.
form태그를 이용해 값을 던져주면 request속성쪽도 출력은 될 듯.
무튼 그래서 현재 위에서 맨 윗줄의 name만 쓴 부분에는 session attribute값이 나온다.

</body>
</html>