<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	ul li{display:inline; padding:0 30px}
</style>

</head>

<body>
<div align='center' style="padding-top: 30px;">
<h1 style="color:rgb(128,128,192); font-size:50px; font-family:나눔고딕코딩;">Coding Station</h1>
<hr>
<ul>
	<li><a href="..\member\index.jsp">HOME</a></li>
	<li>자유게시판</li>
	<li>
	<%if (session.getAttribute("id")==null){ %>
	<a href="..\member\login.jsp">로그인</a>
	<%}else{ %>
	<a href="..\member\logout.jsp">로그아웃</a>
	<%} %>
	</li>
	<li>ABOUT</li>
	<li><a href="..\member\memberInfo.jsp">회원정보</a></li>
	<%if (session.getAttribute("id")!=null) {%>
		<li><a href="..\member\userInfo.jsp">내정보 수정</a></li>
	<%} %>
</ul>
<hr>

</div>

</body>
</html>

<!-- &nbsp 공백효과. html에서는 아무리 공백을 띄워놓아도 한칸으로만 줄여놓는데 그걸 막기위해서 씀 -->