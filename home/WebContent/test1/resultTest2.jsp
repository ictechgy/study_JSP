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
	String id = (String)session.getAttribute("id");  //��ȯ���� ������ Object
	if(id==null||id.trim().equals("")){ %>
		<script type="text/javascript">
			alert('�α����� ���� ���ּ���!')
			location.href="sessionTest1.jsp"
		</script>
<%	}%>
<h1>�α��� �Ͻ� �и� ���� �� �ִ� ������</h1>
<h2>�α��� ���Ѻ��� ������ �ȵ˴ϴ�.</h2>
<h3><a href="resultTest3.jsp">�α׾ƿ�</a></h3>
</body>
</html>