<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("id");
	session.invalidate();	//����ڰ� �α׾ƿ��� �����ٸ� �������� �ش� ����ڿ� ���� ���� ��� ���ǰ� ����
%>
<script type="text/javascript">
	alert('�α׾ƿ��Ǿ����ϴ�.')
	location.href="sessionTest1.jsp"
</script>
</body>
</html>