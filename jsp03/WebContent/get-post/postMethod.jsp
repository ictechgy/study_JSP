<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

한글처리방식
<% request.setCharacterEncoding("UTF-8"); %>

<h1>postMethod</h1>
id : <%= request.getParameter("id") %>
pw : <%= request.getParameter("pwd") %>

한글처리를 따로 해줘야 사용자가 한글을 입력했다고 해도 잘 쓸 수 있음. 







<% request.setCharacterEncoding("UTF-8"); %>
이전 페이지에서 보낸 값 : <%= request.getParameter("space2") %>

<a href="../webContent.jsp">webContent이동</a><br>
<a href="../test1/test01.jsp">test1이동</a><br>
<a href="../test1/test2/test02.jsp">test2이동</a><br>





선생님풀이
<a href="/jsp03/webContent.jsp">webContent 이동</a><br>
<a href="/jsp03/test1/test01.jsp">test1 이동</a><br>
<a href="/jsp03/test1/test2/test02.jsp">test2이동</a>



</body>
</html>