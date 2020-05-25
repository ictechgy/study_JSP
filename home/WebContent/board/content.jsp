<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.board.*"%>
<%@ include file="../top.jsp" %>
<%
	String snum=request.getParameter("num");
	if(snum==null||snum.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}
%>
<jsp:useBean id="dao" class="home.board.BoardDAO"/>
<%
	BoardDTO dto = dao.getBoard("content", Integer.parseInt(snum)); 
%>
<div align="center">
글 내 용 보 기
	<table border="1" width="80%">
		<tr>
			<th bgcolor="skyblue" width="20%">글번호</th><td width="30%" align="center"><%=dto.getNum() %></td>
			<th bgcolor="skyblue" width="20%">조회수</th><td width="30%" align="center"><%=dto.getReadcount() %></td>
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">작성자</th><td width="30%" align="center"><%=dto.getWriter() %></td>
			<th bgcolor="skyblue" width="20%">작성일</th><td width="30%" align="center"><%=dto.getReg_date() %></td>
			<!-- 또는 날짜표기에 있어서 dto.getReg_date()|~~~ 처럼 필터 | 를 써서 원하는 부분만 표현할 수도 있지 않았나? -->
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">글제목</th><td colspan="3" align="center"><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">글내용</th><td colspan="3" align="center"><%=dto.getContent() %></td>
		</tr>
		<tr bgcolor="skyblue" align="right">
			<td colspan="4">
				<input type="button" value="답글쓰기" onclick='window.location="writeForm.jsp?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>"'>
				<input type="button" value="수정하기" onclick='window.location="updateForm.jsp?num=<%=dto.getNum()%>"'>
				<input type="button" value="삭제하기" onclick='window.location="deleteForm.jsp?num=<%=dto.getNum()%>"'>
				<input type="button" value="목록가기" onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>