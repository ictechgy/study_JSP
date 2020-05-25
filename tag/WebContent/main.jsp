<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
인클루드 지시자
<%@include file="jspInclude.jsp" %>
<p class='cl'>나는나 <%=n %>너는너</p>
이렇게 하면 정의해놓은 cl클래스와 변수 등까지 이어받는다. 즉 기존의 파일을 이 페이지에 통째로 포함시키는 것이다.
그 안의 값들을 전부 다 사용가능. 상속같음


인클루드 태그
<jsp:include page="jspInclude.jsp"/>
이렇게 하면.. 페이지를 끌어다가 쓰기는 하는데 포함시키기는 하는데 단면적으로 표현되는 부분만 적용하겠다는 것
정의되어있던 클래스나 변수를 쓰지는 못한다.
마치 클라이언트에서 보는 화면적인 정보같은거만 가져오듯..



</body>
</html>