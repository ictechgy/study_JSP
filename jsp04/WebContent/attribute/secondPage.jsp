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
out.print("second Page<br>");

out.print("하나의 페이지 속성 : " + pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성 : " + request.getAttribute("name")+"<br>");  //값을 넘겨줬다면 출력되지만 그렇지 않은경우 null
out.print("하나의 세션 속성 : " + session.getAttribute("name")+"<br>");
out.print("하나의 앱 속성 : " + application.getAttribute("name")+"<br>");

%>

<a href='thirdPage.jsp'>thirdPage이동</a>

<p>
페이지속성과 리퀘스트속성은 null로 뜸

request는 다만 다른 페이지로 값을 전달할 수 있음(전달하지 않으면 null)
페이지로 값을 넘길때에는 전용 메소드 사용
request.getRequestDispatcher("URL또는 파일명").forward(request, response)

세션은... 브라우저가 살아있으면 어디로 이동하든 유지





</body>
</html>