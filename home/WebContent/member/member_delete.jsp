<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>
<% String no = request.getParameter("no");
	if(no==null||no.trim().equals("")){
		response.sendRedirect("memberAll.jsp");
		return;
	}
	
	int res=mbdao.deleteMember(Integer.parseInt(no));
	String msg=null;
	if(res>0){
		msg="ȸ������ �����Ͽ����ϴ�.";
	}else{
		msg="ȸ������ ����";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>

</body>
</html>