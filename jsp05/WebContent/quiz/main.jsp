<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type='button' value='가입' onclick="location.href='register.jsp'">

다만 저렇게 중첩으로 따옴표 쓰면 서로 다른 따옴표로 만들어야하네.. 
onclick='location.href='register.jsp'' 이렇게 쓰면 location.href=까지 단위하나 끝나고 가운데의 register.jsp는 어떤 값도 아니게 됨

</body>
</html>