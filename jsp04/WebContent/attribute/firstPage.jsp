<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
request뿐만아닌 
범위 영역 이라고 하는 
page session application 클래스(객체)

(attribute - 속성, ~라고 간주하다)

page - 자기자신의 현재 페이지에서 특정값들을 저장하고 표현

request - 다른 페이지에서 넘어온 값들을 표현하는데에 사용(다음 페이지 전송 전에 그 값들을 활용하여 요구받은 페이지 구성 가능), 또는 다른 페이지로 값 넘길 수 있음

session - 브라우저가 살아있는동안 브라우저에서 사용할 수 있는 값. 다른페이지로 이동하더라도

application - 서버가 살아있는동안 계속 살아있는 값들
<p>

<%
//setAttribute메소드로 속성값 지정. 앞인자는 변수이름, 뒤에는 저장할 값
pageContext.setAttribute("name", "page man");  //속성을 지정하겠습니다. name으로 그 이름을 지정하고 page man이라고 그 값 지정
//변수라고 봐도 되고 Map이라고 봐도 된다.. 앞에는 변수명, 뒤는 값(또는 앞은 키, 뒤는 밸류)

//page는 현재페이지에서만 사용가능.. 다른페이지에서 name이라는 이름으로 값을 얻어오려고 해도 그 값은 존재하지 않음

request.setAttribute("name", "request man");

//request에서는 다른페이지로 그 값을 전달할 수 있음. 그럼 그 다른페이지에서 또 request로 그 값 사용 가능

session.setAttribute("name", "session man");
//브라우저가 끝나기 전까지 그 값은 계속 사용할 수 있다.
//HTTP 프로토콜이 비연결성.. 로그인시에 한번 로그인 성공하고 나중에 다시 페이지에 접속하면 기본적으로 로그인이 되어있어야하는데
//그런걸 유지시켜주기위하여 사용

//세션만료.. 은행프로그램등에서 몇분 지나면 로그아웃될 때

application.setAttribute("name", "application man");
//서버가 꺼지기 전까지는 계속 살아있는 속성
//조회수를 증가시킬 때.. 클라이언트가 어찌되든 서버가 켜져있다면 조회수는 지속누적되어야하므로..
out.print("first Page<br>");

out.print("하나의 페이지 속성 : " + pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성 : " + request.getAttribute("name")+"<br>");
out.print("하나의 세션 속성 : " + session.getAttribute("name")+"<br>");
out.print("하나의 앱 속성 : " + application.getAttribute("name")+"<br>");



//이제 다른 페이지로 넘어갔을 때 저 값들이 살아있는지 어쩐지 봐야한다.
//이 페이지를 먼저 실행시킨 후 다른 페이지를 실행시키느냐, 아니면 이 페이지를 실행시키지 않고 다른 페이지를 먼저 실행시키느냐에 따라 결과는 다르게 나온다. 

/*
pageContext 속성값은 다른페이지로 가면 그냥 소실된다. 이 페이지를 먼저 실행시켜서 setter를 가동시켜도 이 페이지 내에서만 존재한다. 따라서 자주 쓰이지는 않는다고 한다. 

request 속성값도 기본적으로는 이 페이지 내에서만 존재한다. 다만 다음 페이지로 가기전에 그 값을 던져놓으면 다음페이지에서도 값을 사용할 수 있다.
만약 setter가 있는 페이지를 실행시키지 않고 다른 페이지를 통해서 request.getAttribute를 하면 아무값도 뜨지 않을 것이다. setter를 실행시키는 페이지를 가동도 안했고.. 값을 던지지도 않았으니.

session은 브라우저가 켜져있다면 attribute값이 계속 존재한다. 일단 setter로 그 속성값을 지정만 해놓으면 어느페이지로 이동하든간에 그 속성값은 계속 살아있다.. 다만 브라우저를 끈 뒤에 
바로 getter만 있는 페이지를 접속한다면 null값이 뜰 것이다. 

application은 서버가 켜져있다면 브라우져가 켜져있든 꺼져있든 무조건 그 값은 서버가 꺼질때까지 살아있게 된다.. 단, 서버를 끈 뒤에 재구동시키고 getter만 있는 페이지를 구동시키면 당연히 null값이 나오겠지..
*/



//request의 attribute값을 어떻게 던져줍니까? 한다면..
		
//request.getRequestDispatcher("secondPage.jsp").forward(request,response);
//request속성값 전달해줄 수 있지만 이제 firstPage키면 바로 secondPage로 넘어감
//넘겨줄 페이지주소를 쓰고.. request값과 response값을 넘겨줌

%>

<a href='secondPage.jsp'>secondPage이동</a>

getter.. setter




문자열을 숫자로..
<%
	String str="1000";
	String result=null;
	int num=123;
	int sum=0;

	//sum=num+str;
	sum= num+ Integer.parseInt(str);  //int wrapper클래스 Integer의 static메소드이다. 인자로 들어온 값을 숫자로 바꿔줌
	//안바꿔주면 num이 문자형태가 됐겠지.. 그러면 sum은 우변의 값을 받아들일 수 없었을 것이다. 
	
	//다른 페이지로 값을 넘겨줄 때 보통 문자형태로 받아오기때문에.. 이러한 메소드가 있다고 선생님은 상기시켜주심
	out.print("sum : " + sum + "<br>");
	
	//문자와 숫자를 출력문에서 더하면 다 문자형태로 바뀐다.. 
	//따라서 필요한 경우 괄호를 적절히 사용하기
	
	
	result= str + num;
	result= str + Integer.toString(num);
	out.print("result : " + result + "<br>");

%>




속성(attribute)을 set해줄 때 각각의 속성변수명은 같지만 다 다른 객체속에 존재하므로 이름이 겹쳐도 상관이 없는 듯





</body>
</html>