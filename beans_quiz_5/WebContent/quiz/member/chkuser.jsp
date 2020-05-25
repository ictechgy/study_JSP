<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="members.*" %>
	<jsp:useBean id="check" class="members.MemberDAO"/>
	<%
	String id = (String)(request.getParameter("id"));
	String pwd = (String)(request.getParameter("pwd"));
	int result = check.userCheck(id, pwd);
	if(result == 0 ){
		session.setAttribute("userId", id);
		out.print("<script>location.href='successLogin.jsp';</script>");
	}else if(result == 1){
		out.print("<script>alert('비밀번호가 일치하지 않습니다..');" 
				+ "history.back();</script>");
	}else{
		out.print("<script>alert('등록되지 않은 아이디 입니다.');" 
				+ "history.back();</script>");
	}
	%>

</body>
</html>