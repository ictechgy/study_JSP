<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>include ���þ�</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>�̸�</th><th>����</th>
		</tr>
		<%@ include file="test2.jsp" %> 		<!-- �ڵ尡 ����� �°Ͱ� �����ϴ�. �ҽ��� ��°�� �����ͼ� ���⿡�� �������� �Ѵ�.-->
	</table>
	
	<!-- include�δ� �ַ� �޴��ٰ����� ���� ������������ �� ����? -->
</body>
</html>