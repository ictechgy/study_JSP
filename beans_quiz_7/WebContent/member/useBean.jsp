<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<b>자바 빈 객체 생성 후 저장된 정보 출력하기</b><p>
이름 : <%= mb.getName() %><br>
아이디 : <%= mb.getId() %><br>
<b>정보 변경한 후 변경된 정보 출력하기</b><p>
<%
mb.setName("홍길동");
mb.setId("1234");
%>
이름 : <%= mb.getName() %><br>
아이디 : <%= mb.getId() %><br>
</body>
</html>










