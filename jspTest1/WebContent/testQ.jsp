<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� �Է��ؼ� �ٸ� �������� �ѱ��</title>
</head>
<body>
	<form name="f" action="testR.jsp" method="post">
	<!-- method�� get����� ���� �����Ͱ� ���� �ּ�â�� ���� ���۵ȴ�. -->
	<!-- method�� post����� ���� �����Ͱ� body�� ���� ������ ���۵ȴ�. -->
	<!-- post����� �� ����ϴ� ���
		1. ���� �����͸� �����ϰ��� �� ��
		2. ��н����� �����͸� �����ϰ��� �� ��
		3. ������ �����ϰ��� �� �� -->
		�̸�:<input type="text" name="name"><br>
		����:<input type="text" name="age"><br>
		<input type="submit" value="����">
		<input type="reset" value="���">
	</form>
</body>
</html>