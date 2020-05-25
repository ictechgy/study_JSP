package home.book;

public class BookDTO {
	//1. DB�� �� �ʵ尪�� ��������� �����. (DB table�� �ʵ尪�� ����ʵ�� �����)
	private String name;
	private String writer;
	private String publisher;
	private int price;
	private String joindate;
	
	//2. �����ڸ� �����.(default������) - ��������
	public BookDTO(){}

	//3. getter, setter �޼ҵ带 �����.
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	
	
	
}
