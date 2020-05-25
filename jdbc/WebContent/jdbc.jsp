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
	//jar������ �츮�� ���� ������ ����ġ��Ĺ���� lib��ġ�� �Űܵξ���. ���� import�ؾ��ϳ�. Ŭ���������� ����ִ� �ǰ�?
	//�׳� OracleXE��ġ�Ǿ��ִ°��� jar������ import�� ���� ���°ɱ�. import ���ɹ����� ������? ���̺귯���� �־��? �ƿ� �ٱ���γ� URL��δ�?
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//����̹��� �ε��ϴ� �۾�.
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; //����Ŭ���� �� ��ο� ip, ��Ʈ, �������� ���� �� �̰� �ѱ�� ������ ��.
	String id = "jsp001";
	String pwd = "1234";
	
	
	
	Connection conn = DriverManager.getConnection(url, id, pwd);  //DriverManagerŬ���� ��ü�� �޼ҵ带 ���� ����� ��ü�� �ϳ� ����� ������ ���ڴ�!
	//���ϰ��� ����. Connection Ŭ���� Ÿ��
	
	//������� �ϸ� ����̹��� �ε��ϰ� �� ����̹��� �����ͺ��̽��� ������� �Ϸ�
	
	
	//���� ����� ��ü�� ����, �ڹٿ��� ������(sql)�� �� �� �ֵ��� �ؾ���.
	Statement stmt = conn.createStatement();
	
	//java.sql�� �ִ� Statement Ŭ���� ������ �����;���. java.bean�� �ִ� Statement�ʹ� �ٸ�
	
	
	String sql = "select * from student"; //student�� ��� �� �����ð���
	stmt.executeQuery(sql);  //�������� ������ �� �ְ� ���� stmt��ü�� ���� executeQuery ������ �����ض�! �޼ҵ带 �̿��ؼ� �����ͺ��̽��� sql�� ������ ����
	//������� Set�ڷ������� ���ƿ´�. 
	
	
	ResultSet rs = stmt.executeQuery(sql);   //rs �� �տ��� bof(�� ���Դϴ�)�� �ְ� �� �ڿ��� eof�� �ִ�. �� ���̿��� ���� �� ����Ǿ�����
	//rs�� �ش� ������ ����Ű�� ����. ������
	//rs.next()�� ���� ������ �ִ� ���� ��������(����Ű��) �ȴ�. iterator()�� �Ἥ ���� �������� �� ó��..
	
	//��Ȯ�� �����ڸ� ������ ������ �ະ�� �з��Ǿ��ִ�. ó���� Ŀ���� �� �� �ƹ��͵� ���� ������ �ִ� ���̰�, rs.next()�� ����ϸ� �� �������� ����Ű�� �ȴ�.
	//�������� ����Ű�� �ϰ� �� �� ���� ���� �̾ƴٰ� ���� �ȴ�.
	//��� ���� �� Ŀ���� �������� ���� �ٴٸ��� false�� ��ȯ�Ѵ�.
	
	while(rs.next()){   //hasNext�� �ƴϳ�. �׳� �� �������� �����ͼ� �������� ���� �ִ��� �����Ŀ� ���� ����Ǵ� ��
		out.print("id : " + rs.getString("num") + "<br>");
		out.print("�̸� : " + rs.getString("name") + "<br>");
		out.print("���� : " + rs.getString("kor") + "<br>");
		out.print("���� : " + rs.getString("eng") + "<br>");
		out.print("���� : " + rs.getString("math") + "<br>");
	} //���⼭ Į������ �� ������ �ֵ���ǥ�� ������� ��. �� �࿡���� numĮ���� �ش��ϴ� ��, nameĮ���� �ش��ϴ� ��..���� ����ϴ°���
	
	//�ű��Ѱ� ���� �и� run sql command line���� num�� kor, eng, math�� number�������� ������µ� getter�޼ҵ忡�� �ڵ����� ���¸� ��ȯ���ص��� ����̴�.
	
	
	//������ ������ �ݴ� ���� ��������. �� ��������?
	rs.close();  //ResultSet
	stmt.close(); //Statement
	conn.close(); //Connection
	
	
%>

jsp �����ͺ��̽� ���̹� �� ���� �˻�

��Ʈ�� ����(����ġ��Ĺ)�� ���� ��Ʈ�� �����ͺ��̽�(OracleXE)�� ���� ��Ʈ�� �ٸ���. �翬����. �ٸ� �������α׷��̴ϱ�
</body>
</html>