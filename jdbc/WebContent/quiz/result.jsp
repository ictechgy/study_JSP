<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet" %>
    <!--  import구문을 다 따로 작성할 수도 있지만 위와같이 작성할 수도 있고 그러한 경우 따옴표 안에서 쉼표로 구분하여 작성한다. 또는 java.sql.*을 써서 통째로 import해도 된다. -->
    <%@ page import="java.lang.*", "java.util.*" %> 이러한 방식은 불가능.
    아무튼 페이지에 대해서 import하는거니까 page지시자를 쓰긴 함. 당연히 스크립틀릿에 골뱅이@를 붙인거고.. 이런 지시자에는 include file=""도 있었음. 물론 역시나 여러 파일을 한번에 include하는 것도 되겠지. 또는 굳이 file형식이 아닌 다른 것도 include될 듯
    inlcude는 어디까지나 맨 앞에 쓰이는 page와 같은 초록색 지시자일 뿐이니까
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인적사항</h1>

<% 
	String name = request.getParameter("name");
	
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp001";
	String pwd = "1234";
	
	Connection conn = DriverManager.getConnection(url, id, pwd);
	
	Statement stmt = conn.createStatement();
	
	
	ResultSet rs = stmt.executeQuery("select * from student where name='"+name+"'");
	
	
	rs.next();
	
	out.print("학번 : "+rs.getString("num")+"<p>");
	out.print("이름 : "+rs.getString("name")+"<p>");
	out.print("국,영,수 : "+rs.getInt("kor")+","+rs.getInt("eng")+","+rs.getInt("math"));
	
	
	
%>
<p>
<input type='button' value='뒤로' onclick="location.href='table.jsp'">


getString도 되고 getInt도 되고..
선생님은 식별값을 넘길 때 나처럼 name을 그대로 넘긴게 아니라 num(학번)값을 넘기게 만드심.
만약 이름값으로 김구구를 넘겼는데 그게 여기서 실행 될 때 데이터베이스에 동일값이 여러개라면 맨 첫사람만 출력될듯
따라서 중복되지 않는 primary key값인 학번값을 넘김


</body>
</html>