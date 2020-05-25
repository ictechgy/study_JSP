<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

JSP코드쪽은 서버에서 처리하고 html은 클라이언트쪽 브라우저에서 분석 
클라이언트에서는 JSP코드를 분석할 수 없고..(왜일까 보안때문일까?) 서버쪽에서 JSP파일을 html로 처리한 뒤에 던져줌.. F12를 눌러보면 JSP코드 못봄

페이지를 요청하고 서버는 "아 ~ 파일을 요청하는구나.." 하고 해당 파일에 대해 JSP코드를 분석하고 그 결과를 html과 섞어서 보냄.
setAttribute를 이용해 어떤 속성값을 정해주면 그에 대한 변수공간(?)과 값은 서버에서 가지고있음.

클라이언트는 CSS Style과 html값 및 자바스크립트만 번역하여 처리. JSP코드는 서버에서 처리

<p>

page지시자에서 language가 java를 쓰도록 했는데 다른 프로그래밍언어를 쓸 수도 있는건가

<script type='text/javascript'>   위에 page지시자에 있는 contentType 값도 그렇고 여기 type값도 그렇고 저 말이 의미하는거는 뭘까
	document.write("<br>화면에 출력 할 값");  //화면에 출력하는 메소드
	//document 현재 페이지에 대한 객체. write ~내용을 써주겠습니다. 
	//역시나 <br> html태그 적용 가능
	
	//세미콜론 생략 가능.
	//쌍따옴표든 홑따옴표든 혼용 가능
	alert('환영합니다~')
	//팝업창 띄움
	
	//변수는 var키워드. 
	var a = confirm("처음 방문입니까..??")
	//이렇게 쓰면 해당메지를 띄우며 사용자에게 질문을 함. 확인 누르면 a에는 true가 들어가고 취소 누르면 false가 들어감
	document.write(a)
	if(a == true){
		alert('환영합니다~~~')
	}
	else{
		alert('저리가!~~~')
	}
	
</script>
스크립트 태그를 본다면.. 아 자바스크립트라는 언어를 사용하는구나~ 라고 보면 됨
하나의 언어이기때문에 문법이 존재한다.
예전에 헤더쪽에 썼었다고 생각했는데.. 맞네.. form태그에서 onclick속성으로.. 클릭 발생시 스크립트 메소드 실행했던거
사용자가 입력한 아이디와 패스워드가 1인지를 검증하는 메소드 구현했을 때 썼었다..

팝업창이 뜨는 부분에서 페이지구성이 잠시 멈췄다가 팝업창 띄운 뒤에 밑의 내용이 보임


<input type='text' id ='demo' size='50'>  id라는 건 name과 비슷.. 다만 스크립트쪽에서 쓰기위해서 쓰는건가
<script type='text/javascript'>
	demo.value='안녕하세요'
</script>
위와같이 작성 후 페이지를 실행시켜보면 마치 input태그에 value속성을 정해놓은 듯 입력칸 안에 "안녕하세요"가 들어가있다. 

id를 통해서 스크립트쪽에서 바로 클래스(객체)처럼 사용.. demo라는 이름을 name속성으로 정해도 쓸 수는 있는 것 같은데.. 그러면 굳이 id를 쓸 이유가 있는건가
-> id는 태그들마다 이름을 중복하여 만들어 줄 수 없다. 즉 고유하게 딱 하나만 처리할 때 쓴다.
   name은 태그들마다 중복하여 만들 수 있고, 그렇기때문에 배열을 다루는데에 좋다.(예를 들면 라디오나 체크박스를 제어할 때 쓸 수 있음)


id는 현재 페이지에서만 식별가능함.... name은 다른 페이지로 값을 넘겨줄 수 있지만..  -> 진짜일까.. submit버튼으로 값 넘겨주면 받는 쪽에서 request.getParameter()로 값을 받을 수 있는데 저 안에는 name 이름만 들어올 수 있는건가


<script type='text/javascript'>
	var a = 100
	b = 'test'     //쌍따옴표 안써줘도 되고.. 주석은 자바와 동일
	document.write(a)
	document.write(b)
</script>
파이썬과 같이 변수 타입을 따로 지정해주지 않아도 됨.. var키워드 또한 생략 가능



CSS Style이나 스크립트는 보통 header쪽에 둔다.(개별적으로 필요한 경우 body중간중간이나 태그들에서 잠깐 쓰일수는 있다.)
그냥 type속성을 안넣고 스크립트라고만 써도 됨

함수에 대해서 알아보자.. 반환형 안써줌
<script>
	function display(){
		alert('click 이벤트 발생')
	}
</script>

<input type='button' value='버튼' onclick='display()'><br>
<button type='button' onclick='display()'>클릭</button><br>
onclick - 버튼을 클릭했다면.. 

form태그 속성안에 onclick을 썼다면.. reset버튼같은걸 눌렀을때에도 작동되는걸까

<table>
	<tr>
		<td onclick='display()'>클릭</td>
	</tr>
</table>
"클릭"이라는 단순 문자를 눌렀을 시에 메소드 작동


form태그에서 action을 통해서는 하나의 페이지만을 요구할 수 있었음..
이제는 onclick을 통해서 서로 다른 메소드가 작동되도록 하거나.. 하나의 메소드를 실행시키도록 만들어도 if문 등으로 다른 결과를 만들도록 함으로서..  버튼마다 각자 요구하는 페이지를 다르게 만들 수 있음

또는 그냥 아래처럼 써도 된다..(메소드가 아닌 URL이나 파일을 연결)

<td onclick="location.href='test.jsp'">클릭</td>
다른페이지로 이동하고자 할때에는 location사용

따라서 클릭시에 메소드를 실행시키게 할 수도 있고 다른페이지로 넘어가게 할 수도 있다.


회원가입시에 ~~사항은 필수입니다~ 메시지
<script>
	function chkData(){
		if(document.getElementById('name').value==''){  //굳이 .value를 해줘야하나.. document.getElementById('name') == '' 이렇게 쓸 수는 없나.
		alert("이름은 필수사항입니다")
		}
		else{
			fo.submit()
			//document.fo.submit() 이라고 쓸 수도 있다.
			//response객체는 JSP에서만..response.sendRedirectURL 메소드였나.. 다른페이지 가도록 하는거 그거 써줘도 될거같은데.. 이 스크립트문 안에 < % % > 씀으로서!
			//아 다만 그렇게 하면 값이 전송이 되지는 않을듯?
		}
	
</script>

<form name='fo' action='test.jsp' method='post'>
	<input type='text' id='name' name='name' placeholder='이름'>(*필수항목)<br>
	<input type='button' value='입력' onclick='chkData()'>
</form>
일단 스크립트메소드가 실행되면 form태그의 action은 작동중지인가보구나.. ㄴㄴ 버튼이 submit버튼이 아니었음 ㅋㅋ

id는 현재페이지에서 구별하는 값. name은 넘어갔을때의 구별하는 값. 보통은 두개 동일하게 작명

fo.submit을 통해 전송하겠다는 메소드.. 다만 fo를 name이라고 해뒀는데 id라고 써도 되나? ㅇㅇ 그렇게 해도 작동함.

현재 입력버튼이 단순히 button이므로 누른다고 해서 페이지 이동이 일어나지는 않는다. 
만약 submit으로 만들었다면 아무것도 입력안한경우 경고메시지 뜨고 페이지 이동 일어남


id라는 속성이나 name이라는 속성이나 필요에 따라서 쓰면 된다. 고유한 값으로만 쓸거면 id쓰면 되고.. 그게 아니라 여러값을 처리해야하거나 다른 페이지로 값 넘길때는 name쓰고
id속성을 지정한건 값 던질시에 받는 페이지에서 못받나.. request객체에 id이름을 통해 값을 받는 메소드는 없나?

document.getElementById()뿐만 아니라 document.getElementsByName()메소드도 있다. 다만 name을 통해 받을 수 있는 값은 여러개가 될 수 있어서 s스펠링이 더 붙었음



</body>
</html>