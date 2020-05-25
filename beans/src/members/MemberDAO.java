package members;

import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	//DAO - ����. �����ͺ��̽��� ���� ���� �߰��ϰų� ����, ���� �� ��ɿ� ���� �������� ���� ������ Ŭ����
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public MemberDAO() {  //������
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
		//�ڹٿ����� ������. ����ó�� �ʿ�	
	}
	//MemberDAO ��ü�� ����� �� ��ü�� �����ͺ��̽��� ����Ǿ��ִ� ��ü��. ���� ��ũ��Ʋ������ �����ͺ��̽��� �����ϴ� ������ �ۼ� ���ϰ� �׳� �� Ŭ���� �ν��Ͻ� ����⸸ �ص� ��. import���Ѽ� ��ũ��Ʋ���� ���� ����� useBean�±׸� ����..
	
	
	//�����ͺ��̽��� ���̺� ���� �̾ƿ��� �ʹ�!! �������� ���̺��� �̾ƿ��µ� ResultSet Ŭ���� �ڷ����� ����߾���.
	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";  
		
		//�����ͺ��̽��� ���� �̾ƿðǵ� �װ� �ܼ��� ResultSet���� ��ü�� ��Ƶ� ���� �ƴ� �츮�� ������ ������� DTO�� �̿��� ���̴�.
		
		
		ArrayList<MemberDTO> memberList = new ArrayList<>();  //������� ������ �������� �𸣴ϱ� ���� �ҷ��ͼ� DTOŸ�� �ܼ� �迭�� ������ �� ����. ���� �ҷ����� �����Ͱ� ��ģ�ٸ� ������ �� ��. ���� List���
		//db�� ��� ������ ������ memberDTO ���׸� ����Ʈ. �� ����Ʈ�� �� �ε����� MemberDTO Ŭ����Ÿ�� �ϳ��ϳ��� ����ִ�. 
		
		//���̺��� �ϳ��� ���� ResultSet�� �־ �ϳ��� �����̱⵵ ������, �ϳ��� DTO�̱⵵ �ϴ�.
		
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
			} //�Ǵ� memberList[0].setId(rs.getString(1)); �� ���� �ۼ��� ���� ������. ������ �� ���� �ѵ� �ε����� �����ϴ°� ����
			//memberList[0].id = rs.getString(1); �� id�� private�� �Ұ����� ����� �Ͱ���
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		return memberList;
	}
	
	//DTO �̵� DAO�� �����ͺ��̽��� Ư�� ���̺� ��������� �� ������ �ϳ�. ��. ������ Ŭ������ ������� �ֱ� �ϰڴٸ�..
	
}
