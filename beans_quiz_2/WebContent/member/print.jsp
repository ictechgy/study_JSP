<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<jsp:setProperty name="mb" property="*"/>
==============================================<br>
id : <%= mb.getId() %><br>
pwd : <%= mb.getPwd() %><br>
name : <%= mb.getName() %><br>
addr : <%= mb.getAddr() %><br>
tel : <%= mb.getTel() %><br>
</body>
</html>










