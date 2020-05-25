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
<h1>삭제되었습니다</h1>
<%
int result=check.delete(request.getParameter("id"));
System.out.print("\n삭제 아이디 : "+request.getParameter("id"));
if(result == 0){
	session.invalidate();
	out.print("<script>alert('삭제 되었습니다');"
			+ "location.href='login.jsp';</script>");
}else{
	out.print("<script>alert('문제가 발생 되었습니다');" 
			+ "history.back();</script>");
}
%>

</body>
</html>