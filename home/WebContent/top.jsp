<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내가 만든 홈페이지</title>
<script type="text/javascript">  //jsp 파일은 어차피 java파일로 변환이 되므로 script를 어디에 두든 상관은 없지만 html에서는 맨 앞에 꼭 두어야한다.
	function openMember(){
	window.open("<%=request.getContextPath() %>/member/memberSsn.jsp", "memberverify", "width=650, height=400")
}
</script>
</head>
<body>
<%
	boolean isLogin = false;
	String loginId= (String)session.getAttribute("id");
	if(loginId!=null&&!(loginId.trim().equals(""))){
		isLogin=true;
	}
%>
<div align="center">
	<table border="1" width=800 height=600>
		<tr height="10%">
			<td colspan="2" align="center">
				<a href="<%=request.getContextPath() %>/index.jsp">main</a> |
				<%if(isLogin){ %>
					<a href="<%=request.getContextPath() %>/login/logout.jsp">로그아웃</a> |
				<%}else{ %>
					<a href="<%=request.getContextPath() %>/login/login.jsp">로그인</a> |
				 <%} %>
				<a href="javascript:openMember()">회원가입</a> | 
				<a href="<%=request.getContextPath() %>/member/memberAll.jsp">회원보기</a> |
				<a href="<%=request.getContextPath() %>/member/memberAll.jsp?cmd=find">회원찾기</a> |
				<a href="<%=request.getContextPath() %>/board/list.jsp">게시판</a> | 
				<a href="<%=request.getContextPath() %>/company.jsp">회사소개</a></td>
		</tr>
		<tr>
			<td width="20%">서브메뉴</td><td>