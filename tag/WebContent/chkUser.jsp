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
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String user = request.getParameter("user");
if(user.equals("user")){
%>
<jsp:forward page="userPage.jsp">
<jsp:param value="param_user" name="name"/>   <!--  값 전송. userPage에서 name이라는 이름으로 value값을 가져올 수 있음 -->
</jsp:forward>
<%}else{%>
<jsp:forward page="adminPage.jsp">
<jsp:param value="param_admin" name="name"/>
</jsp:forward>
<%}%>

이렇게 해서 chkUser.jsp파일이라는 이름으로 사용자의 유형에 따라 서로 다른 두 페이지를 띄울 수 있음. chkUser.jsp파일의 진짜 내용은 숨긴채 그 이름으로 userPage.jsp 또는 adminPage.jsp몸통을 필요에따라 교체해가면서 실행

</body>
</html>