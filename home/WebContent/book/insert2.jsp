<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� �� �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name="insert" method="post" action="insert_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					������ : <input type="text" name="name"><br>
					���ǻ� : <input type="text" name="publisher"><br>
					������ : <input type="text" name="writer"><br>
					�ǸŰ� : <input type="text" name="price"><br>
					<input type="submit" value="���">
					<input type="reset" value="�ʱ�ȭ">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>