<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name");
	String ssn1=request.getParameter("ssn1");
	String ssn2=request.getParameter("ssn2");
	if(name==null||name.trim().equals("")||ssn1==null||ssn1.trim().equals("")||ssn2==null||ssn2.trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	}
	
	boolean isMember = mbdao.checkMember(name, ssn1, ssn2);
	if(isMember){ //���̶�� ȸ���̶�� �� %>
		<script type="text/javascript"?>
			alert("�̹� ȸ���Դϴ�. �α����� ���ּ���!")
			self.close()
		</script>
	<%}else{ %>
		<form name="member" action="member.jsp" method="post">
			<input type="hidden" name="name" value="<%=name %>">
			<input type="hidden" name="ssn1" value="<%=ssn1 %>">
			<input type="hidden" name="ssn2" value="<%=ssn2 %>">
		</form>
		<script type="text/javascript">
			alert("ȸ�������������� �̵��մϴ�.")
			document.member.submit()
			<%-- location.href="member.jsp?name=<%=name%>&ssn1=<%=ssn1%>&ssn2=<%=ssn2%> --%>
		</script>
	<%}%>
</body>
</html>