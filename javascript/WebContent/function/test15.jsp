<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	Today = new Date()
	document.write(Today.getYear()+"��"+(Today.getMonth()+1)+"��"+Today.getDate()+"��")
	switch(Today.getDay()){
	case 0: document.write("�Ͽ���")
	break
	case 1: document.write("������")
	break
	case 2: document.write("ȭ����")
	break
	case 3: document.write("������")
	break
	case 4: document.write("�����")
	break
	case 5: document.write("�ݿ���")
	break
	case 6: document.write("�����")
	break
	}
	document.write(Today.getHours()+"��"+Today.getMinutes()+"��"+Today.getSeconds()+"��")
</script>

</body>
</html>