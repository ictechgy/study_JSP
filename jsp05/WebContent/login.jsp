<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function comparePWD(){
		if (document.getElementById('PWD').value == document.getElementById('sePWD').value){
				document.getElementById('label').innerHTML='비밀번호 일치!'
		}
		else{
			document.getElementById('label').innerHTML='비밀번호 불일치!'
		}
	}
	
	function chk(){
		if (document.getElementById('ID').value==''){
			alert("아이디는 필수사항입니다!")		
		}
		else if(document.getElementById('PWD').value==''){
			alert("비밀번호는 필수사항입니다!")	
		}
		else if(document.getElementById('PWD').value!=document.getElementById('sePWD').value){
			alert("비밀번호가 일치하는지 확인해주세요")
		}
		
		else{  //아이디 비밀번호 모두 입력했고 비밀번호확인까지 다 일치하는 경우.
			var a = confirm("회원가입하시겠습니까?")
			if (a){
				log.submit()
			}
			
		}
		//이러한 자바스크립트는 클라이언트쪽에서 작동하도록 되어있다. 모든 단계가 끝나면 log.submit()을 통해 action태그가 작동하고 값을 던져주면서 다음 페이지를 클라이언트가 서버에게 요구한다.
		//그러면 서버는 해당값을 받고, 요구받은 페이지를 구성한다음에 다시 던져주는 것이다.
		
		//response.sendRedirectURL 는 JSP코드로서 자바스크립트구역 안에서 쓰일 수 있을지 없을지도 모르겠고..더군다나 페이지는 이동시켜줄 수 있지만 값을 넘겨줄 수가 없음
		//따라서 response객체메소드나 form action태그, onclick 속성태그등을 적절하게 잘 쓰도록 한다.
	}
	
	
	
</script>

</head>
<body>

<h1>계정 등록</h1>

<form id='log' action='result.jsp' method='post'>
<input type='text' placeholder='아이디' id='ID' name='ID'>*필수사항<br>
<input type='password' placeholder='비밀번호' id='PWD' name='PWD'>*필수사항<br>
<input type='password' placeholder='비밀번호 확인' id='sePWD' onchange='comparePWD()'><label id='label'></label><br>
<input type='text' placeholder='이름' name='username'><br>
<hr>
<input type='button' value='등록' onclick='chk()'>

</form>



<p>
document.getElementsByName()도 존재

필요에 따라서 form action을 쓰거나
onclick을 통해 메소드 작동 또는 location.href로 페이지 이동

id값은 내부적으로 쓰거나 고유한 값을 처리할 때 사용
name은 외부로 값을 보내거나 배열의 값을 처리할 때 사용(라디오 또는 체크박스타입 처리)



onclick(클릭이일어난다면)은 해당 버튼을 클릭한 경우에 작동하도록 만드는거고
onchange(변화가일어난다면)는 해당 위치가 아닌 다른 곳을 클릭했을시에 작동하도록 만드는 html 태그 내 속성(attribute)
상호보완적 속성값


getElementById를 통해 id값을 쓰면 특정 ID를 선택하는 것. 그래서 value라는 멤버변수 사용

session.getAttribute 같은 속성 getter는 반환형이 Object이다. 필요에 따라 cast형변환 필요



</body>
</html>