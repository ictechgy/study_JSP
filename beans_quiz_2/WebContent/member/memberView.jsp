
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="members.*"%>
<%@page import="java.util.*"%>
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
	ArrayList<MemberDTO> memberList = null;
	memberList = mb.memberView();
	for(MemberDTO dto : memberList){
		out.print("id : "+dto.getId()+"<br>");
		out.print("pwd : "+dto.getPwd()+"<br>");
		out.print("name : "+dto.getName()+"<br>");
		out.print("addr : "+dto.getAddr()+"<br>");
		out.print("tel : "+dto.getTel()+"<br>");
		out.print("=============================<br>");
	}
%>
</body>
</html>









