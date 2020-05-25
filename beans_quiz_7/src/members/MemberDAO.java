package members;
import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public MemberDAO() {	//생성자
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp001";
		String password = "1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	//드라이버 로드
			con = DriverManager.getConnection(url, user, password);	//로드한 드라이버를 통해 데이터베이스와의 연결객체 생성. 이때 인자로 필요한 항목값 입력
		} catch (Exception e) {
			e.printStackTrace();
		}//발생할 수 있는 예외에는 ClassNotFoundException(드라이버 미발견), SQLException(연결객체생성도중의 문제) 가 있다.
	}
	
	public ArrayList<MemberDTO> memberView() {   //멤버의 목록을 쫙 반환하는 메소드
		String sql = "select * from members";
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		//db의 모든 내용을 저장할 memberDTO 리스트
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString(1));
				mb.setPwd(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setAddr(rs.getString(4));
				mb.setTel(rs.getString(5));  //ResultSet클래스의 인스턴스인 rs객체의 칼럼값을 가져올 때 숫자를 입력하면 칼럼순서대로 잘 가져온다.
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("memberList : "+memberList);  //memberList.toString()을 쓴것과 동일할텐데.. 그러면 내부의 값이 모두 나오려나 콘솔창에?
		return memberList;
	}
	
	
	
	//로그인 메소드
	public int userCheck(String id,String pwd) throws SQLException{
		String sql = "select * from members where id=?";
		int chk=-1;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){
					chk = 0;  //일치하는 아이디, 비밀번호값 확인 성공
				}else{ chk = 1; }	//같은 아이디는 발견하였으나 비밀번호 불일치
			}else{ chk = -1; }	//아이디부터 존재하지 않음
		} catch (SQLException e) {	e.printStackTrace(); }   //위에 throws로 Exception처리 했는데 굳이 이걸 쓰신 이유는 뭐지..
		return chk;	
	}

	
	//위에 있는 memberView의 오버로드메소드. 
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
	
	
	public int changeUser(MemberDTO user) throws SQLException{
		String sql = "update members set name=?,addr=?,tel=? where id=?";
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getAddr());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getId());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				if(ps != null) ps.close();
				if( con != null) con.close();
		}
		return result;
	}
	
	
	
	public int delete(String Uid){
		String sql = "delete from members where id=?";
		int result=-1;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, Uid);
			ps.executeQuery();
			result=0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	
	//메소드들을 static으로 만든다면 어떻게 될까? 작동이 될까? 아니면 생성자를 통해서만 연결객체가 만들어지는거니까 작동하지 않을까?
	//그러면 드라이버로드와 연결객체 생성문까지 다 메소드에 넣거나..(매 메소드마다 넣어줘야하니 귀찮을지도?) 아니면 static영역에 드라이버로드와 연결객체 생성문을 넣으면 되지 않을까?
}







