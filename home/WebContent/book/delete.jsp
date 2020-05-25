<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 삭제 페이지</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도 서 삭 제 페 이 지</h2>
	<hr color="green" width="300">
	<form name="delete" method="post" action="delete_ok.jsp">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name">
					<input type="submit" value="삭제">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>