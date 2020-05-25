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
<h1>개인 정보</h1>
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
ArrayList<MemberDTO> memberList = mb.memberView(request.getParameter("id"));
if(memberList == null || memberList.size() == 0 ){
	out.print("<h1>등록된 값이 없습니다.</h1>");
}else{
	for(MemberDTO dto:memberList){
	%>
	<table>
	<tr><th width="100">아 이 디</th><td><%=dto.getId()%></td></tr>
	<tr><th width="100">비밀번호</th><td><%=dto.getPwd()%></td></tr>
	<tr><th width="100">이 름</th><td><%=dto.getName()%></td></tr>
	<tr><th width="100">주 소</th><td><%=dto.getAddr()%></td></tr>
	<tr><th width="100">전화번호</th><td><%=dto.getTel()%></td></tr>
	</table>
	<% }
} %>
</div>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>