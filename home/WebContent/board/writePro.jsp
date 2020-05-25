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
	}//유효성검사
	bdto.setIp(request.getRemoteAddr());
%>

<jsp:useBean id="bdao" class="home.board.BoardDAO"></jsp:useBean>
<%
	int res=bdao.insertBoard(bdto);
	String msg, url;

	if(res>0){
		msg="게시글 등록 성공!!";
		url="list.jsp";
	}else{
		msg="게시글 등록 실패!!";
		url="writeForm.jsp";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>')
	location.href="<%=url%>"
</script>