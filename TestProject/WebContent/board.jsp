<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

����Ÿ���̳� ���ڵ���Ŀ� �־ EUC-KR�� UTF-8�� � �ӵ����̰����͵� ������

<h1 align='center' style="color:blue;">�ѳ���</h1><p>


<table border='2'>
	<tr>
		<th>�Խñ� �̸�</th><th>��ȸ��</th><th>�ۼ���</th>
	</tr>

	<tr>
		<td><a href='post1.jsp'>��?</a></td>
		<td align='center'>
		<%
			if ( application.getAttribute("hits") == null){  //.value �Ƚ���.. ��..getter�� Object������ ��ȯ�ϱ�� �ϴ°Ű�����..�׷��� cast����ȯ�� ���⵵ �ϰ�.. ��.. .value���°� �ڹٽ�ũ��Ʈ getElement���̾���..�ű⼭ �� .value����ϳ�?
				application.setAttribute("hits", 0);         //getter�޼ҵ尡 Object������ ��ȯ�ϴ°� ����. �̷� �޼ҵ���� � �ڷ����� ��ȯ�ϰ� ���� �𸣴ϱ� Object������ ��ȯ�ϵ��� ���� �� 
			}												 //getElement����?
		out.print( application.getAttribute("hits") );
		%>
		
		
		</td>
		<td>�Ѻ�ѹ�</td>
	</tr>

</table>

document.write �ڹٽ�ũ��Ʈ ��¹�
document.getElementById() �±׿� �ο��� �̸��� �̿��Ͽ� �ش� ������ ���� �ڹٽ�ũ��Ʈ���� ���. �׸��� �ڿ� .value�� ����ϳ�
���� �׳� id.value������ �ᵵ �Ǵ� �� ������.. name.value������..
�ٵ� ���ó� getter�� �ִ� ������ ���������ڰ� ���� �� �־�ΰ�?? �׷����� �ֳ�.. ��..


script���� �������� �տ����� ������ ���� ������ ���� ����Ǵ� �� ����/.



<script type='text/javascript'>
	var verify=confirm("�ѳ��� ó�����̽��ϱ�?")
	
	if(verify){  //���ǽ��� verify==true�ص� �Ǳ���
		alert("�ѳ��� �湮�ϽŰ��� ȯ���մϴ�!!")
	}
	else{
		alert("��湮�� ȯ���մϴ�!!")
	}
</script>




</body>
</html>