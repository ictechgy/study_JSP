<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!-- 

페이지지시자(맨 윗줄) < % @     % >      퍼센트 옆에 골뱅이나 등호 추가 기입 가능
html안에 자바코드를 넣어 사용할 수 있다면 JSP라고 함.

페이지설정을 구성함. 언어와 컨텐츠타입 및 언어형식과 인코딩. 문자타입을 어떤방식으로 인코딩(번역)할 것이냐
'떕' 이라는 문자를 쓰면 오류가 뜸. EUR-KR방식으로는 해당 문자를 표현할 수 없다. 따라서 UTF-8방식으로 해야함

2바이트값으로 처리하는 EUC-KR  -> 문자가 미리 조합되어있고 그 값을 그냥 불러다가 써서 표현
그래서 해당 부분에 존재하지 않는 문자형태라면 오류가 뜸

UTF-8은 3바이트로 처리한다. 모든 문자를 조합하여 연산해준다. 미리 저장되어있는게 아닌 각각의 세부요소를 그때그때 조합해서
출력할 수 있게 해준다. 

네이버의 소스를 가져와 메모장에 그대로 옮기고 html로 따로 저장을 ANSI방식으로 인코딩하여 저장해보자.
그리고 켜보면 문자가 다 깨져있다. 그러한 경우 UTF-8방식으로 인코딩하여 저장하면 정상적으로 출력된다.

meta - html파일에 대해 어떠한 방식의 정보를 가지고 있는지등을 알려주는 것. 
	   html파일자체가 책이라고 한다면 meta는 겉표지, 페이지목록 색인정도로 보면 된다. 


server.xml파일에서도 인코딩방식 작성
맨 밑에 Source부분 클릭하면 소스가 나옴. 
URIEncoding="UTF-8"  -> 63번째 줄에 추가(URL보다 큰의미. URI)
URI - 통합 자원 식별자(Uniform Resource Identifier)
인터넷에 있는 자원을 나타내는 유일한 주소이다. URI의 존재는 인터넷에서 요구되는 기본 조건으로서,
인터넷 프로토콜에 항상 붙어다닌다. 하위개념으로는 URL, URN이 있다. 
URL이 단순한 경로만을 나타낸다면 URI는 경로상의 어떤 작용등이 총 집합되어있는것이라고 보면 된다.

포트충돌발생시 해당 파일의 63번 줄에서 포트를 변경해주기
포트는 2바이트값을 가지고 있으며 이미 지정되어있는 포트를 제외한 아무것이나 사용하자.
(기본적 시스템 응용프로그램들이 이미 앞쪽포트를 점유하고 있는 듯)
 -->


<body>

<h1>jsp 시작입니다. </h1>

<%

	int num = 100;
	System.out.println(num);
	out.println(num);

%>
<h1>끝입니다.</h1>


연습중입니다.
	
	
<% 
	String name = "jsp"; 
	out.println(name+"시작<br>입니다");    //문법을 섞어서 쓸 수 있다. 즉 자바스크립틀릿 코드내에 HTML태그를 사용 가능
%>

jsp시작입니다.
jsp끝입니다.
위의 문장을 스크립틀릿을 사용하여 출력해보기<br>

<h1><%out.println(name); %> 시작입니다.</h1>   이렇게 출력되는 자바코드문에 html태그값을 적용시킬 수도 있다.
<h3><%out.println(name); %> 시작입니다.</h3>

<!-- html주석 -->
<%-- 
jsp 주석
//
/**/
자바의 주석문사용은 jsp코드집합(스크립틀릿)내에서만 사용가능하다.
즉 < % 요 사이에서만 자바의 주석기호 사용 가능 % >
 --%>

<%= name %>  변수 또는 연산내용을 입력, 단순하게 출력만하고자 할 때 사용한다. out.println();으로 자동감싸줌
<%= "표현식입니다." %>


10 + 20 = 30을 표현해보자
<%
int num1 = 10;
int num2 = 20;
%>

<%= num1+"+"+num2+"="+(num1+num2) %>
물론 단순스크립트문을 쓰고 out.println을 쓸 수도 있겠지만.. 
괄호로 감싸지 않으면 1020이라고 생성된다. 

<%=num1 %>+<%= num2 %>=<%=num1+num2 %>

계산식이 있다면 계산식의 결과를 출력하지만 계산에 앞서 문자값들이 출력되려한다면 거기에 붙어서 나열되는 식으로 출력됨
즉 <%num1+"+"+num2+"="+num1+num2 %> 이렇게 쓴다면
여기서 등호 다음에 +기호로 인해 num1값이 문자값으로 붙고 그 다음에 num2값이 +를 통해 문자값으로 붙는 형태


	
</body>
</html>

<!--  

이제 자바코드를 쓸 때에는 꺽쇠<>와 퍼센트%를 이용하여 쓴다. 스크립틀릿이라고 한다. 
System.out.println();  -> 콘솔창에 출력해달라는 메시지로 했으므로 웹페이지상에서는 출력되지 않는다. 
브라우저에 출력하고 싶다면 out.println을 쓰자.(JSP상에 미리 정의되어있는 클래스(객체)이다.)

이클립스가 아닌 브라우저를 통해 웹을 띄울수도 있다. Ctrl+F11을 통해 실행된 URL을 크롬창에 써보자
웹브라우저마다 뜨는 방식이 달라 내용이 조금씩 다르게 보일 수 있다.


JSP관련 강좌 - 네이버나 구글 검색
https://www.inflearn.com/course/%EC%8B%A4%EC%A0%84-jsp-%EA%B0%95%EC%A2%8C/
https://www.youtube.com/watch?v=wEIBDHfoMBg



-->