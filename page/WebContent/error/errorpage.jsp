<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page  errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Exception과 error
문제발생시 error페이지로 넘기기 <p>

위에 페이지 지시자와 page키워드 및 errorPage속성값을 만들어주었다. 
이제 여기서 예상치못한 오류가 발생하면 에러페이지가 띄워진다.

<%= 10/0 %>



HTTP Status 500 -  코드상의 문제 발생. 오류발생의 line도 알려줌
HTTP Status 404 -  페이지가 없을 때 발생(이상한 이름의 jsp파일을 주소창에 입력해서 서버에 요구한다던가.. 등)

근데 저 숫자가 의미하는 것은 무엇일까? 몇백가지의 문제가 있을 수 있다는걸까?

만약 어떤 에러에 대하여 특정페이지로 가도록 전체적 설정을 하고 싶다면.. web.xml 들어가서 코드쪽에
	<error-page>
		<error-code>404</error-code>   -> 에러 코드를 쓰기(해당 에러가 발생하면~)
		<location>/error/error.jsp</location>  -> 이동시킬 페이지 경로 적기(근데 프로젝트명은 안쓰네)
	</error-page> 
	를 작성하면.. 해당 에러가 발생하면 ~페이지로 이동시킬겁니다 하고 적은 것.

xml - html에 대한 확장언어.


   <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
기본경로. ip로 접속했을 때 기본적으로 뜰 페이지를 조정시킬 수 있다. 기본적 IP값으로 접속했을 때 띄워줄 화면은 index파일로 하겠다는 것
접속페이지를 index파일로 만들어도 되고 저 위에 글자 이름을 바꿔도 됨

</body>
</html>