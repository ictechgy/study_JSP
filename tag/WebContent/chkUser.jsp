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
<jsp:param value="param_user" name="name"/>   <!--  �� ����. userPage���� name�̶�� �̸����� value���� ������ �� ���� -->
</jsp:forward>
<%}else{%>
<jsp:forward page="adminPage.jsp">
<jsp:param value="param_admin" name="name"/>
</jsp:forward>
<%}%>

�̷��� �ؼ� chkUser.jsp�����̶�� �̸����� ������� ������ ���� ���� �ٸ� �� �������� ��� �� ����. chkUser.jsp������ ��¥ ������ ����ä �� �̸����� userPage.jsp �Ǵ� adminPage.jsp������ �ʿ信���� ��ü�ذ��鼭 ����

</body>
</html>