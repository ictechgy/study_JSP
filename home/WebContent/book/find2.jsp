<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �˻�</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� ã �� �� �� ��</h2>
	<hr color="green" width="300">
	<form name="find" method="post" action="find_ok2.jsp">
		<table border="1">
			<tr>
				<td>
					<select name="search">
						<option value="name">������
						<option value="publisher">���ǻ�
						<option value="writer">������
					</select>
					<input type="text" name="searchString">
					<input type="submit" value="ã��">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>