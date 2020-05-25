<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="members.*" %>  이런 import에 있어서는 자동으로 src쪽 경로가 잡혀있는듯
	<jsp:useBean id="check" class="members.MemberDAO"/>
	<%
	String id = (String)(request.getParameter("id"));
	String pwd = (String)(request.getParameter("pwd"));
	int result = check.userCheck(id, pwd);   
	if(result == 0 ){    //로그인을 시도 할때 클라이언트에서는 login.jsp를 통해 값을 보내면서 chkUser.jsp파일을 요구하고, 서버에서는 보낸 값을 통해 이 페이지를 구성하면서 어떠한 내용을 작성해서 보내줄지 결정하게 되는 것 같다.
		session.setAttribute("userId", id);    //만약 일치하는 데이터를 발견한다면 스크립트문을 작성해서 클라이언트에게 보내주고, 클라이언트에서는 또 아래의 스크립트문이 작동되어 서버에 또 successLogin.jsp파일을 요구, 서버에서는
		out.print("<script>location.href='successLogin.jsp';</script>");   //해당파일을 또 전송해주는 방식인 것 같다.
	}else if(result == 1){
		out.print("<script>alert('비밀번호가 일치하지 않습니다..');" 
				+ "history.back();</script>");  //history.back()은 이전페이지로 돌아가게 할 때 서버로부터 이전페이지를 요구시키도록 할까 아니면 그냥 이전페이지로 돌아가게? 하는걸까.. 흠
	}else{
		out.print("<script>alert('등록되지 않은 아이디 입니다.');" 
				+ "history.back();</script>");
	}
	%>

</body>
</html>