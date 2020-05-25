<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>test1.jsp입니다.</h1>
<a href='/getPost/webContent.jsp'>webContent이동 합니다.</a><br>
<a href='/getPost/test1/test2/test2.jsp'>test2이동 합니다.</a><br>




<h2>선생님 풀이</h2>
<a href="../webContent.jsp">webContent로 이동합니다.</a><br>
<a href="test2/test2.jsp">test2로 이동합니다.</a><br>

또는 전체경로(절대경로)를 작성하여도 된다.<br>
<a href="/getPost/webContent.jsp">webContent로 이동합니다.</a><br>
<a href="/getPost/test1/test2/test2.jsp">test2로 이동합니다.</a><br>


</body>
</html>