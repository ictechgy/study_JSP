<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������������</title>
<script type="text/javascript">
	function check(){
		if(f.id.value==""){	//name�Ӽ��� ������ ���̵��Էºκ��� ����Ų���ε� �� �κ� ����Ű�� ����� �پ��ϴ�. id�Ӽ��� �̿��ϰų� document.getElementById()��
			alert('���̵� �Է��ϼ���!')
			f.id.focus()
			return;
		}
		if(f.passwd.value=""){
			alert('��й�ȣ�� �Է��ϼ���!')
			f.passwd.focus()
			return;
		}
		document.f.submit()
	}
	//�ٵ� input �±��� �Ӽ����μ� minlength����� �ʼ��Է°��� �Ӽ� �̿��ؼ� �ݵ�� �Է��ϵ��� ���� �� ���� �ʳ�? - required �Ӽ� ������
</script>
</head>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	String ssn1=request.getParameter("ssn1");
	String ssn2=request.getParameter("ssn2");
%>
<body onload="f.name.focus()">
<form name="f" method="post" action="member_input.jsp">
	<table width="600" align="center">
		<tr>
			<td colspan="2" align="center">ȸ������</td>
		</tr>
		<tr>
			<td width="150">�̸�</td>
			<td>
				<input type="text" name="name" value="<%=name %>" disabled>   <!-- disabled�� �κ��� ������ �ȵȴ�?! -->
				<input type="hidden" name="name" value="<%=name %>">
			</td>
		</tr>
		<tr>
			<td width="150">���̵�</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td width="150">��й�ȣ</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td width="150">�ֹι�ȣ</td>
			<td><input type="text" name="ssn1" value="<%=ssn1%>" readonly size="6">-<input type="password" name="ssn2" value="<%=ssn2%>" readonly size="7"></td>
		</tr>
		<tr>
			<td width="150">�̸���</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td width="150">����ó</td>
			<td><input type="text" name="ph1" size="3" maxlength="3">-<input type="text" name="ph2" size="4" maxlength="4">-<input type="text" name="ph3" size="4" maxlength="4"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:check()">[����]</a>
				<a href="#">[���]</a>
			</td>
		</tr>
	</table>
</form>




</body>
</html>