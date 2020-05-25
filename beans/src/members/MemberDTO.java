package members;

public class MemberDTO {   //이제 데이터베이스 중 Member 테이블의 한 행을 이 클래스를 이용하여 다룰 것이다. 
	
	private String id;
	private String pwd;
	private String name;
	private String addr;
	private String tel;
	//private로 만들었으니 getter setter를 만들자. private인 이유? 값에 대해 허용되지 않은 직접적 접근을 막기 위해.
	
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
	
	
	//이렇게 DTO는 단순히 한 행의 정보를 담을 수 있는 바구니로서만 만들게 된다. 데이터베이스의 값을 담은 뒤에도 값에 대해 직접적으로 접근하는 것이 아닌 getter를 통해 접근하며 값에 대한 수정은 setter를 이용한다.
	//아마 데이터를 수정한 뒤에는 DAO로 값을 다시 데이터베이스에 저장하는 과정을 진행 할 것이다.
}
