<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");  //반환형은 무조건 Object
	if(id==null||id.trim().equals("")){ %>
		<script type="text/javascript">
			alert('로그인을 먼저 해주세요!')
			location.href="sessionTest1.jsp"
		</script>
<%	}%>
<h1>로그인 하신 분만 들어올 수 있는 페이지</h1>
<h2>로그인 안한분이 들어오면 안됩니다.</h2>
<h3><a href="resultTest3.jsp">로그아웃</a></h3>
</body>
</html>