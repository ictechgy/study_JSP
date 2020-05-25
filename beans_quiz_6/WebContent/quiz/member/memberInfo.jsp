<%@page import="java.util.*"%>
<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div align="center" style="height: 300px;">
<h1>회원 목록</h1>
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
ArrayList<MemberDTO> memberList = mb.memberView();
if(memberList == null || memberList.size() == 0 ){
	out.print("<h1>등록된 값이 없습니다.</h1>");
}else{%>
	<table border='1'>
	<tr>
	<th width="100">이름</th>
	<th width="100">주소</th>
	<th width="100">전화번호</th>
	</tr>
	<%
	for(MemberDTO dto:memberList){
	%>
	<tr>
	
	<td style="cursor:pointer"
	onclick='location.href="userInfo.jsp?id=<%=dto.getId()%>"'>
	<%=dto.getName()%></td>
	
	<td><%=dto.getAddr()%></td>
	<td><%=dto.getTel()%></td>
	</tr>
	<%
	}out.print("</table>");
}
%>
</div>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>