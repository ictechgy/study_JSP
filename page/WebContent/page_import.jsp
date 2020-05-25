<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import='java.util.Scanner' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

페이지지시자
페이지의 전체적 속성설정.. 또는 특정기능을 위한 import -> 페이지 지시자쪽에서 쓴다. 인코딩지시자등도.
스크립틀릿에 골뱅이@와 단어가(page, include 등) 추가된 모양
등호(=)가 있으면 출력스크립틀릿
느낌표(!)가 있으면 static같은 선언문


<%
	Scanner input = new Scanner(System.in);
	System.out.print("2개의 정수 입력하세요 : ");
	int num1 = input.nextInt();
	int num2 = new Scanner(System.in).nextInt();
	out.print("두 정수의 합계 : ");
	out.print(num1+num2);
	input.close();    //안써줘도 되긴 함.. 역시나 자동으로 닫아주는 듯
%>
객체를 한두번만 쓰고 종료를 할 것이라면 위처럼 쓸 수 있다. new Scanner(System.in).nextInt();
굳이 Scanner객체를 계속 쓸 필요가 없다면 한줄로도 입력받을 수 있다. 

콘솔창을 통해 정수 두개를 입력해야 페이지가 구성완료되어 두 정수의 합계를 구한 페이지가 반환되어 브라우저를 통해 볼 수 있다..
일반적인 웹브라우저로 접속하려고만 하면 접속할 수 없겠지? 콘솔창을 통해 값을 먼저 입력해야하니까.. 
값을 일단 입력하면 페이지 구성은 끝날테고 그 때부터는 외부 브라우저로도 접속 될 거같은데..


페이지지시자쪽에서 import구문을 따로 만들어놨는데 위에 기본적으로 있는 페이지지시자쪽에 포함시켜도 된다.

다른 페이지 지시자도 다 한꺼번에 쓰는것도 되려나. 하나의 <%@ %> 안에다가? page와 include 속성들을 한꺼번에..



</body>
</html>