<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    <!-- page지시어와 그 속성값들 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>첫번째 예제</title>
</head>
<body>
	<h1>Hello JSP 1</h1>
	<h2>Hello JSP 2</h2>
	<h3>Hello JSP 3</h3>
	<h4>Hello JSP 4</h4>
	<h5>Hello JSP 5</h5>
	<h6>Hello JSP 6</h6>
	<%for (int i=1; i<=9; ++i){ %>
	<!-- 스크립틀릿 : 자바코드를 HTML코드와 같이 입력할 수 있도록 설계 -->
			<h3>Hello JSP <%=i %></h3>	<!-- 표현식(표현스크립틀릿) : 자바코드 중 출력부분을 직접 사용할 수 있도록 설계 -->
	<%} %>
	<!-- 스크립틀릿 코드는 실제 페이지 소스로는 볼 수 없다. 서버에서 다 처리해서 html파일로만 만들어서 클라이언트에 넘기므로 -->
</body>
</html>