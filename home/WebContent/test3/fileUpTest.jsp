<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� �׽�Ʈ</title>
</head>
<body>
	<div align="center">
		<h2>���Ͼ��ε� �׽�Ʈ</h2>
		<form name="f" method="post" enctype="multipart/form-data" action="resultTest.jsp">
			<table border="1">
				<tr>
					<th>�ø���</th><td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>���ϸ�</th><td><input type="file" name="filename"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="���Ͽø���"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>