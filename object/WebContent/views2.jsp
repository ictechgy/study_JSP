<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import='java.util.Enumeration' %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Enumeration e = request.getParameterNames();        ->Enum도 제네릭 설정 가능

while(e.hasMoreElements()){
	String name=(String)e.nextElement();    //nextElement()는 Enum메소드이며 Object로 값을 돌려주는 이유는 기본적으로 Enum데이터 안에 어떠한 자료형이 올지를 모르니까 그런듯
	
	if (name.equals("season") && request.getParameter(name) != null){  //request.getParameterValues(name) != null 가능
		
		for(String a : request.getParameterValues(name)){
			out.print("season : "+ a+"<br>");
		}
		
	}
	else{
	out.print(request.getParameter(name)+"<br>");
	}
}

%>




<p>
선생님풀이 </p>

<% 

request.setCharacterEncoding("UTF-8");

Enumeration e = request.getParameterNames();
while(e.hasMoreElements()) {
	String n = (String)e.nextElement();
	
	if(n.equals("season")){
		String[] s = request.getParameterValues(n);
		for(String s1 : s){
			out.print(n+" : " + s1 + "<br>");
		}
	}
	else{
	out.print(n+" : ");
	out.print(request.getParameter(n)+"<br>");
	}
}


%>
Enumeration에도 제네릭을 부여할 수 있다. 콜렉션에서 Set과 List에 있어, 어떠한 자료형으로만 배열을 만들겠다 할 때 쓰던 <>







</body>
</html>