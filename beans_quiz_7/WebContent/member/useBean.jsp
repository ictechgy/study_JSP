<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<b>�ڹ� �� ��ü ���� �� ����� ���� ����ϱ�</b><p>
�̸� : <%= mb.getName() %><br>
���̵� : <%= mb.getId() %><br>
<b>���� ������ �� ����� ���� ����ϱ�</b><p>
<%
mb.setName("ȫ�浿");
mb.setId("1234");
%>
�̸� : <%= mb.getName() %><br>
���̵� : <%= mb.getId() %><br>
</body>
</html>










