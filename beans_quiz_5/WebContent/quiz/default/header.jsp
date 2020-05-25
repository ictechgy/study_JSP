<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<style>
		ul li{ display:inline; padding:0 30px;}
	</style>
<title>Insert title here</title>
<style type="text/css">
ul li{	display:inline;	padding:0 10px; }
</style>
</head>
<body>
<div align="center" >
<h1 style="color:burlywood; font-size:60px; font-family:Gabriola;">
CARE &nbsp; LAB
</h1></div>
<div align="right">
<hr>
<ul>
<li><a href="/beans/quiz/member/index.jsp">HOME</a></li>
<%if(session.getAttribute("userId") == null){ %>
<li><a href="/beans/quiz/member/login.jsp">회원 정보</a></li>
<%}else {%>
	<li><a href="/beans/quiz/member/memberInfo.jsp">회원 정보</a></li>
<%} %>
<%if(session.getAttribute("userId") == null){ %>
<li><a href="/beans/quiz/member/login.jsp">로그인</a></li>
<%}else {%>
<li><a href="/beans/quiz/member/logout.jsp">로그아웃</a></li>
<%} %>

</ul>
<hr>
</div>

</body>
</html>














