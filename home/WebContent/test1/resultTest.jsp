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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//아이디를 admin으로, 비밀번호를 1234로 했을 때에만 로그인이 된다고 하자
	if (id.equals("admin")&&pwd.equals("1234")){ 
		session.setAttribute("id", "admin");
		session.setMaxInactiveInterval(60*30);%>
		<script type="text/javascript">
			alert('로그인이 되었습니다.')
			location.href="resultTest2.jsp"
		</script>
<% 	}%>
</body>
</html>