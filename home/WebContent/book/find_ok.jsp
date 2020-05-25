<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
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
<title>도서 찾기</title>
</head>
<body>
<div align="center">
	<hr color="green" width="300">
	<h2>도 서 [<%=search%>]찾 기</h2>
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
	String sql="select * from book where "+search+"=?";  //search부분도 ?로 두고 ps.setString(1, search); 로 넣으려 했는데 안되네
	//동적쿼리에 있어서 데이터는 ?를 이용해서 나중에 넣도록 구성한다.
	//필드명은 나중에 들어갈 수 없다. 따라서 search는 String의 덧셈으로 넣어준다.
	
	Connection conn=DriverManager.getConnection(url, user, pwd);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, searchString);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){%>
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