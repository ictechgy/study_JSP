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

public class BoardDAO { //강의에서는 BoardDataBean이라는 이름으로 만들었다.
	
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
	//테이블만 다를 뿐 같은 데이터베이스에 접근하는거고, MemberDAO2.java에서 커넥션풀을 생성해놨을텐데 여기서 또 생성하는 코드가 있을 필요가 있을까...
	//스프링에서는 이 부분까지 따로 뽑아놓고 그냥 커넥션 객체를 바로 가져다 쓰는 방식이었었지. (커넥션 풀 생성 코드는 한번만 작동되도록)
	//커넥션 객체생성에 있어서 getInstance()를 해서 커넥션 풀이 이미 있다면 있는 것을 쓰는 방식으로..
	
	
	public ArrayList<BoardDTO> listBoard(int startRow, int end) throws SQLException{
		//sql="select * from jsp_board order by re_step asc"; //re_step 오름차순 정렬
		String sql="select * from (select rownum rn, A.*from (select * from jsp_board order by re_step asc)A) where rn between ? and ?";
		//select * from jsp_board order by re_step asc 를 먼저 실행한다. 그리고 그렇게 나온 결과에 rownum을 붙인다. 최신글에 1번을 붙이는방식
		//그리고 그 rn값을 방식으로 startRow부터 시작해서 endRow까지 끄집어온다.
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
		if(dto.getNum()==0) { //새글 작성
			sql = "update jsp_board set re_step=re_step+1";
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			int res=ps.executeUpdate();
		}else { //답글 작성
			sql="update jsp_board set re_step=re_step+1 where re_step>?";
			conn=ds.getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getRe_step());
			int res=ps.executeUpdate();
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
		}
		//답글에 재답글을 다는 것은 상관이 없는데 답글이 달려있는 원글에서 답글달기를 눌러 답글을 다는 경우 Re_level이 1로 같아지는 문제 발생
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
		//String sql = "delete from jsp_board where num=?, passwd=?"; 그냥 이렇게 한번에 검색해도 될텐데.
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
		//String sql="update jsp_board set writer=?, subject=?, email=?, content=?, ip=? where num=?, passwd=?; 한줄로도 구현 가능
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
