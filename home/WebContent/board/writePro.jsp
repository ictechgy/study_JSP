<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="bdto" class="home.board.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>

<%
	if (bdto.getWriter()==null||bdto.getWriter().trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
	}//��ȿ���˻�
	bdto.setIp(request.getRemoteAddr());
%>

<jsp:useBean id="bdao" class="home.board.BoardDAO"></jsp:useBean>
<%
	int res=bdao.insertBoard(bdto);
	String msg, url;

	if(res>0){
		msg="�Խñ� ��� ����!!";
		url="list.jsp";
	}else{
		msg="�Խñ� ��� ����!!";
		url="writeForm.jsp";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>')
	location.href="<%=url%>"
</script>