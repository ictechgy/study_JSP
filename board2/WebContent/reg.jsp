<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dto" class="testBoard.TestDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="testBoard.TestDAO"/>
위에서는 기존처럼 스크립틀릿을 통해 request메소드와 dto의 setter를 이용해도 된다.
<%

	dao.insert(dto);
	response.sendRedirect("list.jsp");
%>



</body>
</html>