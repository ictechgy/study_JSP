<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList, home.board.BoardDTO"%>
<%@ include file="../top.jsp" %>
<div align="center">
	글 목 록
	<table border="0" width="99%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">글쓰기</a></td>
		</tr>
	</table>
	<table border="1" width="99%">
		<tr bgcolor="green">
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>IP</th>
		</tr>

<jsp:useBean id="bdao" class="home.board.BoardDAO"></jsp:useBean>
<%
	int pageSize=5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int currentPage=Integer.parseInt(pageNum);
	int startRow= pageSize*(currentPage-1)+1;  //또는 currentPage * pageSize - 4
	int count = bdao.getCount(); 
	int number = count - (currentPage-1)* pageSize;

	ArrayList<BoardDTO> boardList = bdao.listBoard(startRow, pageSize*currentPage); 
	if(boardList==null||boardList.size()==0){ %>
		<tr>
			<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
		</tr>			
<% }else{
		for(BoardDTO dto : boardList){ %>
			<tr>
				<td><%=number-- %></td>
				<td>				
				<% if(dto.getRe_level()>0) {%>
					<img src="../img/level.jpg" width="<%=dto.getRe_level()*10%>" height="10">
					<img src="../img/re.jpg" height="10">
				<%}%>
				<a href="content.jsp?num=<%= dto.getNum()%>"><%=dto.getSubject() %></a>
				<%if (dto.getReadcount()>10){ %>
					<img src="../img/hot.jpg" name="hot" width="50" heigh="50" onmouseover="javascript:hot.src='../img/hot2.jpg'" onmouseleave="javascript:hot.src='../img/hot.jpg'">
				<%} %>
				</td>
				<td><%=dto.getWriter() %></td>
				<td><%=dto.getReg_date() %></td>
				<td><%=dto.getReadcount() %></td>
				<td><%=dto.getIp() %></td>
			</tr>
		<% }	
	} %>	
	</table>
<%
	if(count>0){
		int totPageNum = count/pageSize + (count%pageSize==0 ? 0:1);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock*pageBlock +1;
		int endPage=startPage+pageBlock-1;
		if(endPage>totPageNum) endPage=totPageNum;
		
		if(startPage!=1){ %>
			<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
	<%	}
		
		
		for(int i=startPage; i<=endPage; i++){ %>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a>
	<%	}
		if(totPageNum>endPage){ %>
			<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
	<%	}
	}
%>
</div>
<%@ include file="../bottom.jsp" %>