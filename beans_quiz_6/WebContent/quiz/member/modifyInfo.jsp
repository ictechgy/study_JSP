<%@page import="members.MemberDTO"%>
<%@page import="java.util.*"%>
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
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
ArrayList<MemberDTO> dto =  mb.memberView(request.getParameter("id"));
for(MemberDTO dt:dto){
	%>
	<div align="center">
	<form action="changeUser.jsp" method='post'>
	<input type="hidden" name="id" value="<%=dt.getId()%>"><br>
	<input type="hidden" name="pwd" value="<%=dt.getPwd()%>"><br>
	이 름 <input type="text" name="name" value="<%=dt.getName()%>"><br>
	주 소 <input type="text" name="addr" value="<%=dt.getAddr()%>"><br>
	전화번호 <input type="text" name="tel" value="<%=dt.getTel()%>"><br>
	<input type="submit" value="완료">
	<input type="reset" value="취소" onclick="javascript:history.back();">
	</form>
	</div>
<%}%>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>