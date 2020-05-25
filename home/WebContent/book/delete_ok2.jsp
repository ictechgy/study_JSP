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
		msg="도서 삭제성공!! 도서보기 페이지로 이동합니다.";
		href="list2.jsp";
	}else{
		msg="도서 삭제실패!! 도서삭제 페이지로 이동합니다.";
		href="delete2.jsp";
	}

%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=href%>"
</script>
