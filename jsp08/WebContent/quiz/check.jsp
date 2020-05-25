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

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "jsp001";
	String dbPw = "1234";
	
	Connection conn = DriverManager.getConnection(url, dbId, dbPw);
	
	//사용자의 입력값을 데이터베이스에서 찾는 것은 크게 두가지방식이 있을 것 같다. executeQuery로 모든 데이터를 ResultSet으로 받아와서 그 Set을 쭉 다 훑으면서 일치하는 값이 있는지 찾거나
	//그냥 select * from members where id=? 방식으로 키값으로 지정된 id값이 일치하는게 있나 보는거.. 그리고 저 구문을 실행시킬 때 단순히 executeUpdate메소드로 일치하는 id값이 있는지 없는지만 찾을것인지..
	//executeQuery로 해서 존재한다면 그 행을 가져와서 이제 패스워드 값까지 비교할 수 있도록 만드는게 낫겠지? 아니면 select pwd from members where id=? 이게 나을듯? 물론 하나의 값만 딱 가져와도 그건 ResultSet일테고..
	//아 근데 pwd값만 가져오려고 했는데 세션생성해서 메인페이지로 넘길 때 사용자 이름으로 ~님 환영합니다 띄워야하니까 걍 그 행의 모든 값 가져오는게 나을 듯

	String sql = "select * from members where id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();  //일치하는 값이 없다면 rs에는 null값이들어가는건가. 그리고 PreparedStatement에 sql값이 들어갔는데 한번 execute로 썼는데도 남아있는걸까. 또 execute메소드 인자로 다른 sql값 넣을 수 있나 
	
	//일치하는 값이 존재하지 않는다면 rs는 null로 존재하는게 아닌.. ResultSet객체이긴 한데 아무것도 없는 그저 bof와 eof만 있는 상태의 객체가 되는 듯 하다.
	
	if ( !(rs.next()) ){  //rs == null 로 조건식을 둔 경우 일치하는 id값이 없어도 rs는 null이 되지 않기에 작동하지 않게 됨
%>
	<script>
		alert("일치하는 아이디가 없습니다.")
		history.back()
		//location.href="login.jsp"
	</script>
<%}
	else{
		//rs.next();  원래는 썼었는데 위 if문 조건식에서 rs.next()한번은 수행이 되니까 이걸 주석처리하게 됨
		String dbPwd = rs.getString("pwd");
		
		if (pwd.equals(dbPwd)){
			String userName = rs.getString("name");
			session.setAttribute("name", userName);  //로그인이 성공한 경우 세션을 만드는데 그 세션은 id라는 사용자별 다른 id라는 이름에 userName이 담긴 형태.
			//여기서 세션변수명을 쌍따옴표로 묶인 고정명이 아닌 setAttribute(id, userName)으로 하면 사용자마다 id가 다르므로 서로다른 변수명에 이름값이 담긴건데 그러면 그걸 main.jsp에서는 받을 방도가 없네..
			response.sendRedirect("main.jsp");
		}
		else{ %>
		<script>
			alert("비밀번호가 일치하지 않습니다.")
			history.back()
		</script>
	<% 
		}
		
	}
	%>




</body>
</html>