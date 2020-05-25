<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="home.count.Count" scope="request"/><!-- 이미 obj 객체가 존재한다면 새로 생성하지는 않는듯 -->
<h1>Result1.jsp페이지입니다.</h1>
<b>request : obj의 getCount() : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test.jsp">test</a>
<jsp:setProperty property="count" value="100" name="obj"/>
</body>
</html>