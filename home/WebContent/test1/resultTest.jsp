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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//���̵� admin����, ��й�ȣ�� 1234�� ���� ������ �α����� �ȴٰ� ����
	if (id.equals("admin")&&pwd.equals("1234")){ 
		session.setAttribute("id", "admin");
		session.setMaxInactiveInterval(60*30);%>
		<script type="text/javascript">
			alert('�α����� �Ǿ����ϴ�.')
			location.href="resultTest2.jsp"
		</script>
<% 	}%>
</body>
</html>