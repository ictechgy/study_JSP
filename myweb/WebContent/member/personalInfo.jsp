<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="members.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="..\default\header.jsp"/>

<div align='center'>
<h1>개인정보</h1>

<% 
	String id = request.getParameter("id");
	memberDAO db = new memberDAO();
	memberDTO m = new memberDTO();  //useBean해도 됨
	
	m = db.personalView(id);

%>
아이디 : <%= m.getId() %><br>
비밀번호 : <%= m.getPwd() %><br>
이름 : <%= m.getName() %><br>
주소 : <%= m.getAddr() %><br>
전화번호 : <%= m.getTel() %><br>

</div>

<jsp:include page="..\default\footer.jsp"/>


</body>
</html>