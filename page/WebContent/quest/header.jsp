<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	ul li{ display:inline; padding:0 30px}
</style>
<title>Insert title here</title>
</head>
<body>
<hr>
<div align='center'>
<ul>
	<li><a href='sub.jsp'>서브페이지</a></li>
	<li><a href='error.jsp'>카페</a></li>
	<li><a href='main.jsp'>메인페이지</a></li>
	<li><input type='text' name='search' placeholder='검색하고자 하는 단어 입력'><input type='submit' value='검색'></li>
</ul>
<hr>
</div>

div를 통해 전체적 페이지의 중간에 출력되도록 만듬
검색버튼은 form으로 감싸주지 않았으므로 작동하지는 않음. 일단 모양만


error페이지가 다른 곳에 있을 경우 에러페이지로 가는 경로는 달라질 것이며 
error.jsp에서 메인과 서브로 오는 경로도 달라져야 할 것이다... 
절대경로를 써도 된다.

이외의 다른 코드상의 에러나 페이지를 찾지 못했을 경우의 에러에 대해서는 페이지지시자를 통해 지정해줄 수 있다.
<%@ page errorPage='error.jsp' %> 뭐 이렇게




</body>
</html>