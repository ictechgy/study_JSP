<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ǥ����� ����3</title>
</head>
<body>
<%
	request.setAttribute("name", "ȫ�浿");
%>
<h3>ǥ����� ��� ���� 3 : scope ó��</h3>
<hr>
��û URI : ${pageContext.request.requestURI}<br>
request�� name �Ӽ� : ${requestScope.name}<br>
</body>
</html>