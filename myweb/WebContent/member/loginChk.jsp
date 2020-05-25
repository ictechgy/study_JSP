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
<jsp:setProperty name='user' property="*"/>
왜 Bean생성은 id로 하고 property에서 지정은 name으로 하는걸까

<jsp:useBean id='db' class="members.memberDAO"/>

<%
	int cnt = db.loginChk(user);

	if (cnt == 1){
		session.setAttribute("id", user.getId());
		%>
		<script>
			alert('로그인되었습니다.')
			location.href="successLogin.jsp"
		</script>
		<%
	}
	
	else if(cnt==0){
		%>
		<script>
			alert('비밀번호가 일치하지 않습니다.')
			history.back()
		</script>
		<%
	}
	else{
		%>
		<script>
			alert('아이디가 존재하지 않습니다.')
			history.back()
		</script>
		<%
	}
	
	
%>

</body>
</html>