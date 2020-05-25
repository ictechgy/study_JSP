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
		return chk;	
	}

	public ArrayList<MemberDTO> memberView(String id){
		String sql = "select * from members where id=?"; //쿼리문
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){//DB의 내용들 모두 처리하는 반복문
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString(1));
				dto.setPwd(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dto.setTel(rs.getString(5));
				memberList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	public int chkRegister(MemberDTO user){
		String sql = "insert into members values(?,?,?,?,?)";
		int howRow=0;
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAddr());
			pstmt.setString(5, user.getTel());
			howRow = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return howRow;
	}

}







