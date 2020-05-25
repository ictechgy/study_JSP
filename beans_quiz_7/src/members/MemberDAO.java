package members;
import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public MemberDAO() {	//������
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp001";
		String password = "1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	//����̹� �ε�
			con = DriverManager.getConnection(url, user, password);	//�ε��� ����̹��� ���� �����ͺ��̽����� ���ᰴü ����. �̶� ���ڷ� �ʿ��� �׸� �Է�
		} catch (Exception e) {
			e.printStackTrace();
		}//�߻��� �� �ִ� ���ܿ��� ClassNotFoundException(����̹� �̹߰�), SQLException(���ᰴü���������� ����) �� �ִ�.
	}
	
	public ArrayList<MemberDTO> memberView() {   //����� ����� �� ��ȯ�ϴ� �޼ҵ�
		String sql = "select * from members";
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		//db�� ��� ������ ������ memberDTO ����Ʈ
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString(1));
				mb.setPwd(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setAddr(rs.getString(4));
				mb.setTel(rs.getString(5));  //ResultSetŬ������ �ν��Ͻ��� rs��ü�� Į������ ������ �� ���ڸ� �Է��ϸ� Į��������� �� �����´�.
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("memberList : "+memberList);  //memberList.toString()�� ���Ͱ� �������ٵ�.. �׷��� ������ ���� ��� �������� �ܼ�â��?
		return memberList;
	}
	
	
	
	//�α��� �޼ҵ�
	public int userCheck(String id,String pwd) throws SQLException{
		String sql = "select * from members where id=?";
		int chk=-1;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){
					chk = 0;  //��ġ�ϴ� ���̵�, ��й�ȣ�� Ȯ�� ����
				}else{ chk = 1; }	//���� ���̵�� �߰��Ͽ����� ��й�ȣ ����ġ
			}else{ chk = -1; }	//���̵���� �������� ����
		} catch (SQLException e) {	e.printStackTrace(); }   //���� throws�� Exceptionó�� �ߴµ� ���� �̰� ���� ������ ����..
		return chk;	
	}

	
	//���� �ִ� memberView�� �����ε�޼ҵ�. 
	public ArrayList<MemberDTO> memberView(String id){
		String sql = "select * from members where id=?"; //������
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()){//DB�� ����� ��� ó���ϴ� �ݺ���
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

	
	
	//�޼ҵ���� static���� ����ٸ� ��� �ɱ�? �۵��� �ɱ�? �ƴϸ� �����ڸ� ���ؼ��� ���ᰴü�� ��������°Ŵϱ� �۵����� ������?
	//�׷��� ����̹��ε�� ���ᰴü ���������� �� �޼ҵ忡 �ְų�..(�� �޼ҵ帶�� �־�����ϴ� ����������?) �ƴϸ� static������ ����̹��ε�� ���ᰴü �������� ������ ���� ������?
}







