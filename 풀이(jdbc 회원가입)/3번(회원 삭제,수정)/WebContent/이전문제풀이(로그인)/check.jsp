<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "jsp001";
String pwd = "1234";
Connection conn =  DriverManager.getConnection(url,id,pwd);
Statement stmt = conn.createStatement();
String sql = "select * from members where id='"+request.getParameter("id")+"'";

ResultSet rs = stmt.executeQuery(sql);
if(rs.next()){
	if(rs.getString("pwd").equals(request.getParameter("pwd"))){
		session.setAttribute("sessionName", rs.getString("name"));
		out.print("<script>location.href='main.jsp';</script>");
	}else{
	out.print("<script>alert('비밀번호가 틀렸습니다');history.back()</script>");
	}
}else{
	out.print("<script>alert('존재하는 아이뒤가 없습니다');history.back()</script>");
}
%>
</body>
</html>







