<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert('�̸��� �Է��ϼ���')
			f.writer.focus()
			return false;
		}
		if (f.subject.value==""){
			alert('������ �Է��ϼ���')
			f.subject.focus()
			return false;
		}
		if (f.content.value==""){
			alert('�� ������ �Է��ϼ���')
			f.content.focus()
			return false;
		}
		if (f.passwd.value==""){
			alert('��й�ȣ�� �Է��ϼ���')
			f.passwd.focus()
			return false;
		}
		return true;
	}
	//�ʼ��Է°��� �׳� �±� �ȿ� required �־ ó�� ����
</script>
<%
	int num=0, re_step=0, re_level=0;
	String snum=request.getParameter("num");
	if(snum !=null){  //����� �޷��� �Ѵٸ�
		num=Integer.parseInt(snum);
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>
<div align="center">
<form name="f" action="writePro.jsp" method="post" onsubmit="return check()"> <!-- check()�޼ҵ尡 ��ȯ���ִ� ���� ���� submit ���� -->
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="re_step" value="<%=re_step %>">
<input type="hidden" name="re_level" value="<%=re_level %>">
	<table border="1" width="99%" height="90%">
		<tr>
			<th colspan="2">�� �� ��</th>
		</tr>
		<tr>
			<th>�̸�</th><td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<th>����</th><td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<th>�̸���</th><td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th>�۳���</th><td><textarea name="content" cols="50" rows="10"></textarea></td>
		</tr>
		<tr>
			<th>��й�ȣ</th><td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="�۵��">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="�۸��" onclick="javascript:location.href='list.jsp'">
				<!-- ���ǿ����� onclick="window.location='list.jsp'" �� �������. -->
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp" %>