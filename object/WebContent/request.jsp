<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

내장객체. JSP에서 기본적으로 내장되어있는 클래스 및 객체들.. request에 대해 더 알아보자(response객체도 존재)

<%
	out.print("내장객체 입니다.");  //웹페이지에 출력하는 내장객체
%>
<p>
컨텍스트 패스 : <%= request.getContextPath() %><br>    -> /object 라고 나옴.. 이 파일(코드가 쓰인 파일)의 경로를 보는건지, 아니면 사용자가 보고있던 파일의 경로를 보는건지..사용자가 요청한 파일의 경로?흠.. 파일이 다른 폴더내에 있었다면?
Context : 맥락, 상황정보
Path : 경로
경로를 지정할 때 프로젝트명을 직접 쓰는 대신 쓰는 메소드.

요청방식 : <%= request.getMethod() %><br>  -> get방식으로 값을 보냈는지 post방식으로 값을 보냈는지..? 정확히 말하자면 어떤 방식으로 다음 페이지를요청했는지? 기본적으로는 get
요청한 URL : <%= request.getRequestURL() %><br>
요청한 URI : <%= request.getRequestURI() %><br>
URI - URL의 큰 개념. 

서버의 이름 : <%= request.getServerName() %><br>
자신PC에서 접속했으므로 localhost뜸. 다른 사람 PC접속하면 다르게 뜸

프로토콜 : <%= request.getProtocol() %><br>


<fieldset>
	<legend>취미조사</legend>
	어떤거 어떤거
</fieldset>

</body>
</html>