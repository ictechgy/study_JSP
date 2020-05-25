<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="members.MemberDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
각종 태그들... 페이지 작성을 조금 더 용이하게 해보자.

<jsp:useBean id="mb" class="members.MemberDTO"/>   객체생성문. <% MemberDTO m = new MemberDTO(); %>와 동일 (당연히 스크립틀릿에서 mb라고 객체명 만드려하면 객체명 중복으로 오류뜸)
id속성 -> 객체 이름작성
class속성 -> 클래스파일 경로 작성

하나 참고할 사항은, useBean태그는 클래스파일을 import시켜주지 않아도 됨. class속성에서 이미 클래스 경로를 써주기 때문

<b>자바 빈(Bean) 객체 생성 후 저장된 정보 출력하기</b><p>
이름 : <%= mb.getName() %><br>
아이디 : <%= mb.getId() %><br>

<b>정보 변경한 후 변경된 정보 출력하기</b><p>
<%
	mb.setName("홍길동");
	mb.setId("1234");
%>
이름 : <%= mb.getName() %><br>
아이디 : <%= mb.getId() %><br>

객체를 두가지 방식으로 만들 수 있다. 기존에 우리가 자바코드를 쓰기 위해서 스크립틀릿을 썼듯, 스크립틀릿을 통해 만들거나 아니면 useBean태그를 사용하여 만들면 된다.
useBean을 쓰는 이유? 그냥 스크립틀릿으로 객체를 만들어도 되는데..
</body>
</html>