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
�̹����� ������ ���ؼ� �˾ƺ���.

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
	pstmt.executeUpdate();  //num���� 123�� ���� �����͸� ����. 
%>
<a href='jdbc.jsp'>��� �̵�</a>



</body>
</html>