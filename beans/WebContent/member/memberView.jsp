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
<jsp:useBean id='mb' class='members.MemberDAO'/>   -> mb라는 객체 생성. 생성과 동시에 mb는 생성자를 통해 데이터베이스와 연결이 됨.
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
	//출력도 역시나 memberList[0].getId() 이런식으로 가능할 듯. 인덱스값 변경이 관건
%>

</body>
</html>