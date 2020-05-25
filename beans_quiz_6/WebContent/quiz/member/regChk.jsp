<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="check" class="members.MemberDAO"/>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="mb"/>
<%
int howRow = 0 ;
int result = check.userCheck(mb.getId(), mb.getPwd());
if(result == -1)
	howRow = check.chkRegister(mb);
if(howRow == 1){
	out.print("<script>alert('회원가입을 축하합니다.');"
				+"location.href='login.jsp';</script>");
}else{
	out.print("<script>alert('문제가 발생하였습니다. 관리자에게 문의하세요.');"
			+"location.href='register.jsp';</script>");
}
%>

</body>
</html>