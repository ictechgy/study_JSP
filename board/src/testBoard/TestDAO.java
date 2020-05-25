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
		String sql = "select * from paging order by num desc";   //������� ������ �������� �𸣴ϱ� �迭�� �ҷ��� �� ����. List���
		ArrayList<TestDTO> list = new ArrayList<>();
		//db�� ��� ������ ������ TestDTO ���׸� ����Ʈ

		
		//order by num desc �� �߰������� ���� �����͸� ResultSet���� �ҷ��� �� �ǵ������ �� ���ʿ� �ִµ�.
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
			} //�Ǵ� list[0].setNum(rs.getString(1)); �� ���� �ۼ��� ���� ������. ������ �� ���� �ѵ� �ε����� �����ϴ°� ����
			//list[0].num = rs.getString(1); �� ��������� private�� �Ұ����� ����� �Ͱ���
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	
	
	
	
	
	
	
	public void insert(TestDTO dto) throws SQLException {
		String sql="insert into paging values(test_num.nextval,?,sysdate,0)";  //test_num�� 0���� �Ǿ��ִ�. �������� ������� .nextval
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.executeUpdate();
	}
	
	//nextval - nextvalue
	//currval - currentvalue
	
	//sequence��ȣ�� ���̺� �ִ� ���� ������ �ڵ����� �����ִ� ��ɾ�?��� ���� �ȴ�.
	//���ó� ���߿� �Խñ��� �����ǰų� �ϴ� ��� num���� sequence�� �ο��ϴµ��� ������ �߻��� �� ������ �� ������ num�� ���� ����ؾ���
	
	
	//��Ȯ�� �����ڸ� ���� ������ �ڵ����� �����شٱ⺸�ٴ�, ���� �����ϴ� ������ Į��?���� �Ŷ�� �����ϴ� �� ����.
	//�������� �߰��ɼǵ��� �� ������.. ���۰��� �⺻������ 1�̶�� �� ������.. �׷��� ������ test_num.nextval�� 1�� ������ �ڿ� 1�� ������Ű�°���
	//�ƴϸ� 0���� �����ϴ°Ŷ� �� �������� 1�� �������� ����..
	//�Ǵ� �׳� �������� ���̺�� �����ϰ� �Ǹ鼭 ���� ó������ �׳� 1�� �������� �Ǵ� �� ����. 0���� �����Ѵٱ⺸�ٴ�.. null���� ���¿��ٰ� ���̺��� .nextval���� 1���� �������� �׶����� currval�� �� �� �ְ� �� �� ������?
	//��ư ó������ 1���� �ҷ������� nextval �ѹ��� �ؾ��ϴ� ��?
	
	
	//�������� ����Ŵ�� ����� �ϳ��� �����ͺ��̽����� ���̺��� ���������� �ϳ��� ���������� �����ϰ� �ǹǷ� ���̺��� �������� ���� ������ �� ��
	//�ƴϸ� ���������� ���̺�� ������Ű�� �Ǹ� �ش� ���̺��� �� �� �ְ� �Ǵ°Ű��⵵.
	
	//�׸��� �������� ���� ������ ���ִ°� �ƴѰŰ����� �׷��� ���� �������� �Ű��� ���� �ʾƵ� �ɵ�. ���� �����ǵ縻�� ���������� �����ϴϱ� num���� �״�� ���� �ο��ϴµ����� ��������.
	//�׳� ������ �Ⱦ��� �� ��ϵ� ������ num+1�ص� �� �� ���� ������
	
	//�׷��� �׷��� ��� �� �������� ��°����� ��� �������������? ����� ����ؼ�? �ƿ� ��ü �Խñ۰����� ���� ������ ���ε־߰ڴµ�?
	
	//�������� ���̺���� ���������� ����ǰ� �����ȴ�. ���� �ϳ��� �������� ���� ���̺��� ��밡�� -> �׷��� �ϳ��� �������� 
	//���δٸ� ���� ���̺����� ���� �� ���� ������ �� �ִٴ� �ǰ�
	
	//�߰��ɼǿ��� ���۰�, ������, �ִ� �� �ּҰ�, ����Ŭ����(���� �� ���޽� ù������ �����ϴ���), cache �޸� ���� �� ���ֿ뷮���� ���� �ִ�.
	
	
	
	public void count(String num) throws SQLException {
		String sql = "update paging set count=count+1 where num=?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(num));
		ps.executeQuery();  //executeUpdate()���� �� ��?
		
	}
	
	
	
	
	
	public int getTotalPage() throws SQLException {
		String sql = "select count (*) from paging";
		int totPage=0;  //�ƹ��͵� ���� ��쿡�� ��ȯ�� ������ϴ� �̸� 0���� ����
		ps = con.prepareStatement(sql);
		rs=ps.executeQuery();             //executeUpdate()�δ� ���ϳ�? Update�޼ҵ�� ���� ����� ���� ������� ���� ������ ��ȯ�ϴ� �ɷ� �˰� �ִµ�..
		rs.next();  //�ƹ����� ���� ������ ��ȯ�ϴ°Ϳ� �־ ResultSet���·μ� �ϳ��� ������ �����ϴ� ���·� rs�� ��ȯ�Ǵ� ��
		totPage= rs.getInt(1);
		return totPage;  //��ü �� ���� ��ȯ
	}
	
	
	
}
