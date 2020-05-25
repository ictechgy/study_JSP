<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서 등록</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도 서 등 록 페 이 지</h2>
	<hr color="green" width="300">
	<form name="insert" method="post" action="insert_ok.jsp">
		<table border="1">
			<tr>
				<td>
					도서명 : <input type="text" name="name"><br>
					출판사 : <input type="text" name="publisher"><br>
					지은이 : <input type="text" name="writer"><br>
					판매가 : <input type="text" name="price"><br>
					<input type="submit" value="등록">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>