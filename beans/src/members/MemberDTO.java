package members;

public class MemberDTO {   //���� �����ͺ��̽� �� Member ���̺��� �� ���� �� Ŭ������ �̿��Ͽ� �ٷ� ���̴�. 
	
	private String id;
	private String pwd;
	private String name;
	private String addr;
	private String tel;
	//private�� ��������� getter setter�� ������. private�� ����? ���� ���� ������ ���� ������ ������ ���� ����.
	
	public String getId(){
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getName() {
		return name;
	}
	public String getAddr() {
		return addr;
	}
	public String getTel() {
		return tel;
	}
	
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	//�̷��� DTO�� �ܼ��� �� ���� ������ ���� �� �ִ� �ٱ��Ϸμ��� ����� �ȴ�. �����ͺ��̽��� ���� ���� �ڿ��� ���� ���� ���������� �����ϴ� ���� �ƴ� getter�� ���� �����ϸ� ���� ���� ������ setter�� �̿��Ѵ�.
	//�Ƹ� �����͸� ������ �ڿ��� DAO�� ���� �ٽ� �����ͺ��̽��� �����ϴ� ������ ���� �� ���̴�.
}
