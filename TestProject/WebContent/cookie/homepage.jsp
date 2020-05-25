<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>안녕하세요~ 몽실나라에 오신것을 환영합니다!</h1>




<%
	boolean chk = false;
	Cookie[] cookieArr = request.getCookies();
	for (Cookie c : cookieArr){
		if (c.getName().equals("popkie")){
			chk = true;
		}
	}
%>

<% if (chk==false){ %>
<script>

	window.open("popup.jsp","new", "width=500, height=500, top=300, left=200")

</script>
<%} %>



</body>
</html>

<!-- 
쿠키는 클라이언트쪽에서 삭제가능하네.

클라이언트쪽에서 jsp파일을 받아서 실행되는 순서가.. homepage.jsp파일 받아서 여는 순간 자바스크립트코드에 의해 popup.jsp파일을 또 서버에 요구하고, 서버가 해당파일을 던져주면 두 파일이 같이 뜨게 되는 듯

체크박스 클릭하는 순간 쿠키가 생기는 것으로 보아.. 체크박스를 클릭하면 해당 링크를 서버에게 요구하게 되고 서버는 해당링크파일을 주려고 하는데... 쿠키를 만들어 던지면서, window.close()스크립트코드를 던짐. 
그러면 브라우저에서는 해당 스크립트를 받아 팝업페이지를 끄고 쿠키도 받아놓는 방식
이제 쿠키 받아놓으면 새로고침으로 페이지를 다시 요구해도 chk가 true가 되서 팝업스크립트 실행안되도록 만들어진 jsp파일을 받게되는듯

결국 계속 서버와 연결이 지속적으로 되어있는 상태여야지만 다 정상적으로 실행되는 구조인 듯?

 -->