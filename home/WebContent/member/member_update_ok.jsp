<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정 처리페이지</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"></jsp:useBean>
<%
	if (mbdto.getNo()==0){ //이전페이지에서 no값을 정상적으로 받아오지 못한경우. 또는 이 페이지로 바로 접근한 경우
		response.sendRedirect("memberAll.jsp");
		return;
	}
	int res = mbdao.updateMember(mbdto);
	String msg;
	if(res>0){
		msg="회원정보 수정 성공";
	}else{
		msg="회원정보 수정 실패";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>

</body>
</html>