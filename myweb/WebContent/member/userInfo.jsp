<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="members.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function _delete(){
		var a = confirm('회원탈퇴하시겠습니까?')
		if (a){
			location.href='delete.jsp'
		}
	}
</script>

</head>
<body>


<jsp:useBean id="db" class="members.memberDAO"/>
<%
	String id = (String)session.getAttribute("id");
	memberDTO user = new memberDTO();
	user = db.personalView(id);
%>

<h1>개인정보</h1>


아이디 : <%= user.getId() %><br>  
비밀번호 : <%= user.getPwd() %><br>
이름 : <%= user.getName() %><br>
주소 : <%= user.getAddr() %><br>
전화번호 : <%= user.getTel() %><br>
<input type="button" value="수정" onclick='location.href="modifyInfo.jsp"'>
<input type="button" value="삭제" onclick='_delete()'>

</body>
</html>