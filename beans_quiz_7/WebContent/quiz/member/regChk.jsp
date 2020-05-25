<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="check" class="members.MemberDAO"/>

<jsp:useBean id="mb" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="mb"/>
<%
int howRow = 0 ;
int result = check.userCheck(mb.getId(), mb.getPwd());   //이전에 있던 메소드 재사용
if(result == -1)   //아이디값이 존재하지 않는 경우에만 회원가입 진행. 아이디값이 이미 존재한다면 howRow는 0으로 그대로 남고 밑의 else구문 실행될 듯
	howRow = check.chkRegister(mb);
if(howRow == 1){
	out.print("<script>alert('회원가입을 축하합니다.');"
				+"location.href='login.jsp';</script>");
}else{
	out.print("<script>alert('문제가 발생하였습니다. 관리자에게 문의하세요.');"
			+"location.href='register.jsp';</script>");  //history.back() 해도 될거같은데.. 근데 이 메소드는 뒤로가기 화살표 누른거랑 같은 역할인가?
}  //아이디값이 이미 존재하거나 회원가입메소드 진행도중 executeUpdate()구문쪽이 제대로 동작하지 않은 경우 문제발생메시지 출력
%>

</body>
</html>