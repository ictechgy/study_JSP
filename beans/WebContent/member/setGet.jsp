<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
useBean�±׸� �̿��Ͽ� ��ü�� ���� �ڿ� ���� ����������� �̿� �� �� ��ũ��Ʋ���� ���� getter setter�޼ҵ带 ��µ� �װ� �ƴ� �±׸� �̿��غ���

<jsp:useBean id="mb" class="members.MemberDTO"/>

�̸� : <jsp:getProperty property="id" name="mb"/><br>
��й�ȣ : <jsp:getProperty property="pwd" name="mb"/><br>

���� ������ �� ����� ���� ����ϱ�<p>
<jsp:setProperty name="mb" property="id" value="ȫ�浿"/>
<jsp:setProperty name="mb" property="pwd" value="1234"/>

�̸� : <jsp:getProperty property="id" name="mb"/><br>
��й�ȣ : <jsp:getProperty property="pwd" name="mb"/><br>



Beans�� ���� getProperty��� ����. getter�� ���.
useBean���� ��ü�����ÿ��� ��� ����.(��ũ��Ʋ������ ��ü����� getProperty�� setPropery�±� ������?) property���� ����������� ���� name���� ��ü���� �ۼ��ϸ� �ȴ�.
Ư������ ������ �� ����Ѵ�.

setProperty�� setter�� ����ϴ�.

�ٵ� ��ũ��Ʋ������ ��ü ����� �Ͱ� �̷��� useBean�±׸� ���� �Ϳ� �־ ��ü���������� �ٸ�����?
useBean���� ��𿡼� ó���� �Ǵ°ɱ�? ����? Ŭ���̾�Ʈ?


</body>
</html>