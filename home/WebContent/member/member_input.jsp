<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO"/>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<%
	if(mbdto.getName()==null||mbdto.getName().trim().equals("")){
		response.sendRedirect("memberSsn.jsp");
		return;
	} //이거 왜 넣는거지
	
	int res = mbdao.insertMember(mbdto); 
	if(res>0){%>
		<script type="text/javascript">
			alert('회원가입 성공하셨습니다!')
			self.close()
		</script>
<%}else{ %>
	<script type="text/javascript">
		alert('회원가입 실패!! 회원가입페이지로 이동합니다.')
		location.href="memberSsn.jsp"	
	</script>
<%} %>
<body>

</body>
</html>