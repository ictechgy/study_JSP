package home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO { //���ǿ����� BoardDataBean�̶�� �̸����� �������.
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	String sql;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.err.println(e.getMessage());
		}
	}
	//���̺� �ٸ� �� ���� �����ͺ��̽��� �����ϴ°Ű�, MemberDAO2.java���� Ŀ�ؼ�Ǯ�� �����س����ٵ� ���⼭ �� �����ϴ� �ڵ尡 ���� �ʿ䰡 ������...
	//������������ �� �κб��� ���� �̾Ƴ��� �׳� Ŀ�ؼ� ��ü�� �ٷ� ������ ���� ����̾�����. (Ŀ�ؼ� Ǯ ���� �ڵ�� �ѹ��� �۵��ǵ���)
	//Ŀ�ؼ� ��ü������ �־ getInstance()�� �ؼ� Ŀ�ؼ� Ǯ�� �̹� �ִٸ� �ִ� ���� ���� �������..
	
	
	public ArrayList<BoardDTO> listBoard(int startRow, int end) throws SQLException{
		//sql="select * from jsp_board order by re_step asc"; //re_step �������� ����
		String sql="select * from (select rownum rn, A.*from (select * from jsp_board order by re_step asc)A) where rn between ? and ?";
		//select * from jsp_board order by re_step asc �� ���� �����Ѵ�. �׸��� �׷��� ���� ����� rownum�� ���δ�. �ֽűۿ� 1���� ���̴¹��
		//�׸��� �� rn���� ������� startRow���� �����ؼ� endRow���� ������´�.
		try{
			conn=ds.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<BoardDTO> boardList = makeArrayList(rs);
			return boardList;
		}finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public ArrayList<BoardDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setRe_step(rs.getInt("re_step"));
			dto.setRe_level(rs.getInt("re_level"));
			list.add(dto);
		}
		return list;
	}
	
	
	public int insertBoard(BoardDTO dto) throws SQLException{
		if(dto.getNum()==0) { //���� �ۼ�
			sql = "update jsp_board set re_step=re_step+1";
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			int res=ps.executeUpdate();
		}else { //��� �ۼ�
			sql="update jsp_board set re_step=re_step+1 where re_step>?";
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getRe_step());
			int res=ps.executeUpdate();
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
		}
		//��ۿ� ������ �ٴ� ���� ����� ���µ� ����� �޷��ִ� ���ۿ��� ��۴ޱ⸦ ���� ����� �ٴ� ��� Re_level�� 1�� �������� ���� �߻�
		sql="insert into jsp_board values(jsp_board_num.nextval,?,?,?,?,?,0,?,?,?,?)";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getPasswd());
			java.util.Date date=new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5, sdf.format(date));
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getIp());
			ps.setInt(8,  dto.getRe_step());
			ps.setInt(9,  dto.getRe_level());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public BoardDTO getBoard(String cmd, int num) throws SQLException{
		if (cmd.equals("content")) {
			readCountPlus(num);
		}
		String sql="select * from jsp_board where num=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			ArrayList<BoardDTO> list = makeArrayList(rs);
			return list.get(0);
		}finally {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public void readCountPlus(int num) throws SQLException{
		String sql="update jsp_board set readcount=readcount+1 where num=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			int res=ps.executeUpdate();
		}finally {
			if (ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
	public int deleteBoard(int num, String passwd) throws SQLException{
		String sql="select passwd from jsp_board where num=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			rs.next();
			int res=0;
			String dbPass=rs.getString(1);
			if(dbPass.equals(passwd)) {
				sql="delete from jsp_board where num=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, num);
				res=ps.executeUpdate();
			}
			return res;
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
		//String sql = "delete from jsp_board where num=?, passwd=?"; �׳� �̷��� �ѹ��� �˻��ص� ���ٵ�.
	}
	
	public int updateBoard(BoardDTO dto) throws SQLException{
		String sql="select passwd from jsp_board where num=?";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			rs=ps.executeQuery();
			rs.next();
			int res=0;
			String dbPass=rs.getString(1);
			if(dbPass.equals(dto.getPasswd())) {
				sql="update jsp_board set writer=?, subject=?, email=?, content=?, ip=? where num=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getWriter());
				ps.setString(2, dto.getSubject());
				ps.setString(3, dto.getEmail());
				ps.setString(4, dto.getContent());
				ps.setString(5, dto.getIp());
				ps.setInt(6, dto.getNum());
				res=ps.executeUpdate();
			}
			return res;
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
		//String sql="update jsp_board set writer=?, subject=?, email=?, content=?, ip=? where num=?, passwd=?; ���ٷε� ���� ����
	}
	
	public int getCount() throws SQLException{
		String sql="select count(*) from jsp_board";
		try {
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if(conn!=null) conn.close();
		}
	}
	
}
