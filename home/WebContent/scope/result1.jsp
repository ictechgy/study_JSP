<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj" class="home.count.Count" scope="request"/><!-- �̹� obj ��ü�� �����Ѵٸ� ���� ���������� �ʴµ� -->
<h1>Result1.jsp�������Դϴ�.</h1>
<b>request : obj�� getCount() : </b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test.jsp">test</a>
<jsp:setProperty property="count" value="100" name="obj"/>
</body>
</html>