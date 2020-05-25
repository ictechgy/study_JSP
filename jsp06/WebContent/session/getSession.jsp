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
	String id = (String)session.getAttribute("id");
	String age = (String)session.getAttribute("age");
	String key = (String)session.getAttribute("key");
//속성값을 이름을 통해 get했을 때 어떤 value를 가지고있을지 모르니 Object형으로 돌려주도록 만들어진 듯 하다.
//Object형 참조형변수가 값을 가리키고 있도록 만든건가. 그리고 그걸 형변환하면 참조형변수가 형변환되는건가?
//맞지 않는 형변환을 실시하면 어떻게 되는가?

%>
id : <%= id %><br>age : <%= age %><br>key : <%=key %><br>

<a href="setSession.jsp">getSession(세션 생성) 이동</a><br>
<a href="delSession.jsp">delSession(세션 삭제) 이동</a><br>

</body>
</html>