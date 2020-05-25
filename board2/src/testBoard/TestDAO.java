package testBoard;

import java.sql.*;
import java.util.ArrayList; //��� ArrayList�Ⱦ��� ResultSet���� jsp���ϱ��� ������ �ᵵ �� �� ���� �ѵ�.. ��. �� ���� ArrayList�� ���°ɱ�.. ������ �ٲ� �� �ֳ�? Set�̶�?.. �ƴϸ� iterator()�� ���ٴ���..
//���� �� ���̺� ���� ��� �� ���� ResultSet���� ��ȯ�޾Ҵٰ� �Ѵٸ�.. �װ� �׳� �״�� ������ ���� ���� �Ǵ°� �ƴѰ�? �޼ҵ� ��ȯ���� ResultSet���� ��������� jsp���Ͽ��� �ٸ� ResultSet������������ �޾��ְ� �״�� ���� �Ǵ°� �ƴѰ�
//���� DTO���� �ϳ��� �ϳ��� ��� �� ������ �� ArrayList<DTO> ���ٰ� add�� ���ش����� ��ȯ���ִ� ������ �ֳ�? ��, ResultSet�� �ٷ� ArrayList�� ������� ����?

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
		//String sql = "select * from paging order by num desc";   //������� ������ �������� �𸣴ϱ� �迭�� �ҷ��� �� ����. List���
		String sql = "select * from (select rownum rn, A.* from (select * from paging order by num desc)A) where rn between ? and ?";
		//select rownum �� rn�̶�� �������� ���ڴ�.
		//select * from paging order by num desc�� A��� �������� ���ڴ�.
		
		//���� ���� sql���� ���� ���̺� ���ؼ� ���� �����ϴµ� numĮ���� ���ؼ� ū ������ ���������� ����ǵ��� �����ϰ� �� ��簪�� �̾ƿ��µ� �ٸ� ���� ���ϴ� �ప�� �̾ƿ��ڴٴ� ������ �ȴ�.
		//�׳� ���� ���� select * from paging order by num desc where rownum ? and ? �� ��������?
		
		ArrayList<TestDTO> list = new ArrayList<>();
		//db�� ������ ������ TestDTO ���׸� ����Ʈ

		
		//order by num desc �� �߰������� ���� �����͸� ResultSet���� �ҷ��� �� �ǵ������ �� ���ʿ� �ִµ�.
		//�� ������ select������ ���� �ҷ������� �ϸ� primary key�� num���� ���ؼ� ���� ���ں��� ū ���ڼ����� ���� �������µ� order by num desc -> numĮ���� ���� ���ĵ�? 
		//numĮ�� ���� ���� ������ �ݴ�� �ǰ� �� ������ �ప�� �� �������� �Ǵ� ��. �� ������ �ݴ�� ���� ���شٰ� �����ϴ°� ����� ��
		
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
				//rs.get() �޼ҵ忡�� ���ڷ� ���� �����ϴϱ� ����� �ȵ�.. �� �Ϲ����� sql�������� �۵��ϴµ� �̻��ϰ� �� rownum�� �� sql������ �־�� Į������ ����� ����������..
														
				
				list.add(li);
			} //�Ǵ� list[0].setId(rs.getString(1)); �� ���� �ۼ��� ���� ������. ������ �� ���� �ѵ� �ε����� �����ϴ°� ����
			//list[0].id = rs.getString(1); �� id�� private�� �Ұ����� ����� �Ͱ���
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	//�Խñ�(����)�߰� �޼ҵ�
	public void insert(TestDTO dto) throws SQLException {
		String sql="insert into paging values(test_num.nextval,?,sysdate,0)";  //test_num�� 0���� �Ǿ��ִ�. �������� ������� .nextval
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.executeUpdate();
	}
	//��� �ٵ� ����ڿ��Լ� �޾ƿ� ���� Title���ۿ� ��� ����ڰ� input�±׷� �Ѱ��� ���� ���� DTO�� �� ���� �ʿ�� ����.. �ٷ� String������ ��Ƽ� ������ �ڿ� �ٷ� �ᵵ �Ǳ� ��
	//�ٸ� �Խù��� � ������ ��������� �޾ƾ��Ѵٰų� ���� �ٸ� ������� ������� DTO�� ���°� ������
	
	//sysdata�� �Ƹ� �����ͺ��̽��� �ð��� ����ϰ� ���� ������ �Ѵ�.
	
	//nextval - nextvalue
	//currval - currentvalue
	
	//sequence��ȣ�� ���̺� �ִ� ���� ������ �ڵ����� �����ִ� ��ɾ�?��� ���� �ȴ�.
	//���ó� ���߿� �Խñ��� �����ǰų� �ϴ� ��� num���� sequence�� �ο��ϴµ��� ������ �߻��� �� ������ �� ������ num�� ���� ����ؾ���
	
	
	//��Ȯ�� �����ڸ� ���� ������ �ڵ����� �����شٱ⺸�ٴ�, ���� �����ϴ� ������ Į��?���� �Ŷ�� �����ϴ� �� ����.
	//�������� �߰��ɼǵ��� �� ������.. ���۰��� �⺻������ 1�̶�� �� ������.. �׷��� ������ test_num.nextval�� 1�� ������ �ڿ� 1�� ������Ű�°���
	//�ƴϸ� 0���� �����ϴ°Ŷ� �� �������� 1�� �������� ����..
	//�Ǵ� �׳� �������� ���̺�� �����ϰ� �Ǹ鼭 .nextval�� ���� ���� ó������ �׳� 1�� �������� �Ǵ� �� ����. 0���� �����Ѵٱ⺸�ٴ� null���� 1�� �����Ѵٴ� ����?
	
	
	//�������� ����Ŵ�� ����� �ϳ��� �����ͺ��̽����� ���̺��� ���������� �ϳ��� ���������� �����ϰ� �ǹǷ� ���̺��� �������� ���� ������ �� ��
	//�ƴϸ� ���������� ���̺�� ������Ű�� �Ǹ� �ش� ���̺��� �� �� �ְ� �Ǵ°Ű��⵵.(�ͼ�?)
	
	//�׸��� �������� ���� ������ ���ִ°� �ƴѰŰ����� �׷��� ���� �������� �Ű��� ���� �ʾƵ� �ɵ�. ���� �����ǵ縻�� ���������� �����ϴϱ� �ѹ� ���� ���� �Ⱦ��ϰŰ� �׷��� num���� �ߺ��� ���� ����.
	
	//�׷��� �׷��� ��� �� �������� ��°����� ��� �������������? ����� ����ؼ�? �ƿ� ��ü �Խñ۰����� ���� ������ ���ε־߰ڴµ�? ->�׳� rownum���� ~�࿡�� ~����� ������ �ּ��� �ϸ� �˾Ƽ� ������ ��. �����Ȱ� �ִٸ� �����Ȱ� ����
	
	//�������� ���̺���� ���������� ����ǰ� �����ȴ�. ���� �ϳ��� �������� ���� ���̺��� ��밡�� -> �׷��� �ϳ��� �������� 
	//���δٸ� ���� ���̺����� ���� �� ���� ������ �� �ִٴ� �ǰ�
	
	//�߰��ɼǿ��� ���۰�, ������, �ִ� �� �ּҰ�, ����Ŭ����, cache �޸� ���� �� �뷮���� ���� �ִ�.
	
	
	
	//��ȸ�� �����޼ҵ�
	public void count(String num) throws SQLException {
		String sql = "update paging set count=count+1 where num=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(num));
		ps.executeQuery();   //executeUpdate()�� ������ �� �Ű�����.. executeQuery()�� ���� ��ȯ���ִ°� ��������?
		
	}
	
	
	//��ü �హ�� ��ȯ�޼ҵ�
	public int getTotalPage() throws SQLException {
		String sql = "select count (*) from paging";
		int totPage=0;
		ps = con.prepareStatement(sql);
		rs=ps.executeQuery();             //executeUpdate()�δ� ���ϳ�?
		rs.next();
		totPage= rs.getInt(1);
		return totPage;
	}
	
	
	
}
