<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String s = request.getParameter("id");
%>
입력 값 : <%= s %>

만약 보내는 쪽에서 id라는 name을 가진 입력칸이 두개 있고 두 칸이 각각 따로 form에 둘러싸여있다면.. 
위쪽 form 내부의 text칸에 값을 입력하고 아래 다른 form안의 submit버튼을 누른다면.. 그 값이 전송 될까?


id : <%= request.getParameter("id") %><br>
pwd : <%= request.getParameter("pwd") %><br>


request를 통해 사용자가 입력한 값이나 선택값을 가져올 수 있다. 이 때 사용자가 넘겨준 값은 name이 있어야 함..






이전 페이지에서 보낸 값 : <%= request.getParameter("space1") %>     -> 한번 출력만 한다면 이렇게 쓰면 되고, 여러번 쓴다면 변수에저장시키면 됨.. 이렇게 get으로 뽑아쓴다고 하더라도 계속 뽑아 쓸 수는 있을 듯

<a href="../webContent.jsp">webContent이동</a><br>
<a href="../test1/test01.jsp">test1이동</a><br>
<a href="../test1/test2/test02.jsp">test2이동</a><br>





<% String s = request.getParameter(); %>
선생님풀이
입력값 : <%= s %>
<a href="../webContent.jsp">webContent 이동</a><br>
<a href="../test1/test01.jsp">test1 이동</a><br>
<a href="../test1/test2/test02.jsp">test2이동</a>
또는 절대경로를 작성하여 줘도 된다. 






</body>
</html>

<!-- 
사용자가 서버에 요청(request)를 하면 서버는 응답(response)를 한다.
우리가 네이버에 접근을 하려고 하면 일단 우리 클라이언트 컴퓨터가 네이버라는 서버에
"네이버라는 html파일(jsp)을 줘!" 라고 요청(request)하는 것이고 네이버 서버는 해당 파일을 응답(response)해준다.
"아 ~~에 있는 ~파일을 요청하는구나!" 하고 파일을 던져줌

파일을 받아서 웹브라우저는 해당 파일을 번역하여 화면에 보여준다. 


submit이라는 버튼이 form이라는 태그를 통해 작동하게 되는데, action을 통해 어디로 이동하면서 값을 같이 넘겨줄지 결정됨
지정하지 않으면 자기자신에게 던져줌

보내줄 때 text공간의 이름이 있어야 이름을 붙여서 같이 넘겨줄 수 있으므로 name속성을 이용해 이름을 지어주어 값 던지기
이름이 없다면 받는 쪽에서 못받음(마치 택배를 발송했는데 겉에 아무것도 없어서 택배트럭에서 뭘 수령해가야하는지 모르는 상태)


URL을 보면 id에 어떤 값이 전송되는지 보임
즉 URL에 정보가 붙어서 넘어간다. -> get방식
많은 데이터를 보낼 수 없다. URL도 길이제한이 있으므로..
(보안에 취약 - 나중에 툴을 이용하여 보정가능. 그래서 노출이 되어도 상관없는 것은 get으로 이용)
보안이 필요한 것은 post방식을 사용한다. 
네이버에서 검색 하면 get방식으로 날라감. URL보면 내가 입력한 것이 그대로 있음.
페이지 이동이나 단순 정보의 교환에 있어서는 get방식 이용
검색창에 값을 입력 안하고 URL에 값 입력하면 검색효과가 나기도 함


웹브라우저를 통해 form.jsp를 요청하면 서버에서는 해당 파일에 대해 응답해준다. 그러면 값을 입력하는 칸과 전송버튼이 있는 파일을
받은 상태.
이 상황에서 값을 입력하고 전송을 누르면 action속성을 통해 해당 파일(getMethod.jsp)을 우리가 요청하게 되고 동시에 우리가 입력한
값을 같이 투척한다. getMethod.jsp파일을 요청했으니 해당 파일이 띄워지는 것은 당연.
다만 getMethod.jsp파일에서 사용자로부터 받은 값을 출력하고자 위와 같이 작성. 

form.jsp를 통해 값을 입력받고 전송버튼을 통해 getMethod.jsp파일이 요청된 경우 id라는 공간에 사용자의 값이 존재한 상태로 받아진 상황. 
request클래스에 있는 static getter메소드를 통해 id 공간의 값을 불러와서 s라는 변수에 저장 후 출력하도록 설정.
이후에 getMethod.jsp파일의 구성이 다 완료되면 그 결과값을 클라이언트에 투척

 -->