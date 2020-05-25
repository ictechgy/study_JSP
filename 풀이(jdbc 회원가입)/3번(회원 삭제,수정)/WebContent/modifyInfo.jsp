<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection connect = DriverManager.getConnection(url, "jsp", "1234");
String id = request.getParameter("id");
String sql = "update members set pwd=?,name=?,addr=?,tel=? where id=?";
PreparedStatement ps = connect.prepareStatement(sql);
ps.setString(1, request.getParameter("pwd"));
ps.setString(2, request.getParameter("name"));
ps.setString(3, request.getParameter("addr"));
ps.setString(4, request.getParameter("tel"));
ps.setString(5, request.getParameter("id"));
ps.executeUpdate();
session.setAttribute("sessionName", request.getParameter("name"));
response.sendRedirect("main.jsp");
%>

</body>
</html>