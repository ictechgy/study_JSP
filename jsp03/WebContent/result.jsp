<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% String a = request.getParameter("test"); 
String sex = request.getParameter("s"); 

%>
입력하신 값은 <%=a %>이고, <br>
당신은 <%=sex %>이군요


value와 name등을 통해서 회원가입페이지를 만들고 취미등을 받아서 사람별로 특화된 정보를 전송해줄 수 있다..
</body>
</html>