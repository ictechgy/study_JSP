<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
	function pwchk(){
		inPut = document.getElementById('inPut').value
		document.getElementById('outPut').value=inPut
		document.getElemnetById('inPut').value=""
		
		document.getElementById('label').innerHTML='잘 들어가나'
	}
	
</script>


</head>
<body>

document.getElementById().value를 통해 id값의 value를 가져도 와봤고.. 
스크립트에서 submit()도 작동시켜보았다.
onclick을 통해 메소드를 작동도 시켜보았고 내부에 location.href를 둠으로서 다른 페이지로 이동하도록도 만들었다.

강의파일 -> js.jsp파일 및 test.jsp파일


마우스 커서가 이동된다면 처리하는 내용 배우자(단순히 이동이 아닌 다른 부분을 클릭했을시 작동하는 속성)

<hr>
	<input type='text' id ='inPut' onchange='pwchk()'><br> 
	<input type='text' id='outPut'><br>
	<input type='text'><br>
<hr>

onclick - 클릭이벤트발생시 작동하는 속성
onchange - 포커스위치가 바뀐다면 작동하는 속성

첫번째 칸 클릭 후 값 입력한 다음에 다른 위치를 클릭하면 onchange속성발동 후 pwchk()메소드가 작동한다.
코드알고리즘에 의하여.. 
두번째칸으로 값이 이동하고 첫번째 칸의 값은 사라짐

<p>

안녕하세요
<p>
위에 쓴 "안녕하세요"라는 글자는 단순히 글자일뿐 어떠한 기능도 하지 못한다.
공간에 id를 부여하고 사용할 때 label태그 사용
<p>
<label id='label'>안녕하세요</label>

라벨태그가 있는 곳에 이제 스크립트 메소드를 쓸 수 있다. 
즉 해당 공간을 이제 가리킬 수 있으니 다양하게 만들 수 있다. 



</body>
</html>