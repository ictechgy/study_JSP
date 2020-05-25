<%@page import="java.util.*"%>
<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
<div align="center" style="height: 300px;">
<h1>회원 목록</h1>
<jsp:useBean id="mb" class="members.MemberDAO"/>
<%
//스크립틀릿 내부에서 MemberDTO 객체를 만드는 것도 아닌데 위에서 선언한 이유는 왜일까. ArrayList에 있어서 제네릭 설정을 하려면 import시켜줘야하나. 아니면 밑의 for each문때문에?
ArrayList<MemberDTO> memberList = mb.memberView();
if(memberList == null || memberList.size() == 0 ){
	out.print("<h1>등록된 값이 없습니다.</h1>");  //이렇게 해주지 않는다면 밑에서 for each문 작동시 오류가 뜰 수도 있겠군. 물론 이 페이지가 로그인한 사람만 접근할 수 있으니 로그인한 사람의 정보도 뜰 것이라 이럴 가능성은 없지만 혹시나해서.
}else{%>
	<table border='1'>
	<tr>
	<th width="100">이름</th>
	<th width="100">주소</th>
	<th width="100">전화번호</th>
	</tr>
	<%
	for(MemberDTO dto:memberList){
	%>
	<tr>
	
	<td style="cursor:pointer"
	onclick='location.href="userInfo.jsp?id=<%=dto.getId()%>"'>  <!-- 서버에서 페이지를 구성할 때 이미 링크자체에 해당 사용자의 id값이 있는상태로 링크가 걸려있겠네. 그리고 앙코르 태그를 안쓰고 td자체에 클릭을 통한 이동을 구현한 점. -->
	<%=dto.getName()%></td><!--  공간에 링크가 걸려있어서 이름을 클릭 안하고 공간 클릭해도 이동함. 맞네.. 클라이언트쪽에서 F12로 보면 해당 링크구성에 id값이 걸려있는 상태이다. 이걸 이용해서 링크 클릭시 저 페이지 요구할 때 값을 보내겠네.-->
							<!--  이러한 방식은 어느정도 위험성이 존재.. 할듯. get방식으로서.. 마치 그 인터넷주문사이트에서 URL번호 막 입력하면 다른 사용자 정보 볼 수 있는 것처럼 -->
				
	<td><%=dto.getAddr()%></td>
	<td><%=dto.getTel()%></td>
	</tr>
	<%
	}out.print("</table>"); //이건 스크립틀릿 바깥에 있어도 되지 않을까.. 아 다만 else안에는 있어야겠구나
}
%>
</div>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>