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
<h2 align="center">ȸ�� ���� ���� �� ����</h2>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");   //�̰� ����
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
Connection connect = DriverManager.getConnection(url, "jsp", "1234");
String id = (String)session.getAttribute("sessionId");//session id ������
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
	<tr><th align="right">���̵�:</th><td> <input type="text" name="id" value="<%=getId%>"></td></tr>
<tr><th align="right">��й�ȣ:</th><td> <input type="text" name="pwd" value="<%=getPwd%>"></td></tr>
<tr><th align="right">�̸�:</th><td> <input type="text" name="name" value="<%=getName%>"></td></tr>
<tr><th align="right">�ּ�:</th><td> <input type="text" name="addr" value="<%=getAddr%>"></td></tr>
<tr><th align="right">��ȭ��ȣ:</th><td> <input type="text" name="tel" value="<%=getTel%>"></td></tr>
<tr><td align="right"><input type="submit" value="����"></td>
<td ><button type="button" onclick="if(confirm('���� �����Ͻðڽ��ϱ�?')){location.href='deleteInfo.jsp';}">    <!--  ��ȣ�� �̷��Ե� ����? -->
����</button></td>
</tr>
</table>
</form>
</body>
</html>