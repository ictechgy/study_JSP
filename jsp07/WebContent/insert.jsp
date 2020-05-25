<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
executeQuery()를 이용해 select 쿼리문을 전송하고 그 결과값을 받아서 출력하는 법을 배웠다.
이번에는 데이터베이스에 데이터를 입력하고, 수정하며 삭제하는 법을 배우자.

<%
	Connection conn=null;
	Statement stmt = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp001";
		String pwd = "1234";
		conn = DriverManager.getConnection(url, id, pwd);
		stmt = conn.createStatement();
		
		//일단 임의의 값을 넣도록 해보자
		int num = 10;
		String name="기대해", kor = "10", eng="50", math="100";
		String sql = "insert into student values('"+num+"', '"+name+"', '"+kor+"', '"+eng+"', '"+math+"')";  //굉장히 복잡.. String.format을 쓰든지..
		int cnt = stmt.executeUpdate(sql);  //성공하면 성공한 행 갯수가 int형태로 return됨. 현재는 하나의 쿼리문을 쓴거니 성공하면 1리턴, 실패시 0 리턴 
		if(cnt != 0){
			out.print("<h3>저장 완료 : "+cnt+"</h3>");
		}
	}catch(Exception e){  //발생할 수 있는 Exception에는 ClassNotFoundException 그리고 SqlException이 있다. 예외에 대해 Exception하나로 처리하니 따로 예외에 대해 import할 건 없나보네
		out.print("<h3 style='color:red'>저장실패</h3>");
	}finally{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
		
	out.print("<a href='jdbc.jsp'> 목록이동</a>"); //목록으로 이동해보면 기존에 있던거에 위에서 내가 임의로 추가한 목록값이 잘 추가되서 뜸
	//당연히 해당 이름을 클릭하면 상세정보도 잘 뜨고..
%>

run sql command line을 실행시키고 conn jsp001/1234
select * from tab; 로 테이블목록 출력
select * from student;로 보면 내가 입력시킨 값이 잘 나온다.

다만 내가 지정해놓은 kor eng math는 number형태인데 getString형태로 잘 가져왔던 것처럼
값을 넣을 때에도 세 과목의 값은 number형태가 들어가도록 되어있지만 위에서 String형태로서 만들어 값을 넣는게 잘 된다. 상호 자동 변환


일단 이런식으로 한 것은 저장은 한번만 가능. num값이 고정되어있고 데이터베이스에서 num은 primary key로 하나의 값만 들어갈 수 있으므로.
만약 사용자에게서 어떤 제품등록을 할 때 코드가 이미 등록되어있다면? 이미 등록되어있다는 경고메시지 팝업을 띄우도록 만들거나 아니면
이미 등록되어있다는 페이지로 넘기도록 하는 등을 할 수 있는데, 에러코드가 발생하는 경우 errorPage로 넘기는 것은 쉽다.
다만 자바스크립트로 이미 등록되어있다는 alert를 띄우는 경우 데이터베이스에서 primary key 중복값이 있는지를 검색하는 메소드 등을 구현하든지
해야할듯

지금은 html에 java문법을 넣은 JSP. 따라서 이상한부분에 대해서 경고문들도 뜨지가 않음. try catch 묶기
반대로 자바문법에 html표현할수도 있는데 그건 서블릿이라고 한다. 그때 가면 경고문들 뜸. 꼭 try catch로 묶으라고 뜬다는데?


이제 데이터베이스를 다 썼으면 데이터베이스와 계속 연결할 필요 없음. -> 자동으로 안닫아주나?
오류발생과는 상관없이 닫아야하므로 finally에서 닫아줘야함.
그리고 오류가 발생해서 제대로 객체가 안만들어진경우 닫을 필요는 없으니 if문을 통해 null이 아닌 경우에만 닫도록 만듬

또! 그냥 쓰면 stmt와 conn 객체가 try의 지역변수가 되어있으니 finally에서 인식 못해 제대로 작동 안함.(빨간줄그어짐) 밖으로 뽑아서 전역으로 만들어줌

</body>
</html>