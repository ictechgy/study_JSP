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
out.print("third Page<br>");

out.print("하나의 페이지 속성 : " + pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성 : " + request.getAttribute("name")+"<br>");
out.print("하나의 세션 속성 : " + session.getAttribute("name")+"<br>");
out.print("하나의 앱 속성 : " + application.getAttribute("name")+"<br>");
%>
다른페이지에서 값을 불러다 쓰느냐 / 값을 던져줬느냐 / 브라우저를 안껐느냐 / 서버가 유지되었는가
그리고 setter가 있는곳이 실행되었느냐

뭐 이러한 상황에 따라 결과값은 달라진다. 

만약 우리가 setAttribute가 있는 firstPage를 키지 않고 다른 페이지를 브라우져 켜서 먼저 들어가면 세션쪽 값도 null이 뜸
(set을 쓴 적이 없으므로)

만약 브라우저가 하나 켜진상태에서 다른 브라우저를 또 키고 접속을 한다면 세션속성은 그대로 동기화될까
ㅇㅇ 살아있네

서버를 아예 끝냈다가 바로 setter가 있는 firstPage이 아닌 다른 페이지를 들어가면 앱(application)쪽도 null값 뜸

그래서 서버가 꺼지면 기존에 있던 값(application attribute value)이 소실되므로.. 서버가 꺼질때를 대비하여 서버는 백업을 해둠..

</body>
</html>