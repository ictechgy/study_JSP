<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- 
	1. �Ѿ�� �����͸� �޾ƿ���
	2. �Ѿ�� �������� ��ȿ�� �˻�
	3. DB�� �����ϱ�
	4. ������ ����
	5. ���۰���� ���� ������ ���� �ٸ��� �ϱ�
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");	//post������� �Ѿ���� ��� �� �ؾ��ϴ� �ѱ�ó��. get��Ŀ����� �ʿ����
	String name=request.getParameter("name");
	String publisher=request.getParameter("publisher");
	String writer=request.getParameter("writer");
	String price=request.getParameter("price"); //parameter�� �Ѿ���� �����ʹ� ��� String�̴�. 
	//���� �Ѿ�Դ��� �ȳѾ�Դ����� �𸣴µ� ���⼭ �ٷ� Integer.parseInt()�ع����� ������ �� ���� �ִ�.
	
	if (name==null||name.trim().equals("")||publisher==null||publisher.trim().equals("")
			||writer==null||writer.trim().equals("")||price==null||price.trim().equals("")){%>
		<script type="text/javascript">
			alert("������� ������ �����մϴ�. �ٽ� Ȯ���Ͻð� �Է����ּ���")
			history.back()	//����� ���� ����Ʈ �� �ٷ� �޻���Ʈ�� �̵�
		</script>
<%	return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");  //lib���ϵ��� WebContent/WEB-INF/lib ������ �ֱ�
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	//DB��ġ����
	String user="kgitbank";
	String pwd="kgitbank";
	String sql="insert into book values(?,?,?,?,sysdate)"; //joindate�ڸ��� sysdate�Լ��� ������� ���糯¥�� �Էµǵ��� �Ѵ�. oracle DB�� ���� ��ɾ��̴�
	Connection conn=DriverManager.getConnection(url, user, pwd);
	PreparedStatement ps = conn.prepareStatement(sql); //��������
	ps.setString(1,name);
	ps.setString(2, publisher);
	ps.setString(3, writer);
	ps.setInt(4, Integer.parseInt(price));
	int res = ps.executeUpdate(); //res���� 1�̻��̸� �Ѱ� �̻� insert ����, 0�̸� insert ����
	if (res>0) {%>
		<script>
			alert("������� ����!! ���������������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>
<%	}else{%>
		<script>
			alert("������� ����! ��������������� �̵��մϴ�.")
			location.href="insert.jsp"
		</script>
<%	}	
	ps.close();
	conn.close();
%>
</body>
</html>