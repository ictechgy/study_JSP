<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������� ������</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>�� �� �� �� �� ��</h2>
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