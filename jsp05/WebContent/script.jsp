<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
	function pwchk(){
		inPut = document.getElementById('inPut').value
		document.getElementById('outPut').value=inPut
		document.getElemnetById('inPut').value=""
		
		document.getElementById('label').innerHTML='�� ����'
	}
	
</script>


</head>
<body>

document.getElementById().value�� ���� id���� value�� ������ �ͺð�.. 
��ũ��Ʈ���� submit()�� �۵����Ѻ��Ҵ�.
onclick�� ���� �޼ҵ带 �۵��� ���Ѻ��Ұ� ���ο� location.href�� �����μ� �ٸ� �������� �̵��ϵ��ϵ� �������.

�������� -> js.jsp���� �� test.jsp����


���콺 Ŀ���� �̵��ȴٸ� ó���ϴ� ���� �����(�ܼ��� �̵��� �ƴ� �ٸ� �κ��� Ŭ�������� �۵��ϴ� �Ӽ�)

<hr>
	<input type='text' id ='inPut' onchange='pwchk()'><br> 
	<input type='text' id='outPut'><br>
	<input type='text'><br>
<hr>

onclick - Ŭ���̺�Ʈ�߻��� �۵��ϴ� �Ӽ�
onchange - ��Ŀ����ġ�� �ٲ�ٸ� �۵��ϴ� �Ӽ�

ù��° ĭ Ŭ�� �� �� �Է��� ������ �ٸ� ��ġ�� Ŭ���ϸ� onchange�Ӽ��ߵ� �� pwchk()�޼ҵ尡 �۵��Ѵ�.
�ڵ�˰��� ���Ͽ�.. 
�ι�°ĭ���� ���� �̵��ϰ� ù��° ĭ�� ���� �����

<p>

�ȳ��ϼ���
<p>
���� �� "�ȳ��ϼ���"��� ���ڴ� �ܼ��� �����ϻ� ��� ��ɵ� ���� ���Ѵ�.
������ id�� �ο��ϰ� ����� �� label�±� ���
<p>
<label id='label'>�ȳ��ϼ���</label>

���±װ� �ִ� ���� ���� ��ũ��Ʈ �޼ҵ带 �� �� �ִ�. 
�� �ش� ������ ���� ����ų �� ������ �پ��ϰ� ���� �� �ִ�. 



</body>
</html>