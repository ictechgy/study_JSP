package testBoard;

public class TestDTO {
	
	private int num;
	private String title;
	private String pdate;
	private int count;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	//이거 말고 멤버변수나 메소드같은거 더 추가하면 안되나? 꼭 데이터베이스의 칼럼쪽과 완벽하게 일치해야만 하는가 하는 궁금증
	//접근지정자를 private로만 하도록 둔 이유라던지..(멤버변수).. 메소드는 꼭 public일 필요가 있나?
}
