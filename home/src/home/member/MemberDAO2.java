package home.member;
import java.sql.*;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO2 {
	Connection conn;
	ResultSet rs;
	PreparedStatement ps;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println(e.getMessage());
		}
	}
	//jar���� �� context.xml�� web.xml�� Ŀ�ؼ�Ǯ�� ������ �غ� �� �ڿ�(�⺻����) ���⼭ ds��� �̸����� �� Ǯ�� �����ϴ� ������ ���δ�.
	//DAO��ü�������� ������� ���α׷� ���۽� �ٷ� ����������� static���� �����, Context init�� �Ʊ� �ۼ��� ���������� �о���� ������ ���δ�.

	
	public MemberDAO2() {}
	
	public boolean checkMember(String name, String ssn1, String ssn2) throws SQLException{
		String sql="select * from jsp_member where ssn1=? and ssn2=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, ssn1);
			ps.setString(2, ssn2);
			rs = ps.executeQuery();
			if(rs.next()) return true; //�ֹι�ȣ�� ������ ���̶� ���� ���� ������ �̹� ȸ���̶�� ��
			else return false;
			
			//�ٵ� rs�� �ʿ���� executeUpdate();�ᵵ ��ȯ�Ǵ� ���� �ִٸ� 1�̻� ������ �����״�.. int�������� �޾Ƽ� ���� �����ص� ��
		}finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public int insertMember(MemberDTO dto) throws SQLException{
		String sql="insert into jsp_member values(jsp_number_no.NEXTVAL, ?,?,?,?,?,?,?,?,?,sysdate)";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPasswd());
			ps.setString(4, dto.getSsn1());
			ps.setString(5, dto.getSsn2());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getHp1());
			ps.setString(8, dto.getHp2());
			ps.setString(9, dto.getHp3());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public ArrayList<MemberDTO> listMember() throws SQLException{
		String sql="select * from jsp_member";
		try {
			conn=ds.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> listMember = makeArrayList(rs);
			return listMember;
		}finally {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}
	}
	
	public ArrayList<MemberDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<MemberDTO> listMember = new ArrayList<MemberDTO>();
		while(rs.next()) {
			MemberDTO dto=new MemberDTO();
			dto.setNo(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setId(rs.getString(3));
			dto.setPasswd(rs.getString(4));
			dto.setSsn1(rs.getString(5));
			dto.setSsn2(rs.getString(6));
			dto.setEmail(rs.getString(7));
			dto.setHp1(rs.getString(8));
			dto.setHp2(rs.getString(9));
			dto.setHp3(rs.getString(10));
			dto.setJoindate(rs.getString(11));
			listMember.add(dto);
		}
		return listMember;
	}
	
	
	
	private String search,searchString;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getSearchString() {
		return searchString;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	
	public ArrayList<MemberDTO> findMember() throws SQLException{
		if (search==null||search.trim().equals("")||searchString==null||searchString.trim().equals("")) {
			return null;
		}
		String sql = "select * from jsp_member where"+search+"=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, searchString);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> findMember = makeArrayList(rs);
			return findMember;
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public int deleteMember(int no) throws SQLException {
		String sql="delete from jsp_member where no=?";
		try {
			conn=ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			int res=ps.executeUpdate();
			return res;
		}finally {
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public MemberDTO getMember(int no) throws SQLException{
		String sql="select * from jsp_member where no=?";
		try {
			conn=ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public int updateMember(MemberDTO dto) throws SQLException {
		String sql="update jsp_member set passwd=?, email=?, hp1=?, hp2=?, hp3=? where no=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getPasswd());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getHp1());
			ps.setString(4, dto.getHp2());
			ps.setString(5, dto.getHp3());
			ps.setInt(6, dto.getNo());
			int res=ps.executeUpdate();
			return res;
		}finally {
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
}
