<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class=testBoard.TestDAO"/>
	<%
		String num = request.getParameter("num");   //request.getParameter()의 반환형은 String
		dao.count(num); 
		response.sendRedirect("list.jsp");
		
		
	%>

	데이터베이스에서도 num을 number형태로 만들었고.. getNum()을 하면 숫자를 int로 반환한다.
	출력스크립틀릿에 쓰면 out.print()를 통해 숫자값을 출력한것과 동일하게 된다.
	근데 링크 뒤에서 ?로 값을 변수를 통해 보내줄 때에는 String으로 변환이 되는걸까?
	아니면 request.getParameter()에서 String으로 변환시키는걸까
	
	아무튼.. int값이었는데 어느샌가 DAO 메소드에서 Integer.parseInt하길래..
	
	그러면 회원가입등에 있어서도 input을 통해 값이 던져졌을 때 request.getParameter()로는 String만 나올 듯. 그게 어디서 String이 되는지는..
	input자체가 다 String으로 받아들이는 것일수도 있고..
	
	
</body>
</html>