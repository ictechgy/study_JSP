<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	if(name==null||name.trim().equals("")){
		response.sendRedirect("delete.jsp");
		return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	
	String user="kgitbank";
	String pwd="kgitbank";
	String sql="delete from book where name=?";
	Connection conn=DriverManager.getConnection(url, user, pwd);
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, name);
	int res = ps.executeUpdate();
	String msg=null;
	String href=null;
	if(res>0){
		msg="���� ��������!! �������� �������� �̵��մϴ�.";
		href="list.jsp";
	}else{
		msg="���� ��������!! �������� �������� �̵��մϴ�.";
		href="delete.jsp";
	}
	ps.close();
	conn.close();
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
