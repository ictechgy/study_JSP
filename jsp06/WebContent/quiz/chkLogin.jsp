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
	request.setCharacterEncoding("utf-8");
	String id = "1";
	String pwd= "1";
	String username = "ȫ�浿";
	
	if ( id.equals(request.getParameter("id")) && pwd.equals(request.getParameter("pwd"))){
		session.setAttribute("logeduser", username);
		response.sendRedirect("main.jsp");
	}
	else{
%>		
	<script>
		alert("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�!")
	</script>	
<%		
		response.sendRedirect("login.jsp");
	}
%>
</body>
</html>
<!--  �� �������� ���������� �Ѱ��༭ ����Ǵ°� �ƴϰ� �ٸ� �������� �Ѱ��� ���̶� ����� ��ũ��Ʈ���� �۵����� �ʴ´�. �� ������������ Ŭ���̾�Ʈ�� �� ���� ����..
�װ� ��ġ���� �׳� �α������������� ���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʴ´ٴ� �޽����� ��쵵�� login.jsp������ �����ϰų�.. �ƴϸ� else�κ���
else { %>
	<script>
		alert("���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�!")
		location.href="login.jsp"
	</script>
< % } %>
�̷������� �ۼ��ϸ� �� ��?

�α��ο������� ��� login.jsp������ �ٷ� �����°� �ƴ϶� ���������� �� ��ũ��Ʈ���� ���� ���������� login.jsp������ �䱸�ް� ���� login.jsp������ �ι�°�� ������ �������

 -->