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
<!-- 로그인을 했든 안했든 회원정보라는 메뉴가 보이기는 하는데 연결되있는 링크가 다르게 만드셨구나. 나는 그냥 회원정보 자체를 memberInfo.jsp로 연결시켜놓고 해당 페이지에서 로그인유효성검사를 진행했는데. -->

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














