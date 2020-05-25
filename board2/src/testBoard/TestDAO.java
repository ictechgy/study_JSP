package testBoard;

import java.sql.*;
import java.util.ArrayList; //사실 ArrayList안쓰고 ResultSet으로 jsp파일까지 끌고가서 써도 될 것 같긴 한데.. 흠. 왜 굳이 ArrayList를 쓰는걸까.. 순서가 바뀔 수 있나? Set이라서?.. 아니면 iterator()를 쓴다던지..
//예를 들어서 데이블에 대한 모든 행 값을 ResultSet으로 반환받았다고 한다면.. 그걸 그냥 그대로 가지고 가서 쓰면 되는거 아닌가? 메소드 반환형도 ResultSet으로 만든다음에 jsp파일에서 다른 ResultSet참조형변수로 받아주고 그대로 쓰면 되는거 아닌감
//굳이 DTO변수 하나에 하나씩 담고 그 담은걸 또 ArrayList<DTO> 에다가 add다 해준다음에 반환해주는 이유가 있나? 또, ResultSet을 바로 ArrayList로 만들수는 없나?

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
	
	
	public ArrayList<TestDTO> listView(int start, int end) {
		//String sql = "select * from paging order by num desc";   //결과값이 몇행이 나올지를 모르니까 배열로 불러올 수 없음. List사용
		String sql = "select * from (select rownum rn, A.* from (select * from paging order by num desc)A) where rn between ? and ?";
		//select rownum 을 rn이라는 별명으로 쓰겠다.
		//select * from paging order by num desc를 A라는 별명으로 쓰겠다.
		
		//따라서 위의 sql문은 먼저 테이블에 대해서 행을 정렬하는데 num칼럼에 대해서 큰 값부터 작은값으로 진행되도록 정리하고 그 모든값을 뽑아오는데 다만 내가 원하는 행값만 뽑아오겠다는 구문이 된다.
		//그냥 쉽게 보면 select * from paging order by num desc where rownum ? and ? 뭐 이정도쯤?
		
		ArrayList<TestDTO> list = new ArrayList<>();
		//db의 내용을 저장할 TestDTO 제네릭 리스트

		
		//order by num desc 를 추가적으로 쓰면 데이터를 ResultSet으로 불러올 때 맨뒤행부터 맨 앞쪽에 넣는듯.
		//즉 원래는 select문으로 값을 불러오려고 하면 primary key인 num값에 대해서 작은 숫자부터 큰 숫자순서로 값을 가져오는데 order by num desc -> num칼럼에 대해 정렬된? 
		//num칼럼 값에 의해 정렬이 반대로 되고 그 상태의 행값을 쭉 가져오게 되는 듯. 즉 정렬을 반대로 먼저 해준다고 생각하는게 깔끔한 듯
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
		
			rs = ps.executeQuery();

			while(rs.next()) {
				TestDTO li = new TestDTO();
				li.setNum(rs.getInt("num"));
				li.setTitle(rs.getString("title"));
				li.setPdate(rs.getString("pdate"));
				li.setCount(rs.getInt("count"));        
				//rs.get() 메소드에서 숫자로 값을 지정하니까 제대로 안됨.. 즉 일반적인 sql문에서는 작동하는데 이상하게 이 rownum들어간 저 sql구문에 있어서는 칼럼값을 제대로 못가져오네..
														
				
				list.add(li);
			} //또는 list[0].setId(rs.getString(1)); 과 같이 작성할 수는 없을까. 가능할 것 같긴 한데 인덱스값 변경하는게 관건
			//list[0].id = rs.getString(1); 은 id가 private라서 불가능한 방식일 것같음
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	//게시글(제목)추가 메소드
	public void insert(TestDTO dto) throws SQLException {
		String sql="insert into paging values(test_num.nextval,?,sysdate,0)";  //test_num은 0부터 되어있다. 다음값을 얻어오라는 .nextval
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.executeUpdate();
	}
	//사실 근데 사용자에게서 받아올 값은 Title값밖에 없어서 사용자가 input태그로 넘겨준 값을 굳이 DTO에 꼭 담을 필요는 없다.. 바로 String변수에 담아서 가져온 뒤에 바로 써도 되긴 함
	//다만 게시물의 어떤 실질적 내용까지도 받아야한다거나 여러 다른 내용들이 많을경우 DTO를 쓰는게 낫겠지
	
	//sysdata는 아마 데이터베이스쪽 시간을 등록하게 되지 않을까 한다.
	
	//nextval - nextvalue
	//currval - currentvalue
	
	//sequence번호는 테이블에 있는 행의 갯수를 자동으로 세어주는 명령어?라고 보면 된다.
	//역시나 도중에 게시글이 삭제되거나 하는 경우 num값을 sequence로 부여하는데에 문제가 발생할 수 있으니 이 때에는 num을 따로 운용해야함
	
	
	//정확히 말하자면 행의 갯수를 자동으로 세어준다기보다는, 값이 증가하는 유일한 칼럼?같은 거라고 봐야하는 것 같다.
	//여러가지 추가옵션들이 더 있으며.. 시작값이 기본적으로 1이라는 것 같은데.. 그러면 위에서 test_num.nextval은 1을 가져온 뒤에 1을 증가시키는건지
	//아니면 0부터 시작하는거라 그 다음값인 1을 가져오는 건지..
	//또는 그냥 시퀀스를 테이블과 연동하게 되면서 .nextval을 쓰면 가장 처음에는 그냥 1을 가져오게 되는 것 같다. 0부터 시작한다기보다는 null에서 1로 시작한다는 느낌?
	
	
	//선생님이 만드신대로 만들면 하나의 데이터베이스에서 테이블이 여러개여도 하나의 시퀀스만을 공유하게 되므로 테이블별로 시퀀스를 따로 만들어야 할 듯
	//아니면 시퀀스마다 테이블로 연동시키게 되면 해당 테이블에만 쓸 수 있게 되는거같기도.(귀속?)
	
	//그리고 시퀀스가 행의 갯수를 세주는게 아닌거같은데 그러면 값의 삭제에는 신경을 쓰지 않아도 될듯. 행이 삭제되든말든 시퀀스값은 고유하니까 한번 쓰인 값은 안쓰일거고 그러면 num값은 중복될 일이 없다.
	
	//그러면 그러한 경우 한 페이지당 출력갯수는 어떻게 조절해줘야하지? 삭제등에 대비해서? 아예 전체 게시글갯수에 대한 변수를 따로둬야겠는데? ->그냥 rownum으로 ~행에서 ~행까지 가져다 주세요 하면 알아서 가져다 줌. 삭제된게 있다면 삭제된건 빼고
	
	//시퀀스는 테이블과는 독립적으로 저장되고 생성된다. 따라서 하나의 시퀀스를 여러 테이블에서 사용가능 -> 그러면 하나의 시퀀스도 
	//서로다른 여러 테이블에서는 각자 다 따로 구동될 수 있다는 건가
	
	//추가옵션에는 시작값, 증감값, 최대 및 최소값, 싸이클여부, cache 메모리 상주 및 용량제어 등이 있다.
	
	
	
	//조회수 증가메소드
	public void count(String num) throws SQLException {
		String sql = "update paging set count=count+1 where num=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(num));
		ps.executeQuery();   //executeUpdate()를 보통은 쓸 거같은데.. executeQuery()를 쓰면 반환해주는게 있으려나?
		
	}
	
	
	//전체 행갯수 반환메소드
	public int getTotalPage() throws SQLException {
		String sql = "select count (*) from paging";
		int totPage=0;
		ps = con.prepareStatement(sql);
		rs=ps.executeQuery();             //executeUpdate()로는 못하나?
		rs.next();
		totPage= rs.getInt(1);
		return totPage;
	}
	
	
	
}
