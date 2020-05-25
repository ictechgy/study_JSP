package members;
import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public MemberDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp001";
		String password = "1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		//db의 모든 내용을 저장할 memberDTO 리스트
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				System.out.print("1111111");
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString(1));
				mb.setPwd(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setAddr(rs.getString(4));
				mb.setTel(rs.getString(5));
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("memberList : "+memberList);
		return memberList;
	}
	public int userCheck(String id,String pwd) throws SQLException{
		String sql = "select * from members where id=?";
		int chk=-1;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){
					chk = 0;
				}else{ chk = 1; }
			}else{ chk = -1; }
		} catch (SQLException e) {	e.printStackTrace(); }
		finally{
			if( rs != null) rs.close();
			if( ps != null) ps.close();
			if( con != null) con.close();
		}
		return chk;	
	}

}







