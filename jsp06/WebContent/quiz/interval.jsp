<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1 style="color:skyblue;">Care Lab</h1>
<h2>저희 사이트에 방문해주셔서 감사합니다.</h2>
<%=
	session.getAttribute("logeduser")+"님 로그인 상태입니다."
%>
<input type='button' value='main이동' onclick='location.href="main.jsp"'>


</body>
</html>
세션을 만드는 페이지가 chkUser.jsp에서 로그인정보가 일치하면 만들어지도록 해도 되고.. main페이지에 접속할 때 코드 첫부분에서 만들어도되는거 아닌가? 그렇게 하면 main페이지로 갈때마다 세션정보는 30분으로 계속 재갱신되는 방식이니까..


DB 저장공간.OracleXE 데이터베이스 설치
sqldeveloper 데이터공간을 조금 더 손쉽게 사용할 수 있도록 만들어진 것
데이터베이스 언어를 쓰지 않고도 GUI방식으로 만들 수 있도록 있는 툴.

run SQL Command Line

XE설치시 포트번호를 설정하는데 그 값을 이용하여 데이터베이스를 이용
관리자 아이디 비밀번호 설정

관리자가 있고 사용자가 있다. 모든권한을 가진 사용자가 관리자
PC방 사장 - 관리자, PC방 손님 - 사용자
관리자로 먼저 접근해서 관리자로 일반사용자를 만들어줘야 나중에 사용자가 접근 가능
(PC방 손님의 회원가입도 결국 관리자를 통해 만들어짐)