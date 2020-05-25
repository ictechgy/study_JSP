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
			conn = DriverManager.getConnection(url, "jsp001", "1234");  //데이터베이스에 대해 관리자(sys)가 아닌 그냥 사용자로서만 접근하네.. 왜 그러한 방식을 이용하는걸까
			
		}catch(Exception e){
			e.printStackTrace();
		}  //발생할 수 있는 예외에는 ClassNotFoundException(드라이버 못 찾을시 발생)과 SQLException(데이터베이스와 연결 도중 발생가능)이 있다.
	}
	//이렇게 생성자를 만듬으로서, 이제 memberDAO 객체를 만들면 해당 객체를 통해서 데이터베이스와 통신할 수 있다.
	
	
	
	public int loginChk(memberDTO user) {		//로그인에 대한 유효성검사. 데이터베이스에 사용자가 입력한 값과 일치하는 아이디 및 패스워드가 존재하는지 확인
		String id = user.getId();
		String pwd = user.getPwd();
		
		String sql = "select * from members where id=?";
		
		try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		
		if(rs.next()) {
			if(pwd.equals(rs.getString("pwd"))) {
				return 1;  //로그인
			}
			else {
				return 0;  //비밀번호 불일치
			}
		}else {
			return -1;  //아이디 존재하지 않음
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
