<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
���̵� : <%= request.getParameter("id") %><br>
��й�ȣ : <%= request.getParameter("pwd") %><br>
����� : <%= request.getParameter("user") %><br>
param value : <%= request.getParameter("name") %><br>
<a href='javascript:history.back()'>����</a>

'����'���ڸ� ������ login.jsp���Ϸ� ���ư�. �ű��Ѱ� �±׾ȿ� �ڹٽ�ũ��Ʈ�� ������ ������ �ۼ��ߴٴ� ��. �ڹٽ�ũ��Ʈ�� �⺻������ ���ǵǾ��ִ� �޼ҵ带 ������ ������ �� ��. �׳� history.back()������ �ν� �������� ���ǵǾ��ִ°� ���?
��ġ onclick���� �츮�� �޼ҵ���� ������׵�.. �ش� �������� ����ʿ��� �����س��� �޼ҵ� ����

forward�±׸� ���� ���鵵 �� ���� �Ѱ���. ���� �� ����������(����)���� �״�� request�� ���� �� ����.. forward�� ���� �� ���� �Ѱ��شٰ� ���� ��

</body>
</html>

