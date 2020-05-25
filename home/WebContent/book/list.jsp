<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서목록 페이지</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도 서 목 록 보 기</h2>
	<a href="index.jsp">메인페이지</a>
	<hr color="green" width="300">
	<table border="1" width="600">
		<tr bgcolor="yellow">
			<th>책이름</th>
			<th>지은이</th>
			<th>출판사</th>
			<th>판매가</th>
			<th>입고일</th>
		</tr>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	
	String user="kgitbank";
	String pwd="kgitbank";
	String sql="select * from book";
	Connection conn=DriverManager.getConnection(url, user, pwd);
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("publisher") %></td>
			<td><%=rs.getString("price") %></td>
			<td><%=rs.getString("joindate") %></td>
		</tr>
<%	}
	ps.close();
	rs.close();
	conn.close();
%>		
	</table>
</div>
</body>
</html>