<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%
	String snum=request.getParameter("num");
	if(snum==null||snum.trim().equals("")){
		response.sendRedirect("list.jsp");
		return;
}
%>
<script type="text/javascript">
	function delCheck(){
		if(f.passwd.value==""){
			alert("비밀번호를 입력하세요")
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<div align="center">
	글 삭 제
	<form name="f" action="deletePro.jsp" method="post" onsubmit="return delCheck()">
	<input type="hidden" name="num" value="<%=snum%>">
		<table border=1>
			<tr bgcolor="yellow">
				<th>비밀번호를 입력해주세요</th>
			</tr>
			<tr>
				<td align=center>비밀번호 : <input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="삭제"><input type="button" value="글목록" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp" %>