<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = "1";
	String pwd= "1";
	String username = "홍길동";
	
	if ( id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))){
		session.setAttribute("logeduser", username);
		response.sendRedirect("main.jsp");
	}
	else{
%>		
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다!")
	</script>	
<%		
		response.sendRedirect("login.jsp");
	}
%>
</body>
</html>
<!--  이 페이지를 직접적으로 넘겨줘서 실행되는게 아니고 다른 페이지를 넘겨줄 뿐이라서 가운데의 스크립트문은 작동되지 않는다. 이 페이지파일이 클라이언트로 갈 일이 없음..
그걸 고치려면 그냥 로그인페이지에서 아이디 또는 비밀번호가 일치하지 않는다는 메시지를 띄우도록 login.jsp파일을 수정하거나.. 아니면 else부분을
else { %>
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다!")
		location.href="login.jsp"
	</script>
< % } %>
이런식으로 작성하면 될 듯?

로그인에실패한 경우 login.jsp파일을 바로 던지는게 아니라 이페이지의 저 스크립트문을 먼저 던진다음에 login.jsp파일을 요구받게 만들어서 login.jsp파일은 두번째로 던지는 방식으로

 -->