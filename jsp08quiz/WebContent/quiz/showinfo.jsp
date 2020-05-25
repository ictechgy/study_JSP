<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>

	function _update(){
		if (id.value==''){
			alert('아이디는 공백이 될 수 없습니다.')
		}
		else if(pwd.value==''){
			alert('비밀번호는 공백이 될 수 없습니다')
		}
		else{
			go.submit()
		}
		
	}
	
	
	function _delete(){    //delete라고 메소드명 작성하려했는데 예약어로 있음
		var verify = confirm('정말로 회원탈퇴를 하시겠습니까?')
		
		if (verify){
			location.href='delete.jsp'
		}
		
	}
	//삭제에 대해서 이렇게 다른 jsp파일을 통해서 구현할 수도 있지만.. 버튼에 따라서 onclick='location.href="modifyinfo.jsp?변수명="' 값을 달리 둠으로서 modifyinfo.jsp에서 어떤 동일한 변수명을 호출했을 때 그 값이 1이나 2이냐
	//뭐 그런거에 따라서 값을 변경할지 아니면 삭제할지를 선택하도록 할 수도 있을 것이다..아니면 그냥 삭제버튼쪽에만 onclick안에 변수명과 값을 둠으로서 modifyinfo.jsp에서 맨 앞에 if문을 두고 request로 해당 변수를 불러왔을 때 null이냐 아니냐를 두고 
	//실행을 다르게 해도 됨.(modifyinfo페이지에서 이 페이지가 실행된 근거를 form태그를 통해 호출된건지 아니면 onclick으로 호출된건지를 판단할 수 있게) 근데 이러한 방식은 get방식일테니까.. 삭제쪽에다가만 해놓는게 나을듯. 
	
</script>


</head>
<body>
<h1>회원정보 수정 및 삭제</h1>
<%
	//로그인한 회원의 정보를 일단 출력해야하는데.. 어떻게 해야지? 세션은 사용자 이름값(칼럼명 : name)으로 만들어놔서 중복되는 값이 존재할 수 있으니까 막 쓰지는 못하겠고..
	//그냥 로그인 성공 할 때 사용자 id값으로 세션 하나 더 만드는게 낫겠다.
	
	if (session.getAttribute("id")==null){
		out.print("<script>alert('잘못된 접근입니다.'); location.href='login.jsp';</script>");
	}
	
	String userId = (String)session.getAttribute("id");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = DriverManager.getConnection(url, "jsp001", "1234");
	
	Statement stmt = conn.createStatement();
	
	String sql = "select * from members where id='"+userId+"'";  //또는 물음표로 두고 PreparedStatement를 써도 됨
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
%>




<form action='modifyinfo.jsp' id='go' method='post'>

<table>
<tr>
	<th>아이디 :</th><td><input type='text' id='id' name='id' value=<%= rs.getString("id") %> ></td>
</tr>
<tr>
	<th>비밀번호 :</th><td><input type='text' id='pwd' name='pwd' value=<%= rs.getString("pwd") %> ></td> <!-- 비밀번호 값이 보이는것도 그렇지만.. 회원정보 수정하려 할 때 비밀번호 한번 더 체크 및 비밀번호 수정시에 비밀번호 확인 한번더 또 해야할 것 같은데 -->
</tr>
<tr>
	<th>이름 :</th><td><input type='text' name='name' value=<%= rs.getString("name") %> ></td>
</tr>
<tr>
	<th>주소 :</th><td><input type='text' name='addr' value=<%= rs.getString("addr") %> ></td>
</tr>
<tr>
	<th>전화번호 :</th><td><input type='text' name='tel' value=<%= rs.getString("tel") %> ></td>
</tr>
<tr>
	<td align='right'><input type='button' value='수정' onclick='_update()'></td><td><input type='button' value='삭제' onclick='_delete()'></td>
</tr>
</table>
</form>





</body>
</html>