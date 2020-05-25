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

이번에는 기존의 데이터를 수정해보자.
그리고 계속 드라이버 불러다가 연결하고 그러는데 그냥 전담페이지 하나 만들고 include하면 안되나?

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, id, pwd);
	
	String sql = "update student set name=? where num=?";   //칼럼명 주의
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	String name = "김말이";
	int num = 10;            //update할거니까 데이터베이스에 id값이 이미 존재하는걸 가져오자
	
	pstmt.setString(1, name);
	pstmt.setInt(2, num);
	//여기까지 하면 10이라는 num값을 지닌 행의 이름데이터를 김말이로 바꾸겠다고 준비가 다 됨
	
	pstmt.executeUpdate();
	//pstmt.executeQuery(); 가능. 다만 return형태가 다름
	//따라서 출력을 할 필요가 있을 때에는 executeQuery()를 쓰고 단순히 값의 등록. 수정. 삭제를 할 때에는 executeUpdate()를 씀
%>
<a href = 'jdbc.jsp'>목록 이동</a>

</body>
</html>