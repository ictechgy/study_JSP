<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
������ �������� - cook_session������ index.jsp �� popup.jsp, makeCookie.jsp����

cookieArr�� null���� �� ���� �ִ�. ����ڿ��� ó���� ��Ű�� ������ ������ �ƹ� ��Ű�� ������ ���� ���� ��������
�׷� ��쿡�� �ݺ������� ������ �߻��ϹǷ� ó�����־���Ѵ�..����ó��

<%
boolean chk = false;
Cookie[] cookieArr = request.getCookies();
if(cookieArr != null){
	for (Cookie c : cookieArr){
		if(c.getName().equals("myCookie")){
			chk=true;
		}
	}
}

if(chk==false){
%>
<script>window.open("popup.jsp")</script>

<%} %>


��Ű�� Ŭ���̾�Ʈ ��ǻ�Ϳ� �����־ �������� �ݾƵ� �����ϰ� ��(��ȿ�ð�����)
-> ��Ű������ ���ͳݱ�ϻ����� ���� ���� �� �ִ�.
���������� ��Ű�� ���� �����Ǵ°ǰ�?

Path�� Domain�� ��Ű�� ��μ����� �ϴ� �ǵ�, ��Ű�� ����Ǵ� ��θ� ����?
����Ǵ� ������� �ƴϸ� ��Ű�� Ư�� URL�� �������������� ���������� �ϴ°���(�⺻������ ������ �������� ��û�� �� ��Ű�� ��� ������� �ϴϱ�.. request�� �������� �޾Ƽ� ó���ϵ� �׷��� �ʵ�)


setMaxAge�ȿ� ��ȿ�������� ���� �� ���� ���� �� �ִ�.


���̹� �Ǵ� ���� jsp��Ű�˻�

��Ű���� ����°� setMaxAge�� ���ڰ��� 0���� �����ϰ� �ٽ� �����ָ� ��



http�� �񿬰Ἲ, ��Ű�� ������ ����ڸ� �ĺ��ϱ�����
��Ű�� Ŭ���̾�Ʈ������ ���ȿ� ���������, ������ ���ϰ� ��������

����..
�������� ����ִµ����� �����Ǵ� ��. �������� ����
������ ���� ���ϴ�. 

�α��ο� ������ ������ �ƴϳĸ� ������ �� ������ ������ �񱳸� �Ѵ�.

</body>
</html>