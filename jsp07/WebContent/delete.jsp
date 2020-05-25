<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
이번에는 삭제에 대해서 알아보자.

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, id, pwd);
	String sql = "delete from student where num=?";
	int num = 123;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.executeUpdate();  //num값이 123인 행의 데이터를 삭제. 
%>
<a href='jdbc.jsp'>목록 이동</a>



</body>
</html>