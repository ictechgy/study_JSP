<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div align="center"><h1>로그인 페이지 입니다</h1></div>
<div align="right">
    <form action="chkuser.jsp" method="post">
        <table>
	<tr>
	<td><input type="text" name="id" placeholder="아이디"></td>
	<td rowspan="2">
	<input type="submit" value="로그인"style="width:60px;height:55px;">
	</td></tr>
	<tr><td><input type="text" name="pwd" placeholder="비밀번호"></td></tr>
	<tr><td colspan="2" align="left">회원가입</td></tr>
        </table>
    </form>
</div>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>