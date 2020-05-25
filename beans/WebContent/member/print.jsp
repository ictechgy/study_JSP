<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
setProperty가 주로 사용되는데 어떻게 주로 사용되는지 한번 살펴보자

<jsp:useBean id="mb" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="mb"/>
id : <jsp:getProperty property="id" name="mb"/><br>
pwd : <jsp:getProperty property="pwd" name="mb"/><br>

id : <%= mb.getId() %><br>
pwd : <%= mb.getPwd() %><br>
name : <%= mb.getName() %><br>
addr : <%= mb.getAddr() %><br>
tel : <%= mb.getTel() %><br>

로그인페이지의 form action을 이 페이지로 연결시켜보자. 그 뒤에 로그인을 진행해보자

만약에 로그인페이지가 아닌 회원가입페이지형식이라고 생각해보자. 
사용자가 값을 입력하는 공간은 많아진다. 
<input type='text' name='name' placeholder="이름">
<input type='text' name='addr' placeholder="주소">
<input type='text' name='tel' placeholder="전화번호">
의 항목이 추가된다. 


이때 해당 값들을 받아주는 쪽 페이지에서 그 값을 쓰려면 각각의 항목에 대해서 개별적으로 request.getParameter를 많이 써줬어야 한다.
게다가 MemberDTO m = nem MemberDTO(); 라고 m객체를 만들어서
m.setId(id); 등 일일히 객체에 setter를 써서 값을 저장해줘야했다. 

사용자가 던져준 값을 request로 받고, 객체나 변수 생성한 뒤에 그 받았던 값을 집어넣고(직접 집어넣든 setter를 쓰든)
이렇게 번거롭게 해줘야 헀다.

각각의 항목에 대해서 다 request.getParameter()를 쓰고, 객체에 저장하기 위해 setter를 다 써야하는 것이 불편

getProperty는 각 멤버변수 하나씩만을 가져올 수 있다.
그런데 setProperty를 쓰면 알아서 모든 공간에 사용자의 값을 저장시켜준다.

<jsp:setProperty name="mb" property="id" value= <% request.getParameter("id"); %>/> 처럼 일일히 써도 되긴 함

<jsp:setProperty name="mb" property="*"/>
모든 공간에 대해서 셋팅해주겠다
다만 여기서 input태그의 name속성에 해당하는 것과 클래스의 멤버변수명이 같아야 값이 잘 들어간다. 클래스 내에서의 멤버변수 작성순서나 input태그 작성순서는 상관없을듯

근데 useBean으로 객체만들때 이름은 id attribute로 만드는데 getset Property에서는 목적지 객체명을 지정할 때 name attribute를 쓰네
</body>
</html>