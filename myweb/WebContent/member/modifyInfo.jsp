<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function chk(){
		if(pwd.value==''){
			alert('비밀번호는 필수입력사항입니다.')
		}
		else{
			go.submit()
		}
		
	}
	
	function back(){
		var verify = confirm("취소하시겠습니까?")
		
		if(verify){
			history.back()
		}
		
	}
	
</script>

</head>
<body>

<jsp:useBean id='user' class="members.memberDTO"/>
<jsp:useBean id = 'db' class="members.memberDAO"/>
<%
	String id = (String)session.getAttribute("id");
	user = db.personalView(id);
%>

<form action="change.jsp" id=go method='post'>
비밀번호 <input type='text' value=<%=user.getPwd() %> id=pwd name=pwd><br>
이름 <input type='text' value=<%= user.getName() %> name=name><br>
주소 <input type='text' value=<%= user.getAddr() %> name=addr><br>
전화번호 <input type='text' value=<%= user.getTel() %> name=tel><br>
<input type="button" value="완료" onclick="chk()"><input type="button" value="취소" onclick="back()">
</form>

아이디도 변경가능하게 할 수 있으나 보통은 아이디는 변경불가하며 코드가 상당히 복잡해짐
userInfo.jsp파일에서 수정하겠다는 버튼을 누르면 자체적 내부페이지에서 보여지는 구성이 바뀌도록 할 수도 있을 것 같다..
</body>
</html>