<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<jsp:useBean id="bdao" class="home.book.BookDAO"/>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	if(name==null||name.trim().equals("")){
		response.sendRedirect("delete2.jsp");
		return;
	}
	int res=bdao.deleteBook(name);
	String msg=null;
	String href=null;
	if(res>0){
		msg="���� ��������!! �������� �������� �̵��մϴ�.";
		href="list2.jsp";
	}else{
		msg="���� ��������!! �������� �������� �̵��մϴ�.";
		href="delete2.jsp";
	}

%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
