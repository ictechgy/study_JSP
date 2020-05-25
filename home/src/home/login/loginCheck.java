package home.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginCheck {
	//���̵�� �н����带 �Է¹޾� DB�� �� ���� ���ϰ� ����� �˷��ִ� Ŭ����
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public loginCheck() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {}
	}
	
	public int loginChecking() {
		String sql="select passwd from jsp_member where id=?";
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user="kgitbank";
		String pass="kgitbank";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPass=rs.getString(1);
				if(dbPass.equals(passwd)) {
					return OK;
				}else {
					return NOT_PW;
				}
			}else {
				return NOT_ID;
			}
		}catch(SQLException e){
			return ERROR;
		}
	}
	
}
