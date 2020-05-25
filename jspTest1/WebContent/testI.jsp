<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("su"));
	int sum = sum(num);
	
	out.println("1~"+num+"까지의 합 : " + sum);
%>
<%!  //선언문(선언 스크립틀릿) - 일반스크립틀릿으로는 메소드 생성 불가능. 선언문은 가장먼저 실행되지 않나?
	public int sum(int num){
		int sum=0;
		for(int i=1; i<=num; i++){
			sum +=i;
		}
		return sum;
	}
%>

선언문을 통해 만든 메소드는 메소드 그 자체로서 만들어지고, 일반 스크립틀릿에 들어간 내용들은 _jspService라는 메소드안에 들어가게 된다.
메소드 안에 메소드를 정의할 수는 없으므로 일반스크립틀릿안에 메소드를 만들 수 없다.

선언문 안에는 멤버필드(변수)값 선언이 가능하며 어떤 메소드에서든지 가져다가 쓸 수 있다.
</body>
</html>