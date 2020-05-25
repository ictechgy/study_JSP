<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 align='center'>설문조사</h1>

<p>

<form action='views.jsp' method='post'>

이름 : <input type='text' name='username' placeholder='이름 입력'><p>

소개 : <textarea rows="5" cols="30" name='introduce'></textarea><p>
(rows는 세로길이, cols는 가로길이를 뜻한다. 단위는 px?)

<fieldset>
	<legend>연령 조사</legend>  (legend는 범례라고 하여, 책이나 글 등의 앞에 쓰는 설명같은 것이라고 한다. )
	<input type='radio' name='age' value='10대'>10대
	<input type='radio' name='age' value='20대'>20대
	<input type='radio' name='age' value='30대'>30대
	<input type='radio' name='age' value='40대'>40대
</fieldset><br>

<fieldset>
	<legend>취미 조사</legend>
	<input type='checkbox' name='hobby' value='책읽기'>책읽기
	<input type='checkbox' name='hobby' value='춤추기'>춤추기
	<input type='checkbox' name='hobby' value='멍때리기'>멍 때리기
</fieldset><br>

<input type='submit' value='전송'>
</form>
문제는 취미값을 여러개 입력시 어떻게 전부 받느냐의 문제.
여러개 선택해도 하나밖에 출력되지 않는다.

굳이 전체를 다 form태그로 감싸주어야하는가. submit쪽만 감싸준다면 값의 전송이 이루어지지 않나
서로 다른 form안에 있는 값들은 전송 누르면 전부 다 값이 던져지는가. 아니면 전송버튼과 같이있는 form 안쪽값들만 던져지는가
그리고 같은 이름이 여러개인경우 어떻게 받는가
(같은 폼 내에서 text이름들이 같은 name을 쓰는경우, 또는 다른 form끼리 서로 중복되는 이름을 쓰는경우)

또한 두 jsp파일의 인코딩방식이 EUC-KR인 경우 특수한 한글값은 깨짐. 떕같은 단어
(views.jsp에서 setCharacterEncoding(UTF-8)을 해도 두 jsp파일이 EUC-KR방식이면 깨짐.. 이럴때는 인코딩 동일하게 EUC-KR해야하나)


<p></p>

선생님 풀이

<form action = 'views.jsp' method='post'>
	이름 : <input type='text' name='name'><br>
	소개 : <textarea rows='5' cols='10' name='so'></textarea><br>
	
	<fieldset>
		<legend>연령 조사</legend>
		10대 <input type='radio' value="10대" name='age' checked>
		20대 <input type='radio' value='20대' name='age'>
		30대 <input type='radio' value='30대' name='age'>
		40대 <input type='radio' value='40대' name='age'>
	</fieldset>


	<fieldset>
		<legend>취미 조사</legend>
		책읽기 <input type='checkbox' value="책읽기" name='hobby'>
		공부하기 <input type='checkbox' value='공부하기' name='hobby'>
		게임하기 <input type='checkbox' value='게임하기' name='hobby'>
	</fieldset>

<input type='submit' value='전송'>

</form>




</body>
</html>