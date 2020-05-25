<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="home.count.Count" scope="request"/>
<jsp:setProperty property="count" name="obj"/>
<h2>Request scope</h2>
<b>obj의 getCount() 호출 :</b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="result1.jsp">result</a>
<%-- <jsp:forward page="result1.jsp"></jsp:forward> --%>
<jsp:include page="result1.jsp"></jsp:include>
<br>
<h2>다시 돌아온 값</h2>
<jsp:getProperty property="count" name="obj"/>
</body>
</html>