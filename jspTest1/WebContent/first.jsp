<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <!-- page���þ�� �� �Ӽ����� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ù��° ����</title>
</head>
<body>
	<h1>Hello JSP 1</h1>
	<h2>Hello JSP 2</h2>
	<h3>Hello JSP 3</h3>
	<h4>Hello JSP 4</h4>
	<h5>Hello JSP 5</h5>
	<h6>Hello JSP 6</h6>
	<%for (int i=1; i<=9; ++i){ %>
	<!-- ��ũ��Ʋ�� : �ڹ��ڵ带 HTML�ڵ�� ���� �Է��� �� �ֵ��� ���� -->
			<h3>Hello JSP <%=i %></h3>	<!-- ǥ����(ǥ����ũ��Ʋ��) : �ڹ��ڵ� �� ��ºκ��� ���� ����� �� �ֵ��� ���� -->
	<%} %>
	<!-- ��ũ��Ʋ�� �ڵ�� ���� ������ �ҽ��δ� �� �� ����. �������� �� ó���ؼ� html���Ϸθ� ���� Ŭ���̾�Ʈ�� �ѱ�Ƿ� -->
</body>
</html>