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
<jsp:useBean id="dao" class="home.board.BoardDAO"></jsp:useBean>
<%
	BoardDTO dto=dao.getBoard("update", Integer.parseInt(snum));
%>

<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert('이름을 입력하세요')
			f.writer.focus()
			return false;
		}
		if (f.subject.value==""){
			alert('제목을 입력하세요')
			f.subject.focus()
			return false;
		}
		if (f.content.value==""){
			alert('글 내용을 입력하세요')
			f.content.focus()
			return false;
		}
		if (f.passwd.value==""){
			alert('비밀번호를 입력하세요')
			f.passwd.focus()
			return false;
		}
		return true;
	}
</script>
<div align="center">
<form name="f" action="updatePro.jsp" method="post" onsubmit="return check()"> <!-- check()메소드가 반환해주는 값에 따른 submit 실행 -->
	<input type="hidden" name="num" value="<%=snum%>">
	<table border="1" width="99%" height="90%">
		<tr>
			<th colspan="2">글 수 정</th>
		</tr>
		<tr>
			<th>이름</th><td><input type="text" name="writer" value=<%=dto.getWriter() %>></td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="subject" value=<%=dto.getSubject() %>></td>
		</tr>
		<tr>
			<th>이메일</th><td><input type="text" name="email" value=<%=dto.getEmail() %>></td>
		</tr>
		<tr>
			<th>글내용</th><td><textarea name="content" cols="50" rows="10"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th><td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글 수정">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="javascript:location.href='list.jsp'">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp" %>