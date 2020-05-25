<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- 
	1. 넘어온 데이터를 받아오기
	2. 넘어온 데이터의 유효성 검사
	3. DB와 연결하기
	4. 쿼리를 전송
	5. 전송결과에 따른 페이지 구성 다르게 하기
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");	//post방식으로 넘어오는 경우 꼭 해야하는 한글처리. get방식에서는 필요없음
	String name=request.getParameter("name");
	String publisher=request.getParameter("publisher");
	String writer=request.getParameter("writer");
	String price=request.getParameter("price"); //parameter로 넘어오는 데이터는 모두 String이다. 
	//값이 넘어왔는지 안넘어왔는지도 모르는데 여기서 바로 Integer.parseInt()해버리면 오류가 뜰 수도 있다.
	
	if (name==null||name.trim().equals("")||publisher==null||publisher.trim().equals("")
			||writer==null||writer.trim().equals("")||price==null||price.trim().equals("")){%>
		<script type="text/javascript">
			alert("도서등록 내용이 부족합니다. 다시 확인하시고 입력해주세요")
			history.back()	//기록이 남은 사이트 중 바로 뒷사이트로 이동
		</script>
<%	return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");  //lib파일들은 WebContent/WEB-INF/lib 하위에 넣기
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	//DB위치지정
	String user="kgitbank";
	String pwd="kgitbank";
	String sql="insert into book values(?,?,?,?,sysdate)"; //joindate자리에 sysdate함수를 실행시켜 현재날짜가 입력되도록 한다. oracle DB의 고유 명령어이다
	Connection conn=DriverManager.getConnection(url, user, pwd);
	PreparedStatement ps = conn.prepareStatement(sql); //동적쿼리
	ps.setString(1,name);
	ps.setString(2, publisher);
	ps.setString(3, writer);
	ps.setInt(4, Integer.parseInt(price));
	int res = ps.executeUpdate(); //res값이 1이상이면 한개 이상 insert 성공, 0이면 insert 실패
	if (res>0) {%>
		<script>
			alert("도서등록 성공!! 도서보기페이지로 이동합니다.")
			location.href="list.jsp"
		</script>
<%	}else{%>
		<script>
			alert("도서등록 실패! 도서등록페이지로 이동합니다.")
			location.href="insert.jsp"
		</script>
<%	}	
	ps.close();
	conn.close();
%>
</body>
</html>