<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
	function chk(){
		id = document.getElementById('id').value   //name값만을 이용하려고 getElementsByNames썼는데 작동 안하네
		pw = document.getElementById('pwd').value  //해당 공간을 가리키는 것일뿐이므로 .value코드 추가 필요
													//아니면 그냥 name이나 id이름가지고 ~~.value라고 쓸 수 있지 않던가?..
		if (id==''){
			alert("아이디를 입력하십시오")
		}
		else if (pw ==''){
			alert("비밀번호를 입력하십시오")
		}
		else{
			log.submit()
		}
	}
</script>


</head>
<body>

<h1 style="color:skyblue;">CARE LAB</h1>
<h2>저희 사이트에 방문해주셔서 감사합니다.</h2>

<form action='chkLogin.jsp' method='post' id='log'>
	<input type='text' placeholder='아이디' name='id' id='id'><br>
	<input type='password' placeholder='비밀번호' name='pwd' id='pwd'><br>
	<input type='button' value='로그인' onclick='chk()'>
</form>


<%
	boolean bool = false;
	Cookie[] cookieArr = request.getCookies();
	
	if(cookieArr != null){
		for(Cookie c : cookieArr ){
			if(c.getName().equals("kies")){
				bool=true;
			}
		}
	}
	
	if(bool == false){
%>
<script>
	window.open("popup.jsp", "new", "width=500 height=500 left=200 top=200")
</script>
<%} %>



파일 일일히 안만들고 include 지시자 사용 가능(다만 그런경우 경로 주의)

<%
	if (session.getAttribute("logeduser")!=null){
		response.sendRedirect("interval.jsp");
	}
%>
만약 이미 로그인한 유저가 이 로그인페이지를 요청하면 다른 페이지로 가도록 만듬




</body>
</html>