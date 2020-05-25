<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1'>
	<tr>
		<th>제목</th><th>조회수</th>
	</tr>
	<tr>
		<td><a href='cnt.jsp'>안녕하세요</a></td>
		<td><%= application.getAttribute("count") %></td>
	</tr>
</table>

처음에는 값이 설정되어있지 않으므로 null이라고 뜸
if문을 통해서 count값이 null이라면 0이라고 값을 대입하는 식을 두어도 됨.. 그러면 나중에 게시글 갔을 때 조회수는 1이 될테고 이 페이지로 돌아와도 0으로 다시 돌아가지는 않음



</body>
</html>