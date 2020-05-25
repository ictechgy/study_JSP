<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
아이디 : <%= request.getParameter("id") %><br>
비밀번호 : <%= request.getParameter("pwd") %><br>
사용자 : <%= request.getParameter("user") %><br>
param value : <%= request.getParameter("name") %><br>
<a href='javascript:history.back()'>이전</a>

'이전'글자를 누르면 login.jsp파일로 돌아감. 신기한건 태그안에 자바스크립트를 쓰려고 저렇게 작성했다는 것. 자바스크립트에 기본적으로 정의되어있는 메소드를 쓰려고 저렇게 쓴 듯. 그냥 history.back()썼으면 인식 못했을라나 정의되어있는게 없어서?
마치 onclick으로 우리가 메소드들을 실행시켰듯.. 해당 페이지의 헤드쪽에서 정의해놓은 메소드 실행

forward태그를 쓰면 값들도 다 같이 넘겨줌. 따라서 그 다음페이지(몸통)에서 그대로 request로 받을 수 있음.. forward가 전부 다 같이 넘겨준다고 보면 됨

</body>
</html>

