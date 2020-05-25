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
	String se = (String)session.getAttribute("sessionName");
	if(session.getAttribute("sessionName")==null){
		out.print("<script>alert('로그인 하세요');"+
			"location.href='login.jsp';</script>");
	}else{
		out.print("<script>alert('"+se+"님 환영합니다')</script>");
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	Connection conn =  DriverManager.getConnection(url,id,pwd);
	Statement stmt = conn.createStatement();
	String sql = "select * from members";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.print("아디 : "+rs.getString("id")+"<br>");
		out.print("비번 : "+rs.getString("pwd")+"<br>");
		out.print("이름 : "+rs.getString("name")+"<br>");
	}
%>
<button type="button" onclick='location.href="logout.jsp"'>로그아웃</button>
</body>
</html>











