<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str="1000";
	String result=null;
	int num = 123;
	int sum = 0;
	
	sum = num + Integer.parseInt(str);
	out.print("sum : "+sum+"<br>");
	result = str + Integer.toString(num);
	out.print("result : " + result + "<br>");

	이렇게 문자열과 숫자 상호변환이 가능하다보니 서로 연관되어있는 메소드들이 좀 있는 듯... API를 봐야하겠지만..
	Integer wrapper class에서 문자열을 정수로 바꾸거나 정수를 문자열로 바꾸는 것 말고 String쪽 메소드에도 그런게 있을라나..
	String이 사실 char형 데이터를 배열로 만들고 쉽게 쓰도록 만든거라고 보면 되는데..


pageContext.setAttribute("name", "page man");
request.setAttribute("name", "request man");
session.setAttribute("name", "session man");
application.setAttribute("name", "application man");

out.print("first Page<br>");

out.print("하나의 페이지 속성 : "+pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성 : "+request.getAttribute("name")+"<br>");
out.print("하나의 세션 속성 : "+session.getAttribute("name")+"<br>");
out.print("하나의 앱 속성 : "+application.getAttribute("name")+"<br>");
//request.getRequestDispatcher("secondPage.jsp").forward(request,response);  request객체를 전부 보내면서 Attribute값도 보낼수 있기는 한데.. 아예 이제 이 firstPage.jsp를 실행하면 바로 넘어감..
%>
<a href="secondPage.jsp">secondPage 이동</a>
</body>
</html>











