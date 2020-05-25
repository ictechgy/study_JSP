<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
	.cl{font-size:40pt; color:red}
	//클래스 정의. 앞으로 cl이라는 클래스를 부르면 해당부분은 style css를 적용한 것과 같아진다.
	//아예 대놓고 특정 태그는 어떤 스타일을 쓰도록 할 수도 있는데 개별적으로 해당 태그에서 style속성을 이용함으로서 다르게 구성할 수 있음. 마치 전역변수 지역변수에서 지역변수가 우선이듯이
</style>

</head>
<body>
인클루드 지시자를 배웠었다. 이번에는 인클루드 액션태그를 배우자
	<p class='cl'>안녕하세요</p>
	<% String n = "홍길동"; %>

</body>
</html>