<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���� ó��������</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="mbdto" class="home.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mbdto"/>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"></jsp:useBean>
<%
	if (mbdto.getNo()==0){ //�������������� no���� ���������� �޾ƿ��� ���Ѱ��. �Ǵ� �� �������� �ٷ� ������ ���
		response.sendRedirect("memberAll.jsp");
		return;
	}
	int res = mbdao.updateMember(mbdto);
	String msg;
	if(res>0){
		msg="ȸ������ ���� ����";
	}else{
		msg="ȸ������ ���� ����";
	}
%>
<script>
	alert("<%=msg%>")
	location.href="memberAll.jsp"
</script>

</body>
</html>