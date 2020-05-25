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
if(session.getAttribute("loginUser") == null){
	response.sendRedirect("login.jsp");
}

out.print(session.getAttribute("loginUser"));
out.print("님 안녕하세요!<br>");
out.print("저희 홈피에 방문해 주셔서 감사<br>");
out.print("즐거운 시간 되세요 ~ <br>");
out.print("<form method='post' action='logout.jsp'>");
out.print("<input type = 'submit' value='로그아웃'>");
out.print("<input type = 'button' value='로그인페이지' onclick='location.href=\"login.jsp\"'>");  //따옴표에 주의
//로그인이 되어있는데도 로그인페이지로 이동이 가능해짐.. 로그아웃이 되도록 만들거나.. 이미 로그인이 되어있다고 하고 다른페이지로 가도록 만들거나 또는 로그인되어있는지여부에 따라 실행되는 로그인페이지 코드가 다르게 만들거나
out.print("</form>");
%>

로그인에 성공하고 세션생성을 끝냈을 때.. 뒤로가기를 눌러 이전페이지를 요구하는 경우
그러한 경우에도 세션은 남아있을테고.. 다시 로그인페이지로 돌어가 기존 아이디나 다른 아이디로 또 로그인하려는 경우 등..
여러가지 복잡한 상황들이 좀 남아있기는 하다.

URL로 main에 바로 접근하려는 경우. 그러면 로그인하지도 않았으므로 null님 안녕하세요라고 뜸
따라서 세션이 없는 사용자에 대해서는 접근불가능하도록 설정해주어야함 -> if문으로 설정
밑에 있는 로그인성공시의 메시지는 else로 묶어도 되고 안묶어도 됨
</body>
</html>