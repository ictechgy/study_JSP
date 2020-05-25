<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		Connection conn = DriverManager.getConnection(url, "jsp001", "1234");
		
		String userId = (String)session.getAttribute("id");
		
		String sql = "delete from members where id='"+userId+"'";
		
		Statement st = conn.createStatement();
		
		int cnt = st.executeUpdate(sql);
		
		if(cnt == 1){
			session.invalidate();
			%>
			<script>
				alert('회원정보가 삭제되었습니다.')
				location.href='login.jsp'
			</script>
			<%
		}
	%>
	

</body>
</html>