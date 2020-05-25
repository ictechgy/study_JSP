package members;

import java.sql.*;
import java.util.ArrayList;

public class memberDAO {

	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public memberDAO() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "jsp001", "1234");  //�����ͺ��̽��� ���� ������(sys)�� �ƴ� �׳� ����ڷμ��� �����ϳ�.. �� �׷��� ����� �̿��ϴ°ɱ�
			
		}catch(Exception e){
			e.printStackTrace();
		}  //�߻��� �� �ִ� ���ܿ��� ClassNotFoundException(����̹� �� ã���� �߻�)�� SQLException(�����ͺ��̽��� ���� ���� �߻�����)�� �ִ�.
	}
	//�̷��� �����ڸ� �������μ�, ���� memberDAO ��ü�� ����� �ش� ��ü�� ���ؼ� �����ͺ��̽��� ����� �� �ִ�.
	
	
	
	public int loginChk(memberDTO user) {		//�α��ο� ���� ��ȿ���˻�. �����ͺ��̽��� ����ڰ� �Է��� ���� ��ġ�ϴ� ���̵� �� �н����尡 �����ϴ��� Ȯ��
		String id = user.getId();
		String pwd = user.getPwd();
		
		String sql = "select * from members where id=?";
		
		try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			if(pwd.equals(rs.getString("pwd"))) {
				return 1;  //�α���
			}
			else {
				return 0;  //��й�ȣ ����ġ
			}
		}else {
			return -1;  //���̵� �������� ����
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			return -10;
		}
		
	}
	
	
	public ArrayList<memberDTO> memberView(){
		ArrayList<memberDTO> memberList = new ArrayList<>();
		
		String sql = "select * from members";
		
		
		try {
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()) {
			memberDTO m = new memberDTO();
			m.setId(rs.getString(1));
			m.setPwd(rs.getString(2));
			m.setName(rs.getString(3));
			m.setAddr(rs.getString(4));
			m.setTel(rs.getString(5));
			memberList.add(m);
		}
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
		
	}
	
	public memberDTO personalView(String id) {
		String sql = "select * from members where id=?";
		memberDTO m = new memberDTO();
		
		try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		rs.next();
		
		
		m.setId(rs.getString("id"));
		m.setPwd(rs.getString("pwd"));
		m.setName(rs.getString("name"));
		m.setAddr(rs.getString("addr"));
		m.setTel(rs.getString("tel"));
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	
	public int registerChk(memberDTO user) {
		String id = user.getId();
		
		String sql = "select * from members where id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			int cnt = ps.executeUpdate();
			
			if (cnt == 0) {
				String r = "insert into members values(?,?,?,?,?)";
				ps=conn.prepareStatement(r);
				ps.setString(1, id);
				ps.setString(2, user.getPwd());
				ps.setString(3, user.getName());
				ps.setString(4, user.getAddr());
				ps.setString(5, user.getTel());
				ps.executeUpdate();
				return 0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	
	
	public void update(memberDTO user) {
		String sql = "update members set pwd=?, name=?, addr=?, tel=? where id=?";
		
		try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, user.getPwd());
		ps.setString(2, user.getName());
		ps.setString(3, user.getAddr());
		ps.setString(4, user.getTel());
		ps.setString(5, user.getId());
		ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void delete(String id) {
		String sql = "delete from members where id=?";
		
		try {
		ps=conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
