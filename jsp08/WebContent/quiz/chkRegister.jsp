<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
			alert("���̵� �̹� �����մϴ�")
			history.back()   //�Ǵ� response.sendRedirect
		</script> 
	<%
	}
	else{   //else�� �ȹ����ִ� ��������. �Ƹ��� �������� �ǳ׹��� ���� ó���ϱ�� �ϴµ� else�� �ȹ����� ������ ���̵� �ߺ��Ǿ� �߰��� �Ǿ���
	//�� "���̵� �����մϴ�"��ũ��Ʈ �����Ű���� �ۼ��� �� ���� ������ ���������� �� ������Ѽ��ε� �ϴ�. �׷��� Update������ ���ư��� �����߰�
	
	
	//�̷��� history.back()�ϴϱ� ������ �Է��ߴ� �� �����ϱ� ��. response.sendRedirect�ᵵ �Ǳ� ���ٵ�
	
	
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
			alert("ȸ�������� �����մϴ�!")
			location.href='login.jsp'
		</script>
	<%
	}
	}
%>


</body>
</html>

<!-- 
	id���� �����ϴ��� Ȯ���Ϸ��� ������ �۵����� �ʾҴ� ����

	int chkcnt = chkstmt.executeUpdate();    //executeUpdate()�� ���� �̹� �ִ��� �����Ϸ� �ߴµ� �ȵǳ�. ���� �̹� �ִٸ� 1�� ��ȯ�� �� �˾���
	if(chkcnt == 1){ % >
		<script>
			alert("���̵� �̹� �����մϴ�")
			history.back()   //�Ǵ� response.sendRedirect
		</script> 
	< %
	}
	
	���� ���� �۵��Ѵ�!!



	ResultSet rs = chkstmt.executeQuery();
	if(rs.next()){  % >
		<script>
			alert("���̵� �̹� �����մϴ�.")
			history.back()
		</script>
	< %	
	}

 -->