<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전체 회원 목록보기</title>
<jsp:useBean id="mbdao" class="home.member.MemberDAO"/>]
<%request.setCharacterEncoding("euc-kr");
%>
</head>
<body>
<%@ include file="../top.jsp" %>
<% String cmd=request.getParameter("cmd"); 
	if (cmd==null||cmd.trim().equals("")){
		cmd="all";
		}%>
<div align="center">
	<hr color="green" width="300">
	<%if(cmd.equals("find")){ %>
		<h2>회 원 찾 기</h2>
		<form name="f" method="post">
			<select name="search">
				<option value="id">아이디
				<option value="name">이름
			</select>
			<input type="text" name="searchString">
			<input type="submit" value="찾기">
		</form>
		<jsp:setProperty property="*" name="mbdao"/>
	<%}else{ %>
		<h2>회 원 목 록 보 기</h2>
	<%} %>
	<hr color="green" width="300">
	<table border="1" width="99%">
		<tr bgcolor="yellow">
			<th>이름</th><th>아이디</th><th>이메일</th><th>전화번호</th><th>가입일</th><th> 수정 | 삭제 </th>
		</tr>
<%
	ArrayList<MemberDTO> memberList = null;
	if(cmd.equals("find")){
		memberList = mbdao.findMember();
	}else{	
		memberList = mbdao.listMember();
	}
	if(memberList==null||memberList.size()==0){%>
		<tr>
			<td colspan="6" align="center">등록된 회원이 없습니다</td>
		</tr>
<%	}else{
		for(MemberDTO dto:memberList){%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getAllHp() %></td>
				<td><%=dto.getJoindate() %></td>
				<td> <a href="member_update.jsp?no=<%=dto.getNo()%>">수정</a> | <a href="member_delete.jsp?no=<%=dto.getNo()%>">삭제 </a></td>
			</tr>		
<%		}
	} %>
	</table>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>