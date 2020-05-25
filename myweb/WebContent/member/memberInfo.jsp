<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="members.*, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그인한 경우에만 이 회원정보 페이지에 접근 가능. 다만 접근을 제한하는 방식에 있어서 이 페이지에서 로그인페이지로 넘길수도 있고
	//아니면 header.jsp에서 로그인했을때와 로그인안됐을 때의 회원정보 버튼의 링크목적지가 다르게 할 수도 있다.
	
	if (session.getAttribute("id")==null){
%>
	<script>
		alert('먼저 로그인하셔야합니다.')
		location.href="login.jsp"
	</script>
<%} %>
<jsp:include page="..\default\header.jsp"/>
<div align='center'>

<h1> 회원 목록 </h1>

<table border='1'>
	<tr>
		<th>이름</th><th>주소</th><th>전화번호</th>
	</tr>
	
	<%
		
		memberDAO db = new memberDAO();
		ArrayList<memberDTO> memberList = db.memberView();
		
		for(memberDTO users : memberList){  //for each문에서 받아주는 객체인 users는 밖에서 선언시 오류가 뜸. 문법이 그러함
			out.print("<tr>");
			out.print("<td><a href='personalInfo.jsp?id="+users.getId()+"'>"+users.getName()+"</a></td>");  
			out.print("<td>"+users.getAddr()+"</td>");
			out.print("<td>"+users.getTel()+"</td>");
			out.print("</tr>");
		}
		//특정 유저 이름 클릭시 정보를 뜨게 해줘야하는데 정보를 띄우는 페이지로 넘길 때 해당 유저의 id값을 넘겨줘야하는데
		//어떻게 넘겨야하지. 태그 주소뒤에 물음표를 추가해서? 세션생성?
	%>
	
</table>

</div>

<jsp:include page="..\default\footer.jsp"/>




</body>
</html>