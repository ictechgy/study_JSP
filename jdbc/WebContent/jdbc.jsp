<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 	<%@ page import='java.sql.DriverManager'
 			 import='java.sql.Connection' 
 			 import='java.sql.Statement' 
 			 import='java.sql.ResultSet'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//jar파일을 우리가 쓰는 서버인 아파치톰캣안의 lib위치로 옮겨두었다. 이제 import해야하나. 클래스파일이 들어있는 건가?
	//그냥 OracleXE설치되어있는곳의 jar파일을 import할 수는 없는걸까. import 가능범위는 어디까지? 라이브러리에 있어야? 아예 바깥경로나 URL경로는?
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//드라이버를 로드하는 작업.
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; //오라클정보 및 경로와 ip, 포트, 버전정보 이제 곧 이걸 넘기고 연결을 함.
	String id = "jsp001";
	String pwd = "1234";
	
	
	
	Connection conn = DriverManager.getConnection(url, id, pwd);  //DriverManager클래스 객체의 메소드를 통해 연결된 객체를 하나 만들어 가지고 오겠다!
	//리턴값이 존재. Connection 클래스 타입
	
	//여기까지 하면 드라이버를 로드하고 그 드라이버로 데이터베이스와 연결까지 완료
	
	
	//이제 연결된 객체를 통해, 자바에서 쿼리문(sql)을 쓸 수 있도록 해야함.
	Statement stmt = conn.createStatement();
	
	//java.sql에 있는 Statement 클래스 정보를 가져와야함. java.bean에 있는 Statement와는 다름
	
	
	String sql = "select * from student"; //student의 모든 값 가져올거임
	stmt.executeQuery(sql);  //쿼리문을 전달할 수 있게 만든 stmt객체를 통해 executeQuery 쿼리를 실행해라! 메소드를 이용해서 데이터베이스에 sql의 문장을 전달
	//결과값은 Set자료형으로 돌아온다. 
	
	
	ResultSet rs = stmt.executeQuery(sql);   //rs 맨 앞에는 bof(맨 앞입니다)가 있고 맨 뒤에는 eof가 있다. 그 사이에는 값이 다 저장되어있음
	//rs는 해당 공간을 가리키고 있음. 참조중
	//rs.next()를 통해 다음에 있는 값을 가져오면(가리키면) 된다. iterator()를 써서 값을 가져오는 것 처럼..
	
	//정확히 말하자면 가져온 값들은 행별로 분류되어있다. 처음에 커서는 맨 위 아무것도 없는 공간에 있는 식이고, rs.next()를 사용하면 그 다음행을 가리키게 된다.
	//다음행을 가리키게 하고 그 행 안의 값을 뽑아다가 쓰면 된다.
	//모든 값을 다 커서가 지나가고 끝에 다다르면 false를 반환한다.
	
	while(rs.next()){   //hasNext가 아니네. 그냥 그 다음값을 가져와서 실질적인 값이 있느냐 없느냐에 따라 실행되는 듯
		out.print("id : " + rs.getString("num") + "<br>");
		out.print("이름 : " + rs.getString("name") + "<br>");
		out.print("국어 : " + rs.getString("kor") + "<br>");
		out.print("영어 : " + rs.getString("eng") + "<br>");
		out.print("수학 : " + rs.getString("math") + "<br>");
	} //여기서 칼럼명을 쓸 때에는 쌍따옴표로 묶어줘야 함. 그 행에서의 num칼럼에 해당하는 값, name칼럼에 해당하는 값..등을 출력하는거임
	
	//신기한건 나는 분명 run sql command line에서 num과 kor, eng, math를 number형식으로 만들었는데 getter메소드에서 자동으로 형태를 변환해준듯한 모습이다.
	
	
	//열었던 공간을 닫는 것은 역순으로. 왜 역순이지?
	rs.close();  //ResultSet
	stmt.close(); //Statement
	conn.close(); //Connection
	
	
%>

jsp 데이터베이스 네이버 및 구글 검색

포트는 서버(아파치톰캣)에 대한 포트와 데이터베이스(OracleXE)에 대한 포트가 다르다. 당연하지. 다른 응용프로그램이니까
</body>
</html>