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
			alert("��й�ȣ�� �Է��ϼ���")
			f.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<div align="center">
	�� �� ��
	<form name="f" action="deletePro.jsp" method="post" onsubmit="return delCheck()">
	<input type="hidden" name="num" value="<%=snum%>">
		<table border=1>
			<tr bgcolor="yellow">
				<th>��й�ȣ�� �Է����ּ���</th>
			</tr>
			<tr>
				<td align=center>��й�ȣ : <input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="����"><input type="button" value="�۸��" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp" %>