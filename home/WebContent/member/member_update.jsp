<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.member.*"%>
    <jsp:useBean id="mbdao" class="home.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������������</title>
<script type="text/javascript">
	function check(){
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
	String no = request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	MemberDTO dto = mbdao.getMember(Integer.parseInt(no));
%> 
<body onload="f.name.focus()">
<form name="f" method="post" action="member_update_ok.jsp">
	<table width="600" align="center">
	<input type="hidden" name="no" value="<%=no %>">
		<tr>
			<td colspan="2" align="center">ȸ������</td>
		</tr>
		<tr>
			<td width="150">�̸�</td>
			<td>
				<input type="text" name="name" value="<%=dto.getName() %>" disabled>   <!-- disabled�� �κ��� ������ �ȵȴ�?! -->
				<input type="hidden" name="name" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<td width="150">���̵�</td>
			<td><input type="text" name="id" value="<%=dto.getId() %>" readonly></td>
		</tr>
		<tr>
			<td width="150">��й�ȣ</td>
			<td><input type="password" name="passwd" value="<%=dto.getPasswd()%>"></td>
		</tr>
		<tr>
			<td width="150">�ֹι�ȣ</td>
			<td><input type="text" name="ssn1" value="<%=dto.getSsn1()%>" readonly size="6">-<input type="password" name="ssn2" value="<%=dto.getSsn2()%>" readonly size="7"></td>
		</tr>
		<tr>
			<td width="150">�̸���</td>
			<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<td width="150">����ó</td>
			<td>
				<input type="text" name="ph1" size="3" maxlength="3" value="<%=dto.getHp1()%>">-
				<input type="text" name="ph2" size="4" maxlength="4" value="<%=dto.getHp2()%>">-
				<input type="text" name="ph3" size="4" maxlength="4"value="<%=dto.getHp3()%>">
			</td>
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