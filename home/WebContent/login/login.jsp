<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%@ include file="../top.jsp" %>
<head>
<title>�α���������</title>
<script type="text/javascript">
	function loginCheck(){
		if (f.id.value==""||id==""){
			alert("���̵� �Է��ϼ���!")
			id.focus()
			return
		}
		if (f.pw.value==""||pw==""){
			alert("��й�ȣ�� �Է��ϼ���!")
			pw.focus()
			return;
		}
		document.f.submit()
	}
	function searchMember(mode){
		window.open(""+<%=request.getContextPath()%>+"/login/search.jsp?mode="+mode, "search", "width=600, height=450")
	}
</script>
<%
	String name = null, value=null;
	Cookie[] cks = request.getCookies();
	if(cks!=null&&cks.length!=0){
		for(int i=0; i<cks.length; i++){
			name=cks[i].getName();
			if(name.equals("saveId")){
				value=cks[i].getValue();
				break;
			}
		}
	}
	//value���� null�̸� ��Ű�� ���� �������� �ʴ´�. �� ���̵������� üũ���� ����
%>
</head>
<body>
<br>
<br>
<p>
<img src="../img/tm_login.jpg" width="150" height="60" border="0" align="center" alt="ȸ���α���" style="padding-left:30px">
<form name="f" action="login_ok.jsp" method="post" id="f">
	<table width=60% align="center" height="100">
		<tr>
			<td align="right" width="30%">
				<img src="../img/id01.jpg" width="60" height="30" border="0" alt="���̵�">
			</td>
			<td width="40%">
			<%if (value==null){ %>
				<input type="text" name="id" tabindex="1" id="id">
			<%}else{ %>
				<input type="text" name="id" tabindex="1" id="id" value="<%=value %>">
			<%} %>  <!-- �ٵ� ���� �̷��� if-else�� ���� �ʿ�� ���� �� ������. -->
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
					<img src="../img/bt_login.jpg" border="0" alt="�α���" width="100" height="90" tabindex="3"><br>
				</a>
			<nobr>
				<%if (value==null) {%>
				<input type="checkbox" name="saveId">
				<font face="����" size="2">���̵� ����ϱ�</font>
				<%}else{ %>
				<input type="checkbox" name="saveId" checked>
				<font face="����" size="2">���̵� ����ϱ�</font>
				<%} %>
			</nobr>
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="../img/pwd.jpg" width="60" height="30" alt="��й�ȣ">
			</td>
			<td>
				<input type="password" name="passwd" tabindex="2"  id="pw">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="javascript:checkMember()">
					<img src="../img/bt_join.jpg" width="80" height="40" border="0" alt="ȸ������">
				</a>
				<a href="javascript:searchMember('id')">
					<img src="../img/bt_search_id.jpg" border="0" width="80" height="40" alt="���̵� ã��">
				</a>
				<a href="javascript:searchMember('pw')">
					<img src="../img/bt_search_pw.jpg" border="0" width="80" height="40" alt="��й�ȣ ã��">
				</a>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../bottom.jsp" %>
</body>
</html>