package members;

import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	//DAO - 로직. 데이터베이스에 대해 값을 추가하거나 삭제, 수정 등 명령에 대해 전반적인 것을 수행할 클래스
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public MemberDAO() {  //생성자
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="jsp001";
		String password = "1234";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//자바에서는 빡빡함. 예외처리 필요	
	}
	//MemberDAO 객체를 만들면 그 객체는 데이터베이스와 연결되어있는 객체임. 이제 스크립틀릿으로 데이터베이스와 연결하는 구문을 작성 안하고 그냥 이 클래스 인스턴스 만들기만 해도 됨. import시켜서 스크립틀릿을 통해 만들든 useBean태그를 쓰든..
	
	
	//데이터베이스의 테이블 값을 뽑아오고 싶다!! 기존에는 테이블값을 뽑아오는데 ResultSet 클래스 자료형을 사용했었다.
	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";  
		
		//데이터베이스의 값을 뽑아올건데 그걸 단순히 ResultSet형태 객체에 담아둘 것이 아닌 우리가 이전에 만들었던 DTO를 이용할 것이다.
		
		
		ArrayList<MemberDTO> memberList = new ArrayList<>();  //결과값이 몇행이 나올지를 모르니까 값을 불러와서 DTO타입 단순 배열에 저장할 수 없음. 만약 불러와진 데이터가 넘친다면 오류가 뜰 것. 따라서 List사용
		//db의 모든 내용을 저장할 memberDTO 제네릭 리스트. 이 리스트의 각 인덱스는 MemberDTO 클래스타입 하나하나가 들어있다. 
		
		//테이블의 하나의 행은 ResultSet에 있어서 하나의 공간이기도 하지만, 하나의 DTO이기도 하다.
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString(1));
				mb.setPwd(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setAddr(rs.getString(4));
				mb.setTel(rs.getString(5));
				memberList.add(mb);
			} //또는 memberList[0].setId(rs.getString(1)); 과 같이 작성할 수는 없을까. 가능할 것 같긴 한데 인덱스값 변경하는게 관건
			//memberList[0].id = rs.getString(1); 은 id가 private라서 불가능한 방식일 것같음
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return memberList;
	}
	
	//DTO 이든 DAO든 데이터베이스의 특정 테이블에 맞춤식으로 딱 만들어야 하네. 흠. 범용적 클래스를 만들수도 있긴 하겠다만..
	
}
