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

preparedStatement를 써보자! 

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, id, pwd);
	
	int num = 111;
	String name="김말자", kor = "10", eng="50", math="100";
	String sql = "insert into student values(?,?,?,?,?)";
	
	
	//원래는 쿼리문을 전송하기 위해 Statement객체 만들고 stmt.execute메소드를 쓸 때 값을 바로 그 때 넣었는데 이번에는 값을 미리 넣어두고 executeUpdate나 executeQuery를 쓸지 모르는 상태
	PreparedStatement pstmt = conn.prepareStatement("sql");
	
	//물음표에 값 집어넣기
	pstmt.setInt(1, num);  //num이 숫자형태이므로 setInt씀. String형태로 넣으면 나중에 execute로 실행할 때 오류뜨겠지. 쿼리문전송할때 데이터베이스에서는 num은 따옴표가 묶여있어서는 안될테니까
	pstmt.setString(2, name);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, math);
	//setString은 자동으로 따옴표를 붙여서 넣어주는 듯
	
	//물음표위치에 값을 집어넣을 떄 숫자값을 setString으로 하거나 문자값을 setInt로 넣을 수 있나
	//그리고 위에서는 두번째 인자에 변수명을 넣었는데 그냥 바로바로 직접적 상수값을 작성해도 될 듯
	
	int cnt = pstmt.executeUpdate();
	if(cnt!=0){
		out.print("<h3>저장완료</h3>");
	}
	out.print("<a href='jdbc.jsp'>목록 이동</a>");
%>
내가 만든 테이블에서 국영수는 number형태인데 역시나 값이 잘 들어감.. 흠


</body>
</html>