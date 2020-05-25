<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
선생님 공유폴더 - cook_session폴더의 index.jsp 및 popup.jsp, makeCookie.jsp참고

cookieArr에 null값이 들어갈 수도 있다. 사용자에게 처음에 쿠키를 던진게 없으니 아무 쿠키도 들어오지 않을 때가 있을수도
그런 경우에는 반복문에서 에러가 발생하므로 처리해주어야한다..예외처리

<%
boolean chk = false;
Cookie[] cookieArr = request.getCookies();
if(cookieArr != null){
	for (Cookie c : cookieArr){
		if(c.getName().equals("myCookie")){
			chk=true;
		}
	}
}

if(chk==false){
%>
<script>window.open("popup.jsp")</script>

<%} %>


쿠키는 클라이언트 컴퓨터에 남아있어서 브라우저를 닫아도 존재하게 됨(유효시간동안)
-> 쿠키삭제나 인터넷기록삭제를 통해 없앨 수 있다.
브라우저별로 쿠키는 따로 관리되는건가?

Path나 Domain은 쿠키의 경로설정을 하는 건데, 쿠키가 저장되는 경로를 변경?
저장되는 경로인지 아니면 쿠키가 특정 URL에 접속했을때에만 보내지도록 하는건지(기본적으로 서버에 페이지를 요청할 때 쿠키를 모두 던지기는 하니까.. request로 서버에서 받아서 처리하든 그렇지 않든)


setMaxAge안에 유효정수값을 넣을 때 식을 넣을 수 있다.


네이버 또는 구글 jsp쿠키검색

쿠키값을 지우는건 setMaxAge의 인자값을 0으로 설정하고 다시 던져주면 됨



http는 비연결성, 쿠키나 세션은 사용자를 식별하기위함
쿠키는 클라이언트관리라 보안에 취약하지만, 서버에 부하가 적어진다

세션..
브라우저가 살아있는동안은 유지되는 값. 서버에서 관리
보안이 조금 강하다. 

로그인에 성공한 유저냐 아니냐를 구분할 때 세션을 가지고 비교를 한다.

</body>
</html>