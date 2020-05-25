<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>경로 설정</h3>
/ : 현재 프로젝트 위치(포트번호까지 위치 - http://localhost:8080/)<br>
../ : 현재 위치에서 바로 전단계로 이동<br>
../../ : 현재 위치에서 전전단계로 이동<br>

경로는 슬래시 / 를 이용하여 폴더단위로 구분하며 지정한다. 
/를 쓰면 기존적으로 localhost:8080까지의 위치를 나타냄

cmd창에서 cd..과 cd ../ 는 같은 기능(슬래시는 폴더끼리의 상하관계구분용일뿐)


<h1>webContent.jsp입니다.</h1>
<a href='/getPost/test1/test1.jsp'>test1이동 합니다.</a><br>
<a href='/getPost/test1/test2/test2.jsp'>test2이동 합니다.</a><br>
http://localhost:8080/getPost/webContent.jsp -> 이 파일이 있는 위치<br>
파일의 경로 중 WebContent라는 폴더경로는 생략해야 오류가 안뜬다.<br>
중복되는 경로명이 존재할경우?<br>

-> 우리는 웹 프로그래밍을 하고 있기 때문에 기본적으로 webContent라는 폴더를 기본적으로 프로그램이 잡고 있다.
   따라서 해당 경로는 작성하지 않아야함(작성하면 오류..)
   나중에 해당 폴더를 기본적으로 잡아놓은 것을 변경하는 방법 배울 것임
   /getPost/test1/test1.jsp  ○
   /getPost/WebContent/test1/test1.jsp  ×



<h2>선생님 풀이</h2>
<a href="test1/test1.jsp">test1로 이동합니다.</a><br>
<a href="test1/test2/test2.jsp">test2로 이동합니다.</a><br>

또는<br>
<a href="/getPost/test1/test1.jsp">test1로 이동합니다.</a><br>

파일의 현재 위치를 기준으로 삼거나 기본위치를 기준으로 삼거나. (상대경로냐 절대경로냐)<br>
전반적으로 경로에 대한 부분은 리눅스와 비슷<br>


</body>
</html>

<!-- 
Ctrl + F를 통해 원하는 값을 찾고 해당하는 값을 원하는 값으로 전부 변경 가능하다. Replace All
EUC-KR 을 UTF-8로 변경하자
하나의 변경창으로 모든 jsp파일의 문자 변경 가능
-->