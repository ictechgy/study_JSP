<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	if (application.getAttribute("hits") == null){
		application.setAttribute("hits", 1);
	}
	else{
		int num = (int)application.getAttribute("hits");
		num++;
		application.setAttribute("hits", num);
	}
	//속성값에 대해서 set get만 있을까? replace같은거 없나? 물론 set으로 그 기능을 다 하기는 하지만

	//만약에 어떤 사람이 이 페이지 URL을 통해 이 글에 처음으로 바로 접근했을 시 조회수를 1로 만들어주기 위한 if문.
	//만약 if문을 안두고 else문만을 만들어뒀다면.. 뭐 board.jsp를 통해 이 페이지에 접근했을때에는 문제는 없겠지만 바로 이 페이지로 접근한 경우 코드상의 오류가 발생하지 않았을까 한다.. null값을 int형변환이 되나?
	//게다가 null++하는 형태가 되어버리니.. 흠..null을 자동으로 0으로 만들어주려나 형변환하면? 만약 그렇다면 위의 if문은 필요없을지도.
	
	//else를 안쓰고 그냥 위 if문의 종속문장에서 초기값을 0으로 만들면 else로 아래 종속문장을 구분지을 필요는 없을 듯
	
	//선생님은 조회수에 있어서 두번째 인자를 문자값으로 만드시고 Integer.parseInt나 Integer.toString메소드 등을 쓰셨지만 나는 단순하게 이렇게만 씀.
	
	//위와같은 코드도 역시나 새로고침시에 조회수가 늘어나도록 되어있음. 단순매크로같은 걸로 조회수를 늘리려한다면 어떻게 막아야하는걸까.. 시간에 관련된 메소드 CurrentTimeMills같은거 돌려서 
	//어느정도 시간값이 달라진 경우에만 조회수가 늘어나도록 설계? ..  그리고 조회수순서로 정렬같은건..? 조회수를 배열로 만들고 (선택또는 자동)정렬알고리즘 돌리는건가
	//또 트래픽과부하공격같은건 어떤방식으로 막는것인가..DDOS
%>


<h1 align='center'>띠보소!</h1>

<a href='board.jsp' style="color:red;">돌아가기</a>  

<p>
a(앙코르) 태그에서는 align속성이 적용이 안되네.. div써야하나

404에러 - 페이지 못찾음
그냥 URL에 http://localhost:8080/ 검색하면 내가 지금 index파일을 만들지 않았기때문에 페이지 발견 못함. 시작페이지를 저 이름(index)으로 짓거나 서버설정에서 변경(server.xml - web.xml)

500에러 - 코드상의 에러
</body>
</html>