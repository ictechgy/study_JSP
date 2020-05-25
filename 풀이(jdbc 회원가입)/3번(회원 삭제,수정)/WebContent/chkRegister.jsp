<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
request.setCharacterEncoding("utf8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
String sql = "insert into members values(?,?,?,?,?)";
Class.forName("oracle.jdbc.driver.OracleDriver");
String driv="jdbc:oracle:thin:@localhost:1521:xe";
Connection conn = DriverManager.getConnection(driv, "jsp", "1234");
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);   pstmt.setString(2, pwd);
pstmt.setString(3, name); pstmt.setString(4, addr);
pstmt.setString(5, tel);
int howRow = 0 ;
howRow = pstmt.executeUpdate();
if(howRow == 1){
	out.print("<script>alert('회원가입을 축하합니다.');"
				+"location.href='login.jsp';</script>");
}else{ out.print("문제가 발생하였습니다. 관리자에게 문의하세요."); }
%>
</body>
</html>