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
		if (session.getAttribute("sessionName") == null) {
	%>
	<script>
		alert('로그인한 회원만 접근 가능합니다.');
		location.href = "login.jsp";
	</script>
	<%
		} else {
			out.print("<script>alert('" + session.getAttribute("sessionName") + " 님 반갑습니다.');</script>");
	%>
	<h2>회원들만의 페이지.</h2>
	<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection connect = DriverManager.getConnection(url, "jsp", "1234");

			Statement stmt = connect.createStatement();
			ResultSet rs = stmt.executeQuery("select * from members");
			out.print("<table border=1 style='width:50%;'>\n");
			out.print("<tr>\n");
			out.print("<th>아이디</th>\n");
			out.print("<th>비밀번호</th>\n");
			out.print("<th>이름</th>\n");
			out.print("<th>주소</th>\n");
			out.print("<th>전화번호</th>\n");
			out.print("</tr>\n");
			while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString("id") + "</td>");
				out.print("<td>" + rs.getString("pwd") + "</td>");
				out.print("<td>" + rs.getString("name") + "</td>");
				out.print("<td>" + rs.getString("addr") + "</td>");
				out.print("<td>" + rs.getString("tel") + "</td>");
				out.print("</tr>");
			}
			out.print("</table>\n");
		}
	%>
<button onclick="location.href='logout.jsp';">로그아웃</button>
<button onclick="location.href='showInfo.jsp';">계정정보</button>

</body>
</html>