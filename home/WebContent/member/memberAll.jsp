<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, home.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü ȸ�� ��Ϻ���</title>
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
		<h2>ȸ �� ã ��</h2>
		<form name="f" method="post">
			<select name="search">
				<option value="id">���̵�
				<option value="name">�̸�
			</select>
			<input type="text" name="searchString">
			<input type="submit" value="ã��">
		</form>
		<jsp:setProperty property="*" name="mbdao"/>
	<%}else{ %>
		<h2>ȸ �� �� �� �� ��</h2>
	<%} %>
	<hr color="green" width="300">
	<table border="1" width="99%">
		<tr bgcolor="yellow">
			<th>�̸�</th><th>���̵�</th><th>�̸���</th><th>��ȭ��ȣ</th><th>������</th><th> ���� | ���� </th>
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
			<td colspan="6" align="center">��ϵ� ȸ���� �����ϴ�</td>
		</tr>
<%	}else{
		for(MemberDTO dto:memberList){%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getId() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getAllHp() %></td>
				<td><%=dto.getJoindate() %></td>
				<td> <a href="member_update.jsp?no=<%=dto.getNo()%>">����</a> | <a href="member_delete.jsp?no=<%=dto.getNo()%>">���� </a></td>
			</tr>		
<%		}
	} %>
	</table>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>