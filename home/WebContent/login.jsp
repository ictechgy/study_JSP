<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ include file="top.jsp" %>
<script type="text/javascript">
	function loginCheck(){
		if (f.id.value==""){
			alert("���̵� �Է��ϼ���!")
			id.focus()
			return
		}
		if (f.pw.value==""){
			alert("��й�ȣ�� �Է��ϼ���!")
			pw.focus()
			return;
		}
		document.form.submit()
	}
	function searchMember(mode){
		window.open(""+<%=request.getContextPath()%>+"/login/search.jsp?mode="+mode, "search", "width=600, height=450")
	}
</script>
<br>
<br>
<p>
<img src="img/tm_login.gif" width=100 height="13" border="0" align="center" alt="ȸ���α���">
<form name="f" action="login_ok.jsp" method="post">
	<table width=60% align="center" height="120">
		<tr>
			<td align="right" width="30%">
				<img src="img/id01.gif" width="28" height="11" border="0" alt="���̵�">&nbsp;&nbsp;
			</td>
			<td width="40%">
				<input type="text" name="id" tabindex="1">
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
					<img src="img/bt_login.gif" border="0" alt="�α���" tabindex="3">&nbsp;&nbsp;<br>
				</a>
			<nobr>
				<input type="checkbox" name="saveId">
				<font face="����" size="2">���̵� ����ϱ�</font>
			</nobr>
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="img/pwd.gif" width="37" height="11" alt="��й�ȣ">
			</td>
			<td>
				<input type="password" name="passwd" tabindex="2">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="javascript:checkMember()">
					<img src="img/bt_join.gif" width="60" height="22" border="0" alt="ȸ������">
				</a>
				<a href="javascript:searchMember('id')">
					<img src="img/bt_search_id.gif" border="0" width="60" height="22" alt="���̵� ã��">
				</a>
				<a href="javascript:searchMember('pw')">
					<img src="img/bt_search_pw.gif" border="0" width="60" heigh="22" alt="��й�ȣ ã��">
				</a>
			</td>
		</tr>
	</table>
</form>

<%@ include file="bottom.jsp" %>
