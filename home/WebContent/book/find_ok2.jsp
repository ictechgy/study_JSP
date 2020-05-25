<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.book.*"%>
<jsp:useBean id="bdao" class=home.book.BookDAO></jsp:useBean>
<!DOCTYPE html>
<%
	String search=request.getParameter("search");
	String searchString=request.getParameter("searchString");
	if(search==null||search.trim().equals("")||searchString==null||searchString.trim().equals("")){
		response.sendRedirect("find.jsp");
		return;
	}%>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ã��</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� [<%=search%>]ã ��</h2>
	<a href="index.jsp">����������</a>
	<hr color="green" width="300">
	<table border="1" width="600">
		<tr bgcolor="yellow">
			<th>å�̸�</th>
			<th>������</th>
			<th>���ǻ�</th>
			<th>�ǸŰ�</th>
			<th>�԰���</th>
		</tr>
<% ArrayList<BookDTO> findBook = bdao.findBook(search,searchString);
	if(findBook == null||findBook.size()==0){%>
		<tr>
			<td colspan=5>ã���ô� å�� �����ϴ�.</td>
		</tr>
	<%}else{
		for(BookDTO dto:findBook){%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getWriter() %></td>
				<td><%=dto.getPublisher() %></td>
				<td><%=dto.getPrice() %></td>
				<td><%=dto.getJoindate() %></td>
			</tr>
<%		}
	}
%>		
	</table>
</div>
</body>
</html>