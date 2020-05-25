<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="result.jsp">
<input type='text' name='aaa'><br>
<input type='radio' name='gen' >남 <input type='radio' name='gen' >여  <br>
<input type='submit' value='전송'>
</form>

남여선택에 대해 name을 같게 함으로서 둘 중 하나만 선택할 수 있게 하였다.
그런데 받아오는 쪽에서 남자인지 여자인지 구분은 어찌?
각각의 radio에 value값을 정해두고 그걸 result쪽에서 if문으로 걸러야하는건가
아 아니면 그냥 value값을 지정만 해두면 되겠구나. 다르게 value만 작성해주면 받아오는 쪽에서는 gen이라는 같은 이름이지만 서로 다른 value를 받아올테니..

만약 그냥 체크박스였다면.. 음.. 역시나 체크박스여도 체크박스 옆에 어떤 내용을 쓰느냐에 따라 체크박스의 value나 name을 적절히 설정 해야겠지? 
체크박스에 개인정보 처리방침 동의 라고 만들었다면.. 
name은 개인정보처리동의 라고 이름짓고.. value는 뭐.. 동의한다는 걸로? 만들어놔야하나. 나중에 회원가입버튼 누를 때 해당 체크박스 체크 안했다고 하려면 고유 name같은걸로 파악해서 그거 체크하라고 경고문도 띄울 수 있어야 할테고
만약 취미를 체크하는거였다면 ..등


선생님 풀이

<form action='result.jsp'>
	<input type='text' name='test'>    <!-- value를 통해 기본값을 둘 수도 있고 placeholder를 통해 사라지는 값 가능 -->
	<input type='radio' name="s" value="남자">남
	<input type='radio' name='s' value="여자">여
	<input type='submit'>

</form>






</body>
</html>