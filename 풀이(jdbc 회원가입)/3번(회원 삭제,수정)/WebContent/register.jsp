<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function pwchk(){
	pw1 = document.getElementById("pwd1").value;
	pw2 = document.getElementById("pwd2").value;
	if(pw1 == pw2){
		document.getElementById("label").innerHTML="Ȯ��!!";
	}else{
		document.getElementById("label").innerHTML="����ġ!!";
		document.getElementById("pwd1").value="";
		document.getElementById("pwd2").value="";   //�ٵ� ���� �̷��� ����ġ�� ������ų �ʿ䰡 �ֳ�.. ��Ͻÿ� �� ���� ��ġ���� �ʴµ��� ���� ���°� �������� �� ������.. �װ� ��ó�� ���� ��ü �޼ҵ忡���� ������ϰ�..
	}												//.focus�޼ҵ�� Ŀ���� ������ ��ġ��ų ���� �ִ�.
}
function chkValidate(){
	if(document.getElementById('id').value == ""){
		alert('���̵�� �ʼ� �Է� �����Դϴ�.');
		return;
	}else if(document.getElementById('pwd1').value == ""){
		alert('��й�ȣ�� �ʼ� �Է� �����Դϴ�.');
		return;
	}
	else{ document.form.submit(); }
}
</script>
</head>
<body>
<%response.setCharacterEncoding("utf-8");%>
<form name="form" action="chkRegister.jsp" method="post">
	<input type="text" id="id" name="id" placeholder="���̵�">(*�ʼ� �׸�)<br>
	<input type="text" id="pwd1" name="pwd" placeholder="��й�ȣ"><br>
	<input type="text" id="pwd2" onchange="pwchk()" placeholder="��й�ȣ Ȯ��">
	<label id="label">(*�ʼ� �׸�)</label><br>
	<input type="text" name="name" placeholder="�̸�"><br>
	<input type="text" name="addr" placeholder="�ּ�"><br>
	<input type="text" name="tel" placeholder="��ȭ��ȣ"><br>
	<input type="button" value="ȸ������" onclick="chkValidate();">			
</form>
</body>
</html>