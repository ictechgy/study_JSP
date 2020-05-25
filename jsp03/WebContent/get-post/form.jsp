<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="getMethod.jsp">    <!-- 같은 폴더내에 있는 getMethod.jsp로 이동. 상대경로 작성해주었다. -->
<input type='text' name="id" value='test'>
<input type='hidden' name = 'aaa' value = 'aaa'>  <!-- 보이지는 않지만 기본값 value있는 상태 -->
<input type='submit' value='전송'>
</form>

<p>
<h1>get방식 전송</h1>
<form action="getMethod.jsp" method='get'>   <!-- 메소드를 작성하지 않으면 기본 get방식 -->
<input type='text' name='id'><br>
<input type='password' name='pwd'><br>
<input type='submit' name='전송'><br>
</form>



get방식은 적은용량의 데이터, post는 큰 용량의 데이터를 전송하는데에 적합하다. 

<h1>post방식 전송</h1>
<form action="postMethod.jsp" method="post"> 
<input type='text' name='id'><br>
<input type='password' name='pwd'><br>
<input type='submit' value='전송'><br>    <!-- submit버튼에 고유한 name값이 필요할 때가 있나.. -->
</form>
<!--  한글을 입력한 경우 값 전송중에 문자가 깨질 수 있음 -->
<!--  http 프로토콜 헤더와 섞여서 들어감. 용량이 크거나 중요한 데이터는 post방식으로 이용 -->

get방식은 한글을 잘 처리한다. 위에 페이지지시자에 적은 인코딩방식 UTF-8을 잘 따름. post방식에서는 받는 페이지쪽에서 따로 한글을 처리해줘야함




<ul>
 
  <li>GET방식으로 값 전달하기</li>
  <li><form action="getMethod.jsp"><input type='text' name='space1'><input type='submit' value="전송"></form></li>
  <li>POST방식으로 값 전달하기</li>
  <li><form action="postMethod.jsp" method='post'><input type='text' name='space2'><input type='submit' value='전송'></form></li>

</ul>
form태그가 ul전체를 감싸면 전송방식은 하나밖에 설정불가능. 
그렇다고 li바깥쪽에서 감싸는방식으로 하려니까 적절하지 않은 위치?

form태그는 경로를 하나밖에 지정하지 못하므로 나중에 스크립트 사용(뭐 페이지 이동이긴 한데 버튼마다 다른 페이지로 이동하도록 설정할 수 있나봄?)








</body>
</html>

<!--
form태그에 대하여 더 알아보자.
이제 실제적으로 사용자의 값을 서버로 보내고 사용자가 원하는 것을 서버에서 불러오는 것을 배울 것이다.

form태그가 없으면 submit버튼을 눌러도 아무 일도 발생하지 않는다. form태그를 만들면 reset 버튼도 잘 작동하고 
submit버튼도 작동하기는 한다. 하지만 어디론가는 날라가기는 하는데 어디로? 자기자신한테 보내진다.

그 위치를 변경하고자 하면 action속성을 이용하도록 한다. 
www.naver.com으로 지정하면 버튼 눌렀을 시 해당 페이지로 이동했었음

submit을 이용하려면 form태그를 이용하고 action을 통해 경로가 변경된다. 
입력한 내용이 getMethod로 가진다. 

name을 지정해주면 사용자가 입력한 값이 해당이름으로 포장되어 넘어간다.(현재 id라는 이름으로 넘어간다.)
어디로? getMethod.jsp페이지로 그 값이 넘어간다. 

getMethod에서는 입력받은 id값을 꺼내와야 사용할 수 있다.

 -->