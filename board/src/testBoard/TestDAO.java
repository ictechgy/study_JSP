package testBoard;

import java.sql.*;
import java.util.ArrayList;

public class TestDAO {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public TestDAO() {  
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
	
	}
	
	
	public ArrayList<TestDTO> listView() {
		String sql = "select * from paging order by num desc";   //결과값이 몇행이 나올지를 모르니까 배열로 불러올 수 없음. List사용
		ArrayList<TestDTO> list = new ArrayList<>();
		//db의 모든 내용을 저장할 TestDTO 제네릭 리스트

		
		//order by num desc 를 추가적으로 쓰면 데이터를 ResultSet으로 불러올 때 맨뒤행부터 맨 앞쪽에 넣는듯.
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TestDTO li = new TestDTO();
				li.setNum(rs.getInt(1));
				li.setTitle(rs.getString(2));
				li.setPdate(rs.getString(3));
				li.setCount(rs.getInt(4));
				
				list.add(li);
			} //또는 list[0].setNum(rs.getString(1)); 과 같이 작성할 수는 없을까. 가능할 것 같긴 한데 인덱스값 변경하는게 관건
			//list[0].num = rs.getString(1); 은 멤버변수가 private라서 불가능한 방식일 것같음
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	
	
	
	
	
	public void insert(TestDTO dto) throws SQLException {
		String sql="insert into paging values(test_num.nextval,?,sysdate,0)";  //test_num은 0부터 되어있다. 다음값을 얻어오라는 .nextval
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.executeUpdate();
	}
	
	//nextval - nextvalue
	//currval - currentvalue
	
	//sequence번호는 테이블에 있는 행의 갯수를 자동으로 세어주는 명령어?라고 보면 된다.
	//역시나 도중에 게시글이 삭제되거나 하는 경우 num값을 sequence로 부여하는데에 문제가 발생할 수 있으니 이 때에는 num을 따로 운용해야함
	
	
	//정확히 말하자면 행의 갯수를 자동으로 세어준다기보다는, 값이 증가하는 유일한 칼럼?같은 거라고 봐야하는 것 같다.
	//여러가지 추가옵션들이 더 있으며.. 시작값이 기본적으로 1이라는 것 같은데.. 그러면 위에서 test_num.nextval은 1을 가져온 뒤에 1을 증가시키는건지
	//아니면 0부터 시작하는거라 그 다음값인 1을 가져오는 건지..
	//또는 그냥 시퀀스를 테이블과 연동하게 되면서 가장 처음에는 그냥 1을 가져오게 되는 것 같다. 0부터 시작한다기보다는.. null같은 상태였다가 테이블에서 .nextval쓰면 1부터 가져오고 그때부터 currval도 쓸 수 있게 될 것 같은데?
	//무튼 처음에는 1부터 불러오려면 nextval 한번은 해야하는 듯?
	
	
	//선생님이 만드신대로 만들면 하나의 데이터베이스에서 테이블이 여러개여도 하나의 시퀀스만을 공유하게 되므로 테이블별로 시퀀스를 따로 만들어야 할 듯
	//아니면 시퀀스마다 테이블로 연동시키게 되면 해당 테이블에만 쓸 수 있게 되는거같기도.
	
	//그리고 시퀀스가 행의 갯수를 세주는게 아닌거같은데 그러면 값의 삭제에는 신경을 쓰지 않아도 될듯. 행이 삭제되든말든 시퀀스값은 고유하니까 num값을 그대로 지속 부여하는데에는 문제없다.
	//그냥 시퀀스 안쓰고 글 등록될 때마다 num+1해도 될 것 같긴 하지만
	
	//그러면 그러한 경우 한 페이지당 출력갯수는 어떻게 조절해줘야하지? 삭제등에 대비해서? 아예 전체 게시글갯수에 대한 변수를 따로둬야겠는데?
	
	//시퀀스는 테이블과는 독립적으로 저장되고 생성된다. 따라서 하나의 시퀀스를 여러 테이블에서 사용가능 -> 그러면 하나의 시퀀스도 
	//서로다른 여러 테이블에서는 각자 다 따로 구동될 수 있다는 건가
	
	//추가옵션에는 시작값, 증감값, 최대 및 최소값, 싸이클여부(일정 수 도달시 첫값부터 시작하는지), cache 메모리 상주 및 상주용량제어 등이 있다.
	
	
	
	public void count(String num) throws SQLException {
		String sql = "update paging set count=count+1 where num=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(num));
		ps.executeQuery();  //executeUpdate()여도 될 듯?
		
	}
	
	
	
	
	
	public int getTotalPage() throws SQLException {
		String sql = "select count (*) from paging";
		int totPage=0;  //아무것도 없는 경우에도 반환은 해줘야하니 미리 0으로 셋팅
		ps = con.prepareStatement(sql);
		rs=ps.executeQuery();             //executeUpdate()로는 못하나? Update메소드는 실행 결과에 따른 영향받은 행의 갯수를 반환하는 걸로 알고 있는데..
		rs.next();  //아무래도 행의 갯수를 반환하는것에 있어서 ResultSet형태로서 하나의 공간만 차지하는 상태로 rs에 반환되는 듯
		totPage= rs.getInt(1);
		return totPage;  //전체 행 갯수 반환
	}
	
	
	
}
