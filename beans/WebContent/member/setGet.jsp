<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
useBean태그를 이용하여 객체를 만든 뒤에 내부 멤버변수값을 이용 할 때 스크립틀릿을 통해 getter setter메소드를 썼는데 그게 아닌 태그를 이용해보자

<jsp:useBean id="mb" class="members.MemberDTO"/>

이름 : <jsp:getProperty property="id" name="mb"/><br>
비밀번호 : <jsp:getProperty property="pwd" name="mb"/><br>

정보 변경한 후 변경된 정보 출력하기<p>
<jsp:setProperty name="mb" property="id" value="홍길동"/>
<jsp:setProperty name="mb" property="pwd" value="1234"/>

이름 : <jsp:getProperty property="id" name="mb"/><br>
비밀번호 : <jsp:getProperty property="pwd" name="mb"/><br>



Beans를 쓰면 getProperty사용 가능. getter와 비슷.
useBean으로 객체생성시에만 사용 가능.(스크립틀릿으로 객체만들면 getProperty나 setPropery태그 못쓰나?) property에는 멤버변수명을 쓰고 name에는 객체명을 작성하면 된다.
특정값을 가져올 때 사용한다.

setProperty는 setter와 비슷하다.

근데 스크립틀릿으로 객체 만드는 것과 이렇게 useBean태그를 쓰는 것에 있어서 객체생성시점이 다를려나?
useBean쓴건 어디에서 처리가 되는걸까? 서버? 클라이언트?


</body>
</html>