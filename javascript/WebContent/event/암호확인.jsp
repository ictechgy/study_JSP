<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function pwchk(){
		if(form1.pw1.value==form1.pw2.value){		//�Ǵ� �±׿� id���� �ΰ� �ٷ� �� ����. �ƴϸ� document.getElementById������ ���ų�
			alert("����� ��ȣ�� �Է��Ͽ����ϴ�.")
		}else{
			alert("��ȣ���� ��ȣȮ�ζ��� \n password�� ���� ���� �ʽ��ϴ�.")
		}
	}
</script>
</head>
<body>
<form name="form1">
	��ȣ:<input type="password" name="pw1"><br>
	��ȣȮ��:<input type="password" name="pw2"><p>
	<input type="button" value="Ȯ��" onclick="pwchk()">
</form>

</body>
</html>