package home.book;
import java.sql.*;
import java.util.ArrayList;

public class BookDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public BookDAO() { //생성자를 public으로 안만들면 다른 폴더에서 쓰지 못한다.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {}
		url="jdbc:oracle:thin:@127.0.0.1:1521:xe";	
		user="kgitbank";
		pass="kgitbank";
	} 
	
	public ArrayList<BookDTO> listBook() throws SQLException{
		String sql="select * from book";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> listBook = makeArrayList(rs);
			return listBook;
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	protected ArrayList<BookDTO> makeArrayList(ResultSet rs) throws SQLException{
		ArrayList<BookDTO> listBook = new ArrayList<BookDTO>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setName(rs.getString(1));
			dto.setWriter(rs.getString(2));
			dto.setPublisher(rs.getString(3));
			dto.setPrice(rs.getInt(4));
			dto.setJoindate(rs.getString(5));
			listBook.add(dto);
		}
		return listBook;
	}
	
	
	public int insertBook(String name, String writer, String publisher, int price) throws SQLException{
		String sql="insert into book values(?,?,?,?,sysdate)";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2,writer);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public ArrayList<BookDTO> findBook(String search, String searchString) throws SQLException{
		String sql="select * from book where"+search+"=?";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, searchString);
			rs=ps.executeQuery();
			ArrayList<BookDTO> findBook = makeArrayList(rs);
			return findBook;
		}finally {
			if (rs!=null) rs.close();
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public int deleteBook(String name) throws SQLException{
		String sql="delete from book where name=?";
		try {
			conn=DriverManager.getConnection(url, user, pass);
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			int res=ps.executeUpdate();
			return res;
		}finally {
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}
	}
	
	public int insertBook(BookDTO dto) throws SQLException{
		int res = insertBook(dto.getName(), dto.getWriter(), dto.getPublisher(), dto.getPrice());
		return res;
	}
	
}
