<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>


	function pwdchk(){
		if ( pwd.value != pwd2.value ){
			label.innerHTML="��й�ȣ ����ġ"   //document.getElementById("label").innerHTML="��й�ȣ ����ġ"
		}
		else{
			label.innerHTML="��й�ȣ ��ġ"
		}
	}

	
	function chk(){
		if (id.value==''){
			alert("���̵�� �ʼ� �Է� �����Դϴ�.")
		}
		else if(pwd.value==''){
			alert("��й�ȣ�� �ʼ� �Է� �����Դϴ�.")
		}
		else if(pwd.value != pwd2.value  ){
			alert("��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.")
		}
		else{
			go.submit()
		}
	}
	
	//���̵� ��ġ�ϴ� ���� �ִ����� Ȯ���ؾ��ϴµ�..chkRegister.jsp���� ��ġ�ϴ� id���� �����Ѵٸ� �ٽ� �� �������� �����൵ �Ǳ�� �ϴµ�
	//�׳� �Ϲ����� ��������ó�� �ƿ� ȸ������â���� id���� �����ϴ����� Ȯ���ϴ°� ���� �ʳ�
	
	
//ó������ document.getElementById()�� ������ �ߴµ� ���ǽ��� �ʹ� ���������� �Լ����� �տ� ���� ������ �� ������Ѽ� ������ �߾���
//�ٵ� �׳� id�̸����� ���Ͱ��� �� ���� �־���.. name���� �״�� �� �� �ֳ� -> �ȵǳ�. �׳� id.value, pwd2.value���� ���°�..
//�׷��� ���� ������ �����ؼ� ���� -> �װ͵� �ȵǳ�
//�� �׳� id.value���� ���°� �ǳ�.. ����

//�� �������� �ʴ°�� ���������� F12�� �����ڸ��� Ȯ���ص� ��
</script>


</head>
<body>


<form action=chkRegister.jsp id=go method='post'>

<input type='text' placeholder="���̵�" id='id' name='id'>*�ʼ��׸�<br>
<input type='password' placeholder="��й�ȣ" id='pwd' name='pwd'>*�ʼ��׸�<br>
<input type='password' placeholder="��й�ȣ Ȯ��" id='pwd2' onchange='pwdchk()'><label id='label'>��й�ȣ�� ��ġ�ϰ� �Է�</label><br>
<input type='text' placeholder="�̸�" name='name'><br>
<input type='text' placeholder="�ּ�" name='addr'><br>
<input type='text' placeholder="��ȭ��ȣ" name='tel'><br>
<input type='button' value="ȸ������" onclick='chk()'>

</form>

</body>
</html>