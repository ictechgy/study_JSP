<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <%@ page import="members.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id='mb' class='members.MemberDAO'/>   -> mb��� ��ü ����. ������ ���ÿ� mb�� �����ڸ� ���� �����ͺ��̽��� ������ ��.
<%
	ArrayList<MemberDTO> memberList=null;
	memberList = mb.memberView();
	for (MemberDTO dto : memberList){
		out.print("id : " + dto.getId()+"<br>");
		out.print("pwd : " + dto.getPwd()+"<br>");
		out.print("name : " + dto.getName()+"<br>");
		out.print("addr : " + dto.getAddr()+"<br>");
		out.print("tel : " + dto.getTel()+"<p>");
	}
	//��µ� ���ó� memberList[0].getId() �̷������� ������ ��. �ε����� ������ ����
%>

</body>
</html>