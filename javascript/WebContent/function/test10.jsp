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
	arr1 = new Array(10,20,30) //���� ������ ���� ������ ������ �ε��� �ϳ��� ����
	for(i=0; i<3; i++){
		document.write(arr1[i]+"&nbsp&nbsp")
	}
	document.write("<br>")
	arr2= new Array(5)  //���� �ϳ��� ���� �� ����
	arr2[0]="�ϳ�"
	arr2[1]="��"
	arr2[2]="��"
	arr2[3]="��"
	arr2[4]="�ټ�"
	for(i=0;i<5;i++){
		document.write(arr2[i]+"&nbsp&nbsp")
	}
</script>

</body>
</html>