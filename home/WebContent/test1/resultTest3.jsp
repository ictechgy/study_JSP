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
	session.removeAttribute("id");
	session.invalidate();	//사용자가 로그아웃을 누른다면 서버에서 해당 사용자에 대해 만든 모든 세션값 삭제
%>
<script type="text/javascript">
	alert('로그아웃되었습니다.')
	location.href="sessionTest1.jsp"
</script>
</body>
</html>