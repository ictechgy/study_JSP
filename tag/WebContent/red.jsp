<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
red파일입니다.<br>
브라우저 색은 어떤 색일까요..??<br>
노란색일까요..?<br>
<hr>
<jsp:forward page = "yellow.jsp"/>     <!-- 마지막에 슬래시를 넣으면 </jsp:forward> 닫는것과 동일 -->
사용자에게 페이지를 던져주는건데 페이지 이름 자체는 red.jsp파일이 뜸. 즉 red.jsp파일이라는 이름으로 yellow.jsp파일을 띄울 수 있고
red.jsp파일에서 어떠한 값이 수행되는지를 감출 수 있다. 반대로 말하자면 yellow.jsp파일을 red.jsp파일이름으로 실행시키는 것
(red.jsp파일의 내용을 감추면서 내부 내용은 yellow.jsp내용이 뜨는 듯 하다. 서로의 이름과 몸체내용을 뽑아서 합치는 것. 즉 두개의 파일에서 하나는 이름을 가져오고 하나는 몸체를가져와서 짬뽕시킨다음에 보여주는 방식같다.)

</body>
</html>