<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="check" class="members.MemberDAO"/>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="mb"/>
<%
String id = request.getParameter("id");
int result = check.changeUser(mb);
System.out.print("결과 값 : "+result);
if(result == 1){
		out.print("<script>alert('변경 되었습니다.');"
					+"location.href='userInfo.jsp?id="+id+"';</script>");
}else{
		out.print("<script>alert('문제가 발생하였습니다. 관리자에게 문의하세요.');"
				+"location.href='userInfo.jsp?id="+id+"';</script>");
}
%>

</body>
</html>