<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	}else{
		application.setAttribute("count", "1");
	}
%>
<h1>게시글 입니다</h1>
<h3>공지사항 입니다</h3><hr>
jsp application을 이용한<br>
조회수 올리기 문제 입니다<br>
<a href="quiz.jsp">돌아가기</a>
</body>
</html>

이 페이지를 새로고침하면 count값이 계속 오른다.. 당연히 저 스크립틀릿의 코드가 계속 실행되니까 당연한거겠지.
즉 새로고침은 이 페이지를 다시 요청하는거고 서버는 이 페이지를 다시 처음부터 작동시켜서 html파일로 다 변환후에 다시 던지는거니까.. 당연

만약에 사용자가 quiz.jsp파일을 먼저 안보고 이 파일을 먼저 본다고 한다면.. 그 때에도 조회수는 1부터 시작하여 올라가는 방식이 되겠지..

그리고.. 처음에 사용자가 quiz.jsp파일을 요청하면 조회수는 null.. cont.jsp페이지를 요청하면 알고리즘에 의해 count는 1이 되는데 아직 사용자가 그걸 확인하지는 못함.
이제 '돌아가기'버튼으로 quiz.jsp파일을 다시 요청하면 그 순간 서버에서 quiz.jsp파일의 구성을 진행하는데 그 때 count의 값이 1이니까 조회수부분에 1값이 들어간 형태로 html파일을 던져줌.
이를 클라이언트 브라우저가 해석하여 화면에 출력













