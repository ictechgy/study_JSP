<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : <%= request.getParameter("id") %>
비밀번호 : <%= request.getParameter("pwd") %>

EL의 문법을 이용하여 값을 가져올 수 있다. 

아이디 : ${ param.id }<br>
비밀번호 : ${ param.pwd }<br>
비밀번호 : ${ param["pwd"] }<br>  - pwd라는 이름은 쌍따옴표로 감싸줘야 함(작은따옴표도 가능하다고 함)
위와같이 출력을 손쉽게 할 수 있다.

같은 name값으로 여러개의 값들이 넘어올 때.. ex)checkbox 등
${ paramValues.animal[0] } 또는 ${ paramValues["animal"][0] } -> param.animal[0]이나 param["animal"][0] 이렇게는 못쓰나

아무튼간 넘어오는것들은 EL에 있어서 param이라는 내부객체의 멤버변수로서 존재하게 되는 것 같다. 넘어오는 값이 여러개라면 paramValues라는 내부객체의 멤버변수로 가게 되는 것인 것 같고..

<%=cnt + 1 %>
${cnt + 1 }

두 cnt의 의미는 다르다.
기존에 썼던 스크립틀릿 출력문의 cnt는 자바언어의 변수명이며 EL식에서 사용된 cnt는 attribute이름으로 해석해야한다.
EL로 데이터 하나만 출력하고자 할 수도 있으며 연산자를 넣을수도 있고 자바의 정적메소드를 호출할 수도 있다.(물론 어떤 반환값이 있어야 결과값을 볼 수 있겠지... 동적메소드는? 객체생성되어있다면?)

어트리뷰트값을 출력하려고 할때 기본적으로 page - request - session - application순서로 찾아가지만 그걸 바로 하고싶으면 pageScope.어트리뷰트명  <-과 같이 Scope사용. 특정 부분을 쳐다봐라! Scope!

연산식에 문자열형태의 숫자(숫자로 변환가능)이 포함될 경우 숫자로 자동 변환해준다고 하는데.. 예를들어 10 + "10"은 기존에 "1010"이라고 나오는데 EL에서는 20이 나온다는건가 

${ name.value } - 특정객체의 property접근가능(Map의 경우 맵객체명.key값 -> 해당 키값에 맞는 value값 출력되겠지)
${ name[value] } - 콜렉션(리스트계열)의 값을 출력시 사용(Map의 경우 맵객체["key값"])  -> 그냥도 쓸 수 있긴 한데..굳이 콜렉션 아니여도?
앞의 name에 해당하는 객체는 반드시 EL의 내장객체여야 하거나 Attribute명이 들어와야 함

JSP의 스크립틀릿문에는 사용할 수 없고 액션태그쪽에서는 사용이 가능하다고 한다. -> 마치 스크립틀릿 출력문같네.. 스크립틀릿 내에서는 출력스크립틀릿을 따로 또 둘 수 없듯이..태그 내에서는 쓸 수 있지만.
EL안에서 또 EL을 쓰는 것은 안되겠지


EL에서는 객체의 멤버변수에 접근 할 때 그냥 점으로 써도 자동으로 get()메소드를 호출해서 접근함.
스크립틀릿출력문에서는 get메소드를 일일히 불러줘야했는데..

</body>
</html>