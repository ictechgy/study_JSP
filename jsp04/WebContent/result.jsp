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
int num = (int)session.getAttribute("views");
num++;
session.setAttribute("views", num);

%>


<h1> 게시글 입니다. </h1>

<h2> 공지사항 입니다.</h2> <p>

jsp application을 이용한 조회수 올리기 문제 입니다.<br>
<a href='quiz.jsp'>돌아가기</a>



</body>
</html>