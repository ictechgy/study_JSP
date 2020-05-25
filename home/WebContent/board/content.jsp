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
�� �� �� �� ��
	<table border="1" width="80%">
		<tr>
			<th bgcolor="skyblue" width="20%">�۹�ȣ</th><td width="30%" align="center"><%=dto.getNum() %></td>
			<th bgcolor="skyblue" width="20%">��ȸ��</th><td width="30%" align="center"><%=dto.getReadcount() %></td>
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">�ۼ���</th><td width="30%" align="center"><%=dto.getWriter() %></td>
			<th bgcolor="skyblue" width="20%">�ۼ���</th><td width="30%" align="center"><%=dto.getReg_date() %></td>
			<!-- �Ǵ� ��¥ǥ�⿡ �־ dto.getReg_date()|~~~ ó�� ���� | �� �Ἥ ���ϴ� �κи� ǥ���� ���� ���� �ʾҳ�? -->
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">������</th><td colspan="3" align="center"><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<th bgcolor="skyblue" width="20%">�۳���</th><td colspan="3" align="center"><%=dto.getContent() %></td>
		</tr>
		<tr bgcolor="skyblue" align="right">
			<td colspan="4">
				<input type="button" value="��۾���" onclick='window.location="writeForm.jsp?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>"'>
				<input type="button" value="�����ϱ�" onclick='window.location="updateForm.jsp?num=<%=dto.getNum()%>"'>
				<input type="button" value="�����ϱ�" onclick='window.location="deleteForm.jsp?num=<%=dto.getNum()%>"'>
				<input type="button" value="��ϰ���" onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>