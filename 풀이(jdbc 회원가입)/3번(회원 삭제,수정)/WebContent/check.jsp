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
if (request.getParameter("id") != null) {
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, "jsp", "1234");
	Statement stmt = conn.createStatement();
	String query = "select * from members where id = '" + id + "'";
	ResultSet rs = stmt.executeQuery(query);

	if (rs.next()) {
		if (rs.getString("pwd").equals(pwd)) { 
			session.setAttribute("sessionName", rs.getString("name"));
			session.setAttribute("sessionId", rs.getString("id"));
			out.print("<script>location.href = 'main.jsp';</script>");
		} else {
			out.print("<script>alert('비밀번호가 일치하지 않습니다..');" 
			+ "history.back();</script>");
		}
	} else {
		out.print("<script>alert('일치하는 아이디가 없습니다.');" 
				+ "history.back();</script>");
	}
} else {
	response.sendRedirect("login.jsp");
}
%>

</body>
</html>