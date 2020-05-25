package memo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public MemoDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {}
		url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	
		user="kgitbank";
		pass="kgitbank";
	} 
	
	public int insertMemo(String id, String email, String memo) throws SQLException {
		String sql="insert int memo values(?,?,?)";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			ps.setString(3, memo);
			int res=ps.executeUpdate();
			return res;
		}finally {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public ArrayList<MemoDTO> listMemo() throws SQLException{
		String sql="select * from memo";
		ArrayList<MemoDTO> list = new ArrayList<>();
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setId(rs.getString(1));
				dto.setEmail(rs.getString(2));
				dto.setMemo(rs.getString(3));
				list.add(dto);
			}
			return list;
		}finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	
}
