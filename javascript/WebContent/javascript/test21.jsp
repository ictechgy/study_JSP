<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var kor, eng, sum, avg, hak
	kor=prompt("��������")
	eng=prompt("��������")
	sum=eval(kor)+eval(eng)	//���ڰ����� ���� ���� ���ڰ����� ��ȯ���ִ� �����Լ�
	avg=sum/2.0
	if(avg>=90){
		document.write("���� :" + kor + "���� :" +eng+"<br>")
		document.write("�հ� :"+sum+"���:"+avg+"����:A<br>")
	}else if(avg>=80){
		document.write("���� :" + kor + "���� :" +eng+"<br>")
		document.write("�հ� :"+sum+"���:"+avg+"����:B<br>")
	}else if(avg>=70){
		document.write("���� :" + kor + "���� :" +eng+"<br>")
		document.write("�հ� :"+sum+"���:"+avg+"����:C<br>")
	}else if(avg>=60){
		document.write("���� :" + kor + "���� :" +eng+"<br>")
		document.write("�հ� :"+sum+"���:"+avg+"����:D<br>")
	}else{
		document.write("���� :" + kor + "���� :" +eng+"<br>")
		document.write("�հ� :"+sum+"���:"+avg+"����:F<br>")
	}
	
</script>
</head>
<body>

</body>
</html>