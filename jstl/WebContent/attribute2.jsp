<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

�׳� ��� : ${name}<br>
page �Ӽ� : ${ pageScope.name }<br>
request �Ӽ� : ${ requestScope.name }<br>
session �Ӽ� : ${ sessionScope.name }<br>
application �Ӽ� : ${ applicationScope.name }<br>

�׳� name�̶�� ���� page - request - session - application ������ �Ӽ��� ã�Ƴ����ٰ� ���� �ִ� �� �߰��ϸ� �� ���� attribute�� ����Ѵ�.
�������������� �Ӽ����� �������־��µ� page���� ������ �������� ������ null���ϻ��̰� request�� �������������� ���� �����ϴ��� �������� �ʴ��Ŀ� ���� ��¿��ΰ� �޶�����.
form�±׸� �̿��� ���� �����ָ� request�Ӽ��ʵ� ����� �� ��.
��ư �׷��� ���� ������ �� ������ name�� �� �κп��� session attribute���� ���´�.

</body>
</html>