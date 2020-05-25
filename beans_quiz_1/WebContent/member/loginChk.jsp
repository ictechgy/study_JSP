
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="members.MemberDTO"%>
<%
String saveId = "test";
String savePwd = "1234";

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberDTO m = new MemberDTO();

m.setId(saveId); m.setPwd(savePwd);

if(id.equals(m.getId()) && pwd.equals(m.getPwd())){
	out.print(m.getId()+"님 반갑습니다");
}else { out.print("회원정보가 존재하지 않습니다"); }
%><br>
<a href="javascript:history.back()">이전</a>
</body>
</html>




