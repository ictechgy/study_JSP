<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function question(){
		qu=confirm("����� �����Դϱ�?")
		if(qu==true){
			alert("���� ����Ʈ�� �湮���ּż� �����մϴ�.")
		}else{
			alert("���� ����Ʈ�� �����������Ʈ�Դϴ�.\n�̿��Ͻ� �� �����ϴ�.")
		}
	}
</script>
</head>
<body>
<form>
	<input type="button" value="�����ϼ���" onclick="question()">
</form>

</body>
</html>