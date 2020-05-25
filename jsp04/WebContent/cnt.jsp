<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String scount = (String)application.getAttribute("count");
	if(scount != null){
		int c = Integer.parseInt(scount);
		c++;
		scount = Integer.toString(c);
		application.setAttribute("count", scount);
	}
	else{
		application.setAttribute("count", "1");
	}

%>
<h1>게시글 입니다.</h1>
<h2>공지사항 입니다.</h2>
jsp application을 이용한<br>조회수 올리기 문제입니다<br>

<a href='solution.jsp'>돌아가기</a>


선생님은 위와같이 게시글페이지에 들어가진 경우에 초기값 1이 만들어지도록 만들었다.
그런데 setter에서 굳이 두번째 인자에 문자값만이 들어가야하는가? ㄴㄴ 정수값이 들어가도 되긴 함. 메소드 형태보면..

</body>
</html>
