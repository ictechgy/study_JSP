<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!DOCTYPE html>
<jsp:useBean id="bdao" class="home.book.BookDAO"/>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");	
%>
<jsp:useBean id="bdto" class=home.book.BookDTO/>
<jsp:setProperty property="*" name="bdto"/> <!-- bdto.setName(request.getParameter("name")); -->
	<%
	if (bdto.getName()==null||bdto.getName().trim().equals("")||bdto.getPublisher()==null||bdto.getPublisher().trim().equals("")
			||bdto.getWriter()==null||bdto.getWriter().trim().equals("")/*||bdto.getPrice()==null||bdto.getPrice().trim().equals("")*/){%>
		<script type="text/javascript">
			alert("도서등록 내용이 부족합니다. 다시 확인하시고 입력해주세요")
			history.back()
		</script>
<%	return;
	}
	int res=bdao.insertBook(bdto); 
	if (res>0) {%>
		<script>
			alert("도서등록 성공!! 도서보기페이지로 이동합니다.")
			location.href="list2.jsp"
		</script>
<%	}else{%>
		<script>
			alert("도서등록 실패! 도서등록페이지로 이동합니다.")
			location.href="insert2.jsp"
		</script>
<%	} %>
</body>
</html>