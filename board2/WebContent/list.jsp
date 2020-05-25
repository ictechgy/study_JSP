<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, testBoard.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="testBoard.TestDAO"/>

이 페이지 복습은 끝냈고 이제 선생님이 만든 변수명을 조금 손본뒤에 페이지구성을 진행하고자 한다.
start라고 한건 사실 page라고 하는게 맞다. 사용자가 보고자 하는 페이지(처음접속시에는 1페이지)
그리고 TotalPage라고 했지만 사실 그건 전체 행갯수라고 보는게 맞다. TotalRow나 TotalLine쯤이 적절하려나


<%

String page_num = request.getParameter("page_num");  //사용자가 보고자 하는 페이지 번호 가져오기
if(page_num == null){  //만약 처음 접속하여 해당 인자가 null인경우 1페이지를 띄워줄 것이다.
	page_num = "1";
}
int intPnum = Integer.parseInt(page_num);   //intPnum은 page_num의 int형 (또는 currentPageNum이라고 해도 될듯. 현재 페이지 숫자를 의미)

//위와같이 할수밖에 없는 이유는 get형태로 값을 넘겨주고 받을 때 필연적으로 String이 되어버리기때문에 값을 넘겨주고 받을때에는 String을 이용하고 실질적으로 내부페이지를 구성할 때에는 int값으로 바꾸어 사용할 것이다.

//한 페이지당 3개의 게시글을 가져오도록 할 것이고 1페이지를 요구한 경우 1행부터 3행까지 가져오도록 할 것이다. 가져오는 메소드에서는 순서를 반대로 뒤집었으므로 1행~3행이 최신글이 된다. 따라서 1페이지를 구성할 때 맨 마지막 행쪽을 가져오도록 신경쓰지 않아도 된다.
//만약 그래야 했다면 공식은 더 복잡해졌을지도 모른다..
ArrayList<TestDTO> listDto = dao.listView(3*(intPnum-1)+1,3*intPnum);  
System.out.print(listDto);  //메소드를 통해 출력되는 것은 getClass()정보 및 hashCode()정보로 보인다..각 인덱스별 .toString()을 한 값이 보인다.

int totalrow = dao.getTotalPage(); %> 전체게시글갯수(행) 가져오기.  line row(행) column(열)


규칙. 1페이지를 보려는 경우 1~3행을 보게 하고 2페이지의 경우 4~6행을 보게 하려면..

totalrow = 12					- 전체 행 갯수(가정)

12  9 6 3						- 한 페이지에서 맨 위 행 num값
10  7 4 1  ->num  (+3)			- 한 페이지에서 맨아래 행 num값
 4  3 2 1  ->intPnum (+1)		- 사용자의 페이지
 1  2 3 4  ->					- 테이블 행 역순정렬에 의해 실질적으로 나오는 결과(사실 페이지를 뒤집는다기보다는 위의 행을 뒤집는 것인데)
 
 1페이지를 요구하면 1~3행을 부르게 되고 12~10번num값에 해당하는 줄이 나오는 그런.. order by num desc
 1  4  7  10    - 실질적 행번호
 3  6  9  12
 1  2  3  4		- 페이지 넘버
 
 
 사용자의 페이지에 따른 맨 아래 행 num값 도출
 intPnum * 2 - 1	-> 1페이지일 때 맨 아래행 num은 1
 intPnum * 2		-> 2페이지일 때 맨 아래행 num은 4
 intPnum * 2 + 1
 intPnum * 2 + 2
 
 3*(intPnum-1)+1  또는 intPnum*3-2  - 페이지당 요구되어야 할 첫번째 행
 3*intPnum						  - 페이지당 요구되어야 할 마지막 행
 
 
 rownum은 order by num desc에 의해 거꾸로 정렬뒤에 행번호를 세므로 1페이지 요구시 최신글부터 보여지게 된다. 1페이지 요구시 1행~ 3행을 요구하고 그 행은 최신글에 해당하는 행으로 되어
 있다. 기본적으로 원래는 1~3행은 가장 오래된 글이겠지만..(order by num desc 가 먼저 작동해서인듯?)
 그것도 그런데 맨 마지막 페이지를 요구한 경우.. 만약 내가 원하는 배수로 숫자가 안떨어진다면 마지막 행을 요구할 때 에러가 뜰 수도 있겠다. 예를들어 4페이지에 다다라서 10행 ~ 12행을 요구했는데 12행이 존재하지 않는다면 오류가 뜨는가?
 더군다나 이렇게 만들면 글이 내가 원하는 배수로 안떨어지는 경우 맨 마지막 페이지쪽이 게시글이 한두개만 보이게 되는 상태가 될 것 같다.(가장 오래된 글이 존재하는 페이지쪽에..)
 그렇다면 내가 원하는 배수로 안떨어질 때 최신글쪽만 한두개만 보이게 하려면?
 
 나처럼 그냥 해도 되긴 하네?? 글 갯수가 딱 안떨어지면 맨 마지막페이지쪽이 게시글목록이 적게 뜨긴 하는데    -> 존재하지 않는 행까지 요구하면 가장 마지막까지만 가져오게 되는 듯
 보통은 최신글쪽이 글이 적게떠야하나 마지막쪽이 적게 뜨게 해야하나?   -> 보통은 마지막쪽이 적게 뜨는게 맞는듯 
 

 결국 웹사이트들에서 게시글목록을 보는건 여러개의 jsp파일을 보는게 아니라 하나의 jsp파일이지만 데이터베이스에서 불러오는 값이 달라지는 것 뿐이구나
 
 
 
 
 <%
 //전체 페이지 구성갯수 만들기. 한 페이지당 3개의 게시글씩을 보여줄 것
 int totalPage = totalrow/3;
 if (totalrow % 3 != 0){
	 totalPage+=1;
 }
 %>
 
 
<table border='1'>
<tr><th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th></tr>
<%
	for(TestDTO dto:listDto){ %>
	<tr>
		<td><%=dto.getNum() %></td><td><a href="count.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
		<td><%=dto.getPdate() %></td><td><%=dto.getCount() %></td>
	</tr>
	
		<%}if (listDto.size()==0) {   //또는 dto.size같은걸로는 못하나.. 지역변수라서 어렵나. for each문 내에 넣어서 만들면?
			out.print("<tr><th colspan='4'>등록된 정보가 없습니다</th></tr>");
		}%>
	
	<tr>
		<td colspan='4' align='right'>
		
			<%
				if(intPnum != 1){
			%>
			<button type='button' onclick="location.href='list.jsp?page_num=<%=intPnum-1%>'">이전</button>
			<%}else{ %>
			<button type='button' disabled>이전</button>
			<%} %>
			
			<%for (int i = 1; i<=totalPage; i++){ %>
				<a href="list.jsp?page_num=<%=i%>"><%=i %></a>    <!-- 불필요한 따옴표가 추가적으로 들어가거나 없으면 오류가 생김..  -->
			
			<%} %>
			
			[<%=intPnum %>/<%=totalPage %>]
			
			<%
				if(intPnum < totalPage){
			%>
			<button type='button' onclick="location.href='list.jsp?page_num=<%=intPnum+1%>'">다음</button>
			<%}else{ %>
			<button type='button' disabled>다음</button>
			<%} %>
			
			
			
			<button type="button" onclick="location.href='regForm.jsp'">글쓰기</button>
			
		</td>
	</tr>
</table>

 부트스트랩 - 자바스크립트 및 CSS(Style)가 미리 정의되어있는 것. 
 WebContent쪽에 압축푼 부트스트랩 폴더를 넣어두고, 각각의 jsp파일 헤드쪽에서 사용선언을 하면 된다.
 <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  - 사용선언
 링크하겠다 - link, 관계는 어찌되느냐 - rel, 경로 - href
 
 <table border='1' class="table table-striped"></table>		-테이블에 적용
<button type='button' class="btn btn-success btn-sm">버튼</button>	-버튼에 적용
<p class="text-warning">안녕하세요</p>	-일반텍스트에 적용
<input type="text" class="form-control" name="abcd" placeholder="내용">	-input태그 적용(이 클래스 적용시 input칸이 엄청 길어짐.. 근데 선생님은 그걸 table태그로 처리하셨는데 그냥 style="width:#px"로 해도 될 듯)

el jstl - 다음시간에 배울 내용
스크립틀릿같은 하나의 방법?


</body>
</html>