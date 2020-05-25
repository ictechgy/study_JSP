<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id='user' class="members.memberDTO"/>
<jsp:setProperty name='user' property='*'/>
<jsp:useBean id='db' class="members.memberDAO"/>
<%
	int cnt = db.registerChk(user);
	if (cnt == 1){%>
	<script>
		alert("아이디가 이미 존재합니다.")
		history.back()
	</script>
	<%
	}
	else{
		%>
		<script>
			alert("회원가입에 성공하였습니다! 로그인페이지로 이동합니다.")
			location.href="login.jsp"
		</script>
		<%
	}
	//물론 이 페이지에서 세션도 생성하고 로그인이 완료 된 메인페이지로 넘길 수도 있긴 하다. 하지만 일반적인 페이지들처럼 로그인창으로 가도록 만들었다.
%>


</body>
</html>