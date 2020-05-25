<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(session.getAttribute("name")==null){%>
		<script>
			alert("잘못된 접근입니다.")             //뭐.. 바로 response.sendRedirect()쓸 수도 있었겠지.
			location.href="login.jsp"     //근데 밑에서 userName으로 받은 다음에 userName==null인 경우로 해도 됐을라나 조건식을?
		</script>
	<%
	}
	String userName = (String)session.getAttribute("name");  //Object형으로 돌려주므로 형변환 필요. 인자로 쓰는 건 따옴표로 묶어야
	
%>
	<script>
		alert("<%=userName%>"+"님 환영합니다.")
		//alert(< %= userName % > "님 환영합니다") 뭐 이런식으로 쓰니까 작동 안함
	</script>

<h1>회원들만의 페이지</h1>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe", dbId="jsp001", dbPwd="1234";
	Connection conn = DriverManager.getConnection(url, dbId, dbPwd);
	Statement stmt = conn.createStatement();
	String sql = "select * from members";
	
	ResultSet rs = stmt.executeQuery(sql);
%>
<table border='1'>
	<tr>
		<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th>
	</tr>
<%
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>"+rs.getString("id")+"</td>");
		out.print("<td>"+rs.getString("pwd")+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
		out.print("<td>"+rs.getString("addr")+"</td>");
		out.print("<td>"+rs.getString("tel")+"</td>");
		out.print("</tr>");
	}
%>
</table>

<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<input type='button' value='계정정보' onclick='location.href="showinfo.jsp"'>




</body>
</html>