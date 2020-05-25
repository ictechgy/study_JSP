<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- 스크립트를 통한 메소드는 보통 헤드에 존재. 메소드가 정의되기전에 body에서 실행되는 것 방지 
스크립틀릿처럼 느낌표! 써서 선언문처럼 하는 것은 없나 
-->
<script>
	function pwchk(){
		pwd=document.getElementById('pwd').value
		pwd2=document.getElementById('pwd2').value
		if (pwd == pwd2){
			docuemnt.getElementById('label').innerHTML='일치합니다'
		}
		else{
			document.getElementById('pwd').value=''
			document.getElementById('pwd2').value=''
			document.getElementById('label').innerHTML='불일치'
			
			document.getElementById("pwd").focus()
			//비밀번호 불일치시 내용을 지우고 포커스의 위치를 pwd쪽으로 변경
			
			//불일치시 내용을 지우는게 아니라 포커스를 pwd2쪽으로 가도록 만들면..그게 더 낫지 않을까 생각했는데
			//사용자가 그냥 아예 pwd값부터 바꾸려 하는경우 그걸 막아버려서.. 그건 또 아닌 듯
		}
		
		
	}
	
	
	function chkData(){
		if (document.getElementById('id').value==""){
			alert("아이디는 필수사항입니다!")
		}
		else if(document.getElementById('pwd').value==''){
			alert("비밀번호는 필수사항입니다!")
		}
		else{
			fo.submit()
		}
		//그냥 아이디와 비밀번호를 입력하고 비밀번호확인을 다르게 입력해도 불일치라고만 뜨고 가입이 되는 형태.
		
	}
	
	
	


</script>


</head>
<body>
<h1>계정 등록 페이지입니다.</h1>
<form action='success.jsp' method='post' id="fo">  fo라는 이름은 name이여도 괜찮음. 
	<input type='text' placeholder='아이디' name='id' id='id'>(*필수항목)<br>
	<input type='text' placeholder='비밀번호' name='pwd' id='pwd'>(*필수항목)<br>
	<input type='text' placeholder='비밀번호 확인' id='pwd2' onchange='pwchk()'>
	<label id='label'></label><br>
	
	<input type='text' placeholder='이름' name='name'><br>
	<input type='button' value='등록' onclick='chkData()'>

</form>
버튼을 submit으로 하면 클릭시 메소드가 작동하기는 하는데 메소드 작동하고나서는 submit속성에 의해 action작동
즉 아이디나 비밀번호 미입력시 alert창 뜨고서는 페이지가 이동되어버림

필요에 따라서 스크립트문 사이사이에 return을 둠으로서 동작제어 가능

name값만 두고서는 getElementsByName()을 쓸 수도 있긴 함. 바깥으로 값을 보낼때도 name을 쓰고
id는 getElementsById()를 쓸 때 쓰는거고.. 바깥으로 값 못보내나..? request객체 메소드중에 id를 통해 값을 받는 것은 없나
request.getParameter("name이름")말고..
request.getParameterNames()말고.. id값을 위한 메소드..

</body>
</html>