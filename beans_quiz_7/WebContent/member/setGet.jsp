<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mb" class="members.MemberDTO"/>
아이디 : <jsp:getProperty property="id" name="mb"/><br>
비밀번호 : <jsp:getProperty property="pwd" name="mb"/><br>

정보 변경한 후 변경된 정보 출력하기<p>
<jsp:setProperty name="mb" property="id" value="홍길동"/>
<jsp:setProperty name="mb" property="pwd" value="1234"/>

아이디 : <jsp:getProperty property="id" name="mb"/><br>
비밀번호 : <jsp:getProperty property="pwd" name="mb"/><br>

</body>
</html>












