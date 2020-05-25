<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = DriverManager.getConnection(url, "jsp001", "1234");
	
	
	String chkid = "select * from members where id=?";
	PreparedStatement chkstmt = conn.prepareStatement(chkid);
	
	chkstmt.setString(1, request.getParameter("id") );
	

	int chkcnt = chkstmt.executeUpdate();   
	if(chkcnt == 1){ %>
		<script>
			alert("아이디가 이미 존재합니다")
			history.back()   //또는 response.sendRedirect
		</script> 
	<%
	}
	else{   //else로 안묶어주니 오류가남. 아마도 클라이언트에서 값을 받고, 서버에서 건네받은 값을 처리하기는 하는데 else로 안묶으면 위에서 아이디가 중복되어 발견이 되었을
	//때 "아이디가 존재합니다"스크립트 실행시키도록 작성한 후 밑의 구문을 정상적으로 또 실행시켜서인듯 하다. 그러면 밑에서 데이터베이스에 값을 등록하는 Update구문이 돌아가서 오류뜨는거고
	//그냥 바로 중간에 돌아가도록 response.sendRedirect썼으면 else로 안묶어줘도 되긴 했을지도
	
	
	//이렇게 history.back()하니까 아이디 중복된다고 하고 이전페이지 돌아가면 이전에 입력했던 값 존재하긴 함.(패스워드만 사라진 상태로) response.sendRedirect써도 되긴 할텐데 그건 아마 모든 값을 다 소멸시킨 페이지를 보내주는거겠지
	
	
	String sql = "insert into members values(?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("id") );
	pstmt.setString(2, request.getParameter("pwd") );
	pstmt.setString(3, request.getParameter("name"));
	pstmt.setString(4, request.getParameter("addr"));
	pstmt.setString(5, request.getParameter("tel"));
	
	int cnt = pstmt.executeUpdate();
	
	if(cnt == 1){%>
		<script>
			alert("회원가입을 축하합니다!")
			location.href='login.jsp'
		</script>
	<%
	}
	}
%>


</body>
</html>

<!-- 
	id값이 존재하는지 확인하려고 했을때 작동하지 않았던 구문

	int chkcnt = chkstmt.executeUpdate();    //executeUpdate()로 select구문을 보내서 값이 이미 있는지 검증하려 했는데 안되네. 값이 이미 있다면 1을 반환할 줄 알았음
	if(chkcnt == 1){ % >
		<script>
			alert("아이디가 이미 존재합니다")
			history.back()   //또는 response.sendRedirect
		</script> 
	< %
	}
	
	위의 구문 작동한다!! -> 일치하는 행이 존재하면 그 행의 갯수를 반환하는 듯. id는 고유하게 하나씩만 존재하므로 id가 중복된다면 1값을 반환하는 것 같다.

	또는 그냥 아래와 같이 ResultSet을 써도 되긴 함

	ResultSet rs = chkstmt.executeQuery();
	if(rs.next()){  % >
		<script>
			alert("아이디가 이미 존재합니다.")
			history.back()
		</script>
	< %	
	}

 -->