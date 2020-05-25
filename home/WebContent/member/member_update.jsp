<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="home.member.*"%>
    <jsp:useBean id="mbdao" class="home.member.MemberDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원수정페이지</title>
<script type="text/javascript">
	function check(){
		if(f.passwd.value=""){
			alert('비밀번호를 입력하세요!')
			f.passwd.focus()
			return;
		}
		document.f.submit()
	}
	//근데 input 태그의 속성으로서 minlength라던지 필수입력같은 속성 이용해서 반드시 입력하도록 만들 수 있지 않나? - required 속성 존재함
</script>
</head>
<%
	String no = request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	MemberDTO dto = mbdao.getMember(Integer.parseInt(no));
%> 
<body onload="f.name.focus()">
<form name="f" method="post" action="member_update_ok.jsp">
	<table width="600" align="center">
	<input type="hidden" name="no" value="<%=no %>">
		<tr>
			<td colspan="2" align="center">회원수정</td>
		</tr>
		<tr>
			<td width="150">이름</td>
			<td>
				<input type="text" name="name" value="<%=dto.getName() %>" disabled>   <!-- disabled한 부분은 전송이 안된다?! -->
				<input type="hidden" name="name" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<td width="150">아이디</td>
			<td><input type="text" name="id" value="<%=dto.getId() %>" readonly></td>
		</tr>
		<tr>
			<td width="150">비밀번호</td>
			<td><input type="password" name="passwd" value="<%=dto.getPasswd()%>"></td>
		</tr>
		<tr>
			<td width="150">주민번호</td>
			<td><input type="text" name="ssn1" value="<%=dto.getSsn1()%>" readonly size="6">-<input type="password" name="ssn2" value="<%=dto.getSsn2()%>" readonly size="7"></td>
		</tr>
		<tr>
			<td width="150">이메일</td>
			<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<td width="150">연락처</td>
			<td>
				<input type="text" name="ph1" size="3" maxlength="3" value="<%=dto.getHp1()%>">-
				<input type="text" name="ph2" size="4" maxlength="4" value="<%=dto.getHp2()%>">-
				<input type="text" name="ph3" size="4" maxlength="4"value="<%=dto.getHp3()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="javascript:check()">[수정]</a>
				<a href="#">[취소]</a>
			</td>
		</tr>
	</table>
</form>




</body>
</html>