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
	if(session.getAttribute("logeduser")==null){
		response.sendRedirect("login.jsp");
	}

	out.print(session.getAttribute("logeduser")+"�� �ȳ��ϼ���!<br>"   //getter�� Object�� ��ȯ�̱�� �ѵ�, �ٷ� ����� �ǳ�
	+"���� Ȩ�������� �湮���ּż� �����մϴ�.<br>"
	+"��ſ� �ð� �Ǽ���~");
%>

<form action="logout.jsp" method="post">
	<input type='submit' value="�α׾ƿ�">
	<input type='button' value='�α���������' onclick='location.href="login.jsp"'>
</form>

�̹� �α����� �Ǿ��ִµ�, �α����������� ������ ��� ó������� ���Ͽ�..
����� �ΰ����� �ִ�. �� �������� �̹� �α��� �� ������ ������ �� ������ �ٷ� �α��εǾ��ִٴ� �������� ���� ����ų�
�ƴϸ� �α����������� ������� �ϴµ� ���ǰ��� �ִٸ� �α��εǾ��ִٴ� �������� ���� ����ų�
�Ǵ� ������ó�� ������ ������ ���� login.jsp������ �����ڵ幮�� �ٸ��� �ۼ��� ���� �ִ�.



</body>
</html>