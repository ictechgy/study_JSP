<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	if (application.getAttribute("hits") == null){
		application.setAttribute("hits", 1);
	}
	else{
		int num = (int)application.getAttribute("hits");
		num++;
		application.setAttribute("hits", num);
	}
	//�Ӽ����� ���ؼ� set get�� ������? replace������ ����? ���� set���� �� ����� �� �ϱ�� ������

	//���࿡ � ����� �� ������ URL�� ���� �� �ۿ� ó������ �ٷ� �������� �� ��ȸ���� 1�� ������ֱ� ���� if��.
	//���� if���� �ȵΰ� else������ �����״ٸ�.. �� board.jsp�� ���� �� �������� �������������� ������ �������� �ٷ� �� �������� ������ ��� �ڵ���� ������ �߻����� �ʾ����� �Ѵ�.. null���� int����ȯ�� �ǳ�?
	//�Դٰ� null++�ϴ� ���°� �Ǿ������.. ��..null�� �ڵ����� 0���� ������ַ��� ����ȯ�ϸ�? ���� �׷��ٸ� ���� if���� �ʿ��������.
	
	//else�� �Ⱦ��� �׳� �� if���� ���ӹ��忡�� �ʱⰪ�� 0���� ����� else�� �Ʒ� ���ӹ����� �������� �ʿ�� ���� ��
	
	//�������� ��ȸ���� �־ �ι�° ���ڸ� ���ڰ����� ����ð� Integer.parseInt�� Integer.toString�޼ҵ� ���� �������� ���� �ܼ��ϰ� �̷��Ը� ��.
	
	//���Ͱ��� �ڵ嵵 ���ó� ���ΰ�ħ�ÿ� ��ȸ���� �þ���� �Ǿ�����. �ܼ���ũ�ΰ��� �ɷ� ��ȸ���� �ø����Ѵٸ� ��� ���ƾ��ϴ°ɱ�.. �ð��� ���õ� �޼ҵ� CurrentTimeMills������ ������ 
	//������� �ð����� �޶��� ��쿡�� ��ȸ���� �þ���� ����? ..  �׸��� ��ȸ�������� ���İ�����..? ��ȸ���� �迭�� ����� (���öǴ� �ڵ�)���ľ˰��� �����°ǰ�
	//�� Ʈ���Ȱ����ϰ��ݰ����� �������� ���°��ΰ�..DDOS
%>


<h1 align='center'>�캸��!</h1>

<a href='board.jsp' style="color:red;">���ư���</a>  

<p>
a(���ڸ�) �±׿����� align�Ӽ��� ������ �ȵǳ�.. div����ϳ�

404���� - ������ ��ã��
�׳� URL�� http://localhost:8080/ �˻��ϸ� ���� ���� index������ ������ �ʾұ⶧���� ������ �߰� ����. ������������ �� �̸�(index)���� ���ų� ������������ ����(server.xml - web.xml)

500���� - �ڵ���� ����
</body>
</html>