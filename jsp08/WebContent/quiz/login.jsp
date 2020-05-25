<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function chk(){  //매개변수로 뭔가 값이 들어오도록 할 수도 있을까..
		
		if (document.getElementById('id').value == ''){
			alert("아이디는 필수 입력 사항입니다")
		}
		else if (document.getElementById('pwd').value == ''){
			alert("비밀번호는 필수 입력 사항입니다")
		}
		else{
			go.submit()
		}
		
	}

</script>

</head>
<body>

<form id=go action=check.jsp method='post'>

<input type='text' placeholder="아이디" id='id' name='id'><br>
<input type='password' placeholder='비밀번호' id=pwd name=pwd><br>
<input type='button' value="로그인" onclick='chk()'>
<a href='register.jsp'>회원가입</a>

</form>

</body>
</html>

<!--  포트오류 뜸.. server.xml인가 web.xml인가 왜 왼쪽에 안뜨지. 그래서 직접 파일찾아가서 바꿨는데도 안고쳐짐. 포트는 다른말로 PID라고도 하는 듯 하고 작업관리자 중 서비스탭에서 확인가능한 것 같다. 또는 cmd에서 netstat같은걸로 확인 가능하다는데
문제는 해당 포트를 쓰는 프로그램이 안뜨는데...
해결방법 : 콘솔창쪽에서 서버탭 클릭 후 톰캣서버를 더블클릭하면 속성창이 뜨는데 속성창에서 포트번호가 있는 곳을 찾아서 변경해주면 됨
-->