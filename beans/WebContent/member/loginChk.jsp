<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="members.MemberDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberDTO m = new MemberDTO();  //m�̶�� ��ü ����. �� ��ü���� ����������� ����(�޼ҵ嵵)
m.setId(id);
m.setPwd(pwd);
//����ڰ� �Է��� ����� m��ü�� ��������� �Ҵ�
if( id.equals(m.getId()) && pwd.equals(m.getPwd())){
	out.print(m.getId()+"�� �ݰ����ϴ�.");
}else{
	out.print("ȸ�������� �������� �ʽ��ϴ�");
}
%><br>
<a href="javascript:history.back()">����</a>

�̷��� �ۼ��Ѱ�, ������� ���� �츮�� ���� m��ü�� ��������� ���� �����ϰ�
������� ���� m��ü�� ������� ���� ���� �ڿ� �α����� �����ϹǷ� �׻� �α����� ������ �� �ۿ� ����.
���߿��� �����ͺ��̽��� ���� m��ü�� �����ų ���̴�..�� �ڿ� ����ڰ� �Է��� ���� ������

<%
	String saveId = "test";
	String savePwd= "1234";
	m.setId(saveId); m.setPwd(savePwd);
	//����ڷ� ���� ���� ���� ������ ���� �Է��� ��쿡�� �α����� �ǵ��� ���� ��
%>


</body>
</html>