<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="getMethod.jsp">    <!-- 버튼을 누를 시 같은 폴더내에 있는 getMethod.jsp로 이동. 상대경로 작성해주었다. -->
<input type='text' name="id" value='test'>
<input type='hidden' name = 'aaa' value = '가나다라'>  <!-- 보이지는 않지만 기본값 value있는 상태이며 전송버튼 누를시 aaa라는 공간에 '가나다라'값이 담겨 던져짐 -->
<input type='submit' value='전송'>
히든타입은 사용자에게 페이지를 줄 때 변경할 수 없는 상태의 공간을 하나 넘겨주는 형식. 사용자가 전송을 누르면 아무것도 하지는 않았지만 해당 공간에 어떤 값이 담겨서 서버로는 던져지고, 서버에서는 그 값을 이용할 수 있다. 
그 값을 이용하여 사용자가 다음에 요청한 페이지에 섞어서 보낼수도 있고.. 

<p>
<h1>get방식 전송</h1>
<form action="getMethod.jsp" method='post'>   <!-- 메소드를 작성하지 않으면 기본 get방식 -->
<input type='text' name='id'><br>
<input type='password' name='pwd'><br>
<input type='submit' name='전송'><br>
</form>
<!--  한글을 입력한 경우 값 전송중에 문자가 깨질 수 있음 -->
<!--  post전송방식은 http 헤더와 섞여서 들어감. 용량이 크거나 중요한 데이터는 post방식으로 이용 -->
특수문자도 get방식으로 보낸뒤에 응답받은 페이지 URL보면 이상한 값으로 변환되어있던데..?
비밀번호에 특수기호 넣으라고 하는 이유는,,? 암호화와 https

겟방식을 통해 데이터를 던지면 이후에 request한 페이지를 response받을 때 응답받은 페이지의 url에 내가 보냈던 값들이 같이 붙어나옴..
이건 데이터를 보낼 때 URL을 통해 보낸다고 봐야하나.. 받는다고 봐야하나?

</form>

</body>
</html>

<!--
form태그에 대하여 더 알아보자.
이제 실제적으로 사용자의 값을 서버로 보내고 사용자가 원하는 것을 서버에서 불러오는 것을 배울 것이다.

form태그가 없으면 submit버튼을 눌러도 아무 일도 발생하지 않는다. form태그를 만들면 reset 버튼도 잘 작동하고 
submit버튼도 작동하기는 한다. 하지만 사용자의값이 사라지면서 어디론가는 날라가기는 하는데 어디로? 자기자신한테 보내진다. 즉 이 파일인 form.jsp로 보내짐
자기자신을 통해 보내진 값을 자기자신내부에서 출력시킬수도 있겠지. 처음에 페이지가 불러와질때는 아무 값도 없을테니 null값으로 출력될테고 사용자가 값을 같이 보내면서 또 form.jsp파일을 요구하는방식이 된다면
그 값을 form.jsp내부에출력시키도록 만들고서는 서버에서는 그 결과값을 클라이언트에 재전송해주는 방식으로..

그 위치를 변경하고자 하면 form태그의 action속성을 이용하도록 한다. 
www.naver.com으로 지정하면 버튼 눌렀을 시 해당 페이지로 이동했었음(그러면 입력한 값은 네이버로 전송됐던 것인가!!?)

submit을 이용하려면 form태그를 이용하고 action을 통해 경로가 변경된다. 
입력한 내용이 getMethod로 가진다. 

name을 지정해주면 사용자가 입력한 값이 해당이름으로 포장되어 넘어간다.(현재 id라는 이름으로 넘어간다.)
어디로? getMethod.jsp페이지를 요청하면서 그 값이 같이 넘어간다. 

getMethod에서는 입력받은 id값을 어디선가 꺼내와야 사용할 수 있다.

 -->