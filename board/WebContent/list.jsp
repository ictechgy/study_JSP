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

<%
	//게시판의 모든 값(목록)을 가져와서 현재 페이지에 보여주기
	ArrayList<TestDTO> listDto = dao.listView();  
	System.out.print(listDto);
	
	if (listDto==null || listDto.size() == 0){
		out.print("출력할 내용이 없습니다.");
	}
	else{ %>
		<table border='1'>
			<tr>
				<th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th>
			</tr>
		<%for (TestDTO dto: listDto) {%>	
			<tr>
				<td><%=dto.getNum() %></td><td><%=dto.getTitle() %></td>
				<td><%=dto.getPdate() %></td><td><%=dto.getCount() %></td>
			</tr>
		<%} %>
			<tr>
				<td colspan='4' align='right'><button type="button" onclick="location.href='regForm.jsp'">글쓰기</button></td>
			</tr>
		</table>
<%} %>






<%
String start = request.getParameter("start");   //start라고 하기보다는 그냥 pagenum 이라고 하는게 더 낫지 않았을까
if(start == null){
	start = "1";  //왜 굳이 start를 문자형태로 만들어야 한거지? requst로 받는 부분도 그렇고 물음표를 통해 값을 넘겨주는 경우에도 그렇고.. request반환형때문에 어쩔 수 없는건가
}
int intStart = Integer.parseInt(start);



int totalPage = dao.getTotalPage(); %> 전체게시글갯수 가져오기



<table border='1'>
<tr><th>번호</th><th>제목</th><th>등록날짜</th><th>조회수</th></tr>
<%
	for(TestDTO dto:listDto){ %>  <!-- 근데 이 부분에 있어서 listDto가 null이어도 오류가 안나네..? -->
	<tr>
		<td><%=dto.getNum() %></td><td><a href="count.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
		<td><%=dto.getPdate() %></td><td><%=dto.getCount() %></td>
	</tr>
	
		<%}if (listDto.size()==0) {
			out.print("<tr><th colspan='4'>등록된 정보가 없습니다</th></tr>");
		}%>
	
	
	<tr>
		<td colspan='4' align='right'>
			
			
			<%  //만약 사용자가 사이트에 처음접속했거나 페이지가 1번이라면 이전버튼은 안눌리게 하고 다음버튼만 눌리게 할 것이다. 역시나 맨 끝페이지에 도달시 다음버튼은 비활성화 시킬 것이다.
				if(intStart != 1){
			%>
			<button type='button' onclick="location.href='list.jsp?start=<%=intStart-1%>'">이전</button>
			<%}else{ %>
			<button type='button' disabled>이전</button>
			<%} %>
			<!-- 그냥 페이지를 세주는데에 있어 int든 String이든 같다고 보면 될 듯? request형태때문에 어쩔수 없이 두 형태로 쓰기만 할 뿐 같다고 보이는데. start든 intStart이든
			값을 넘겨주고 받을 때에만 String클래스인 start를 쓰고 실질적으로 페이지를 구성할 때 버튼의 작동유무는 int값으로 하는거같은데 -->
			
			<%=intStart %>/<%=totalPage %>   <!-- 현재로서는 뭐.. 페이지라는게 시작페이지와 마지막페이지라는 느낌보다는 시작값 1과 그냥 게시글 총 갯수로 맨 마지막숫자를 정해준 그런 느낌밖에 안든다. -->
			
			
			<%
				if(intStart < totalPage){
			%>
			<button type='button' onclick="location.href='list.jsp?start=<%=intStart+1%>'">다음</button>
			<%}else{ %>
			<button type='button' disabled>다음</button>
			<%} %>
			
			
			
			<button type="button" onclick="location.href='regForm.jsp'">글쓰기</button>
			
			
		</td>
	</tr>
	
</table>


</body>
</html>