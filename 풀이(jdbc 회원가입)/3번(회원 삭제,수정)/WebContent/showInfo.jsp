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
<h2 align="center">회원 정보 수정 및 삭제</h2>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");   //이건 뭐지
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection connect = DriverManager.getConnection(url, "jsp", "1234");
String id = (String)session.getAttribute("sessionId");//session id 가져옴
Statement stmt = connect.createStatement();
ResultSet rs = stmt.executeQuery("select * from members where id='" + id + "'");
String getId = "", getPwd = "", getName = "", getAddr = "",getTel="";
if (rs.next()) {
	getId = rs.getString("id");
	getPwd = rs.getString("pwd");
	getName = rs.getString("name");
	getAddr = rs.getString("addr");
	getTel = rs.getString("tel");
}
%>
<form action="modifyInfo.jsp" method="post">
<table align="center">
	<tr><th align="right">아이디:</th><td> <input type="text" name="id" value="<%=getId%>"></td></tr>
<tr><th align="right">비밀번호:</th><td> <input type="text" name="pwd" value="<%=getPwd%>"></td></tr>
<tr><th align="right">이름:</th><td> <input type="text" name="name" value="<%=getName%>"></td></tr>
<tr><th align="right">주소:</th><td> <input type="text" name="addr" value="<%=getAddr%>"></td></tr>
<tr><th align="right">전화번호:</th><td> <input type="text" name="tel" value="<%=getTel%>"></td></tr>
<tr><td align="right"><input type="submit" value="수정"></td>
<td ><button type="button" onclick="if(confirm('정말 삭제하시겠습니까?')){location.href='deleteInfo.jsp';}">    <!--  오호라 이렇게도 쓰네? -->
삭제</button></td>
</tr>
</table>
</form>
</body>
</html>