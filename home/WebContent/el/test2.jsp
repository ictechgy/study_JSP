<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ǥ����� ����2</title>
</head>
<body>
	<h3>ǥ����� ��� ���� 2 : �Ķ���� �� ó��</h3>
	<hr>
	<form method="post">
		�̸� : <input type="text" name="name">
		<input type="submit" value="Ȯ��">
	</form>
<%request.setCharacterEncoding("euc-kr"); %>
	<h3>�Է��Ͻ� �̸��� ${param.name}�Դϴ�.</h3>
<%
	String name = request.getParameter("name");
%>
	<hr color="red">
	<h3>�Է��Ͻ� �̸��� <%=name %>�Դϴ�.</h3>
</body>
</html>