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
MemberDTO m = new MemberDTO();  //m이라는 객체 생성. 그 객체에는 멤버변수들이 있음(메소드도)
m.setId(id);
m.setPwd(pwd);
//사용자가 입력한 값들로 m객체의 멤버변수에 할당
if( id.equals(m.getId()) && pwd.equals(m.getPwd())){
	out.print(m.getId()+"님 반갑습니다.");
}else{
	out.print("회원정보가 존재하지 않습니다");
}
%><br>
<a href="javascript:history.back()">이전</a>

이렇게 작성한건, 사용자의 값을 우리가 만든 m객체의 멤버변수에 먼저 저장하고
사용자의 값과 m객체의 멤버변수 값을 비교한 뒤에 로그인을 진행하므로 항상 로그인이 성공할 수 밖에 없다.
나중에는 데이터베이스의 값을 m객체에 저장시킬 것이다..그 뒤에 사용자가 입력한 값과 비교진행

<%
	String saveId = "test";
	String savePwd= "1234";
	m.setId(saveId); m.setPwd(savePwd);
	//요로코롬 만들어서 위에 내가 지정한 값을 입력한 경우에만 로그인이 되도록 만들어도 됨
%>


</body>
</html>