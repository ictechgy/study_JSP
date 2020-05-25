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
<h1>삭제되었습니다</h1>   <!--  이거 출력되어보이긴 할라나 -->
<%
request.setCharacterEncoding("utf8");
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection connect = DriverManager.getConnection(url, "jsp", "1234");
String id = (String)session.getAttribute("sessionId");
String query = "delete from members where id = '"+ id +"'";
Statement stmt = connect.createStatement();
int result = stmt.executeUpdate(query);
response.sendRedirect("logout.jsp");
%>
</body>
</html>