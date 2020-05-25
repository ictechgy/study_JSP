<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 일전에 지시자쪽을 배울 때 page지시자와 include지시자 그리고 taglib 지시자가 있다고 배웠었다. -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- 코어내부 태그를 주로 사용.(코드작성의 기본적태그들이 들어있음) 코어태그를 c라는 이름으로 사용하겠다. -->
    <!-- 근데 태그를 이렇게 uri로 쓸거면 web-inf에 왜 jar파일 넣어둔거지? 그래야 쓸 수 있는건가? 뭐지?uri를 통해 뭐 정의같은걸 가져오고 jar파일은 실질적 내용이나 작동방식이 들어있는건가.. 흠 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:out value="hello world"/><br>  밸류값 출력하겠다. out 출력하겠다. 무슨값을? value값을
<c:set var="num" value="hello world2"/> var는 변수명지정. value는 값 지정. 즉 num이라는 변수에 hello world2 문자열 들어감
<c:out value="${ num }"/> num변수(객체)를 먼저 EL을 통해 값을 불러오고 그걸 jstl로 출력. -> <c:out value="<%= num %>"/> 이라고도 쓸 수 있는 것 아닌가? 흠..
jstl은 el과 같이 사용한다. -> 내부에는 EL만 들어갈 수 있는건가..

jstl -> 사용하기는 편하다. 2000년대 초반에 만들어져서 더이상 업데이트는 없고.. 특정사람들이 쓰기는 함.

<c:set var="num1">
안녕하세요 만나서 반갑습니다.
</c:set>
<c:out value="${ num1 }"/>

위와같이 작성할 수도 있다.


<%
	String s="jstl 연습중";
%>
<c:set var="num2" value="<%= s %>"/>     <c:set var="s" value="<%= s %>"/>  var의 s와 자바의 s는 다른것으로 인식되는 것인가.. 그렇다면 var는 정확히 뭘로 인식되는걸까..
<br>
${num2 }
<br>
<c:if test='${ num2 == "jstl 연습중" }'>   -> test가 의미하는 것은??
	<button>참입니다</button>
</c:if>
어디에는 스크립틀릿이 들어갈 수 있고 어디에는 안되고.. 흠



<%
	String[] name= {"고길동", "고구마", "고스톱", "고도리"};
%>
<c:set var="values" value="<%= name %>"/>  -> 굳이 이렇게 출력스크립틀릿을 이용해서 value값을 주는 이유는 뭐지. 안에 직접 중괄호 넣고 하면 그냥 문자그대로 전부 하나로 인식해서인가. 이렇게 쓰면 어떤 방식으로 들어가는 것이길래?
<c:forEach var="st" items="${ values }">
	${ st }<br>
</c:forEach>
	

개발자가 자신이 자주 쓰는 기능을 한번만 구현하고 재사용하기위해 커스텀태그를 만드는데.. 시간이 오래걸린다. 직접만들기에는
jstl은 여러 자주 사용하는 태그들을 미리 정의해둬서 손쉽게 쓸 수 있도록 해놓은 라이브러리(부트스트랩이나 사용자정의 클래스들처럼..)
개발자는 그냥 가져와서 사용만 하면 됨..





서블릿 - 자바파일

값이 get으로 넘어오느냐 post로 넘어오느냐에 따라 다르게 작동 가능


기존에는 jsp파일로 모든 것을 다 처리를 했다. 이런 방식은 소규모프로젝트방식
나중에 규모가 커지면 앰부시패턴을 사용한다. Spring..
M V C

Control 사용자에게 일단 지휘권주고

View 사용자가 페이지를 원하면 작동(보여주기)

Model 데이터베이스쪽이 필요한 경우 사용



</body>
</html>