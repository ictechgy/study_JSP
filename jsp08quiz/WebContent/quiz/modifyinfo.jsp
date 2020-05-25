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
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = DriverManager.getConnection(url, "jsp001", "1234");
	
	//아이디값도 변경가능하냐 안하냐에 따라 조금 달라질 수도 있을 것 같긴 한데 일단 아이디도 변경 가능하도록 하겠다.
	
	String beforeId = (String)session.getAttribute("id");
	String afterId = request.getParameter("id");
	
	if ( !(beforeId.equals(afterId)) ){   //id값 변경하려는 경우
		String s = "select * from members where id='"+afterId+"'";
		
		Statement st = conn.createStatement();
		
		int cnt = st.executeUpdate(s);
		
		if(cnt == 1){  //변경하려는 id가 이미 존재하는 경우  %>
			<script>
				alert('변경하려는 id가 이미 존재합니다!')
				history.back()
			</script>	
		<%
		return; //필수적인 구문. 이거 안쓰면.. 변경하려는 id가 데이터베이스에 이미 존재하는 경우 위의 경고 스크립트 실행할 수 있도록 서버는 처리하는데 밑에 구문들까지 다 코드 실행이 이루어짐 서버에서. 그래서 등록절차까지 가게되고 Exception뜸
		
		}           //문제는 기존의 아이디를 변경하지 않으려는 경우 id를 다시 동일 id값으로 set하려는게 가능한건가. 가능하다. 기존값과 동일하게 set하려는 경우 그건 무시되는건지 무튼. 그리고 pk여도 변경가능
					//걱정했던 부분은 만약 id는 변경하려 하지 않는경우 sql구문에서 set id쪽은 빼려고 했음. id도 변경하려고 하면 sql구문에 set id를 추가하려 했고.. 근데 한번에 써도 되겠다.
	}
	
	//바꾸려는 id가 존재하지 않는 즉, 바꿀 수 있는 id이거나 아니면 id는 그대로 두고 다른 정보를 변경하려 할 때 아래의 구문 실행
	String sql = "update members set id=?, pwd=?, name=?, addr=?, tel=? where id=?";       //여러값을 set할 때에는 반드시 쉼표 필요
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, afterId);
	pstmt.setString(2, request.getParameter("pwd"));
	pstmt.setString(3, request.getParameter("name"));
	pstmt.setString(4, request.getParameter("addr"));
	pstmt.setString(5, request.getParameter("tel"));
	pstmt.setString(6, beforeId);
	
	int cnt = pstmt.executeUpdate();
	if(cnt == 1){  
		//session.invalidate();  //혹시몰라서 기존 세션은 만료시킴   -> 이거 두니까 에러뜨네?? 왜????
		session.setAttribute("id", afterId);
		session.setAttribute("name", request.getParameter("name"));
		//session.setValue()같은 메소드도 있는 것 같음. 아무튼 세션 재생성. id나 name정보 바뀐 경우 세션도 그에 맞춰야하니
	%>
		<script>
			alert("변경 완료!")
			location.href="main.jsp"   //변경완료 후 세션 다 만료시키고 다시 로그인하라고 login.jsp로 보낼 수도 있음
		</script>
	<%
	}
	
%>



</body>
</html>