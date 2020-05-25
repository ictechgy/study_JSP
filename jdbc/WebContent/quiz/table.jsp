<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, id, pwd);
	
	Statement stmt = conn.createStatement();
	
	String sql = "select * from student";
			
	ResultSet rs = stmt.executeQuery(sql);
	
%>

<table border = '1'>

	<tr>
		<th>학번</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th>
	</tr>

	<tr><%rs.next(); %>			
		<td><%=rs.getString("num") %></td><td><a href="result.jsp?name=<%=rs.getString("name") %>"><%=rs.getString("name") %></a></td>
		<td><%=rs.getString("kor") %></td><td><%=rs.getString("eng") %></td><td><%=rs.getString("math") %></td>
	</tr>
	
	
	<tr><%rs.next(); %>
		<td><%=rs.getString("num") %></td><td><a href="result.jsp?name=<%=rs.getString("name") %>"><%=rs.getString("name") %></a></td>
		<td><%=rs.getString("kor") %></td><td><%=rs.getString("eng") %></td><td><%=rs.getString("math") %></td>
	</tr>
	
	
	<tr><%rs.next(); %>
		<td><%=rs.getString("num") %></td><td><a href="result.jsp?name=<%=rs.getString("name") %>"><%=rs.getString("name") %></a></td>
		<td><%=rs.getString("kor") %></td><td><%=rs.getString("eng") %></td><td><%=rs.getString("math") %></td>
	</tr>

</table>

일단 스크립틀릿 안에 html코드가 들어갈 수는 없다. 스크립틀릿에서 미리 스크립틀릿들을 다 처리하고 html코드로 만든뒤 내보내는거니까.
하지만 html태그 등 안에는 스크립틀릿이 들어갈 수 있는데, 해당 스크립틀릿들이 서버에서 다 처리가 되면 자연스럽게 html태그가 되어 
클라이언트에서 실행될 수 있기 때문이다.

스크립틀릿 안에서는 스크립틀릿출력문을 만들 수 없다?!


</body>
</html>