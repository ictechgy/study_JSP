<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="members.MemberDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
���� �±׵�... ������ �ۼ��� ���� �� �����ϰ� �غ���.

<jsp:useBean id="mb" class="members.MemberDTO"/>   ��ü������. <% MemberDTO m = new MemberDTO(); %>�� ���� (�翬�� ��ũ��Ʋ������ mb��� ��ü�� ������ϸ� ��ü�� �ߺ����� ������)
id�Ӽ� -> ��ü �̸��ۼ�
class�Ӽ� -> Ŭ�������� ��� �ۼ�

�ϳ� ������ ������, useBean�±״� Ŭ���������� import�������� �ʾƵ� ��. class�Ӽ����� �̹� Ŭ���� ��θ� ���ֱ� ����

<b>�ڹ� ��(Bean) ��ü ���� �� ����� ���� ����ϱ�</b><p>
�̸� : <%= mb.getName() %><br>
���̵� : <%= mb.getId() %><br>

<b>���� ������ �� ����� ���� ����ϱ�</b><p>
<%
	mb.setName("ȫ�浿");
	mb.setId("1234");
%>
�̸� : <%= mb.getName() %><br>
���̵� : <%= mb.getId() %><br>

��ü�� �ΰ��� ������� ���� �� �ִ�. ������ �츮�� �ڹ��ڵ带 ���� ���ؼ� ��ũ��Ʋ���� ���, ��ũ��Ʋ���� ���� ����ų� �ƴϸ� useBean�±׸� ����Ͽ� ����� �ȴ�.
useBean�� ���� ����? �׳� ��ũ��Ʋ������ ��ü�� ���� �Ǵµ�..
</body>
</html>