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
	String name=request.getParameter("name");
	String publisher=request.getParameter("publisher");
	String writer=request.getParameter("writer");
	String price=request.getParameter("price");
	
	if (name==null||name.trim().equals("")||publisher==null||publisher.trim().equals("")
			||writer==null||writer.trim().equals("")||price==null||price.trim().equals("")){%>
		<script type="text/javascript">
			alert("������� ������ �����մϴ�. �ٽ� Ȯ���Ͻð� �Է����ּ���")
			history.back()
		</script>
<%	return;
	}
	int res=bdao.insertBook(name,writer,publisher, Integer.parseInt(price));
	if (res>0) {%>
		<script>
			alert("������� ����!! ���������������� �̵��մϴ�.")
			location.href="list2.jsp"
		</script>
<%	}else{%>
		<script>
			alert("������� ����! ��������������� �̵��մϴ�.")
			location.href="insert2.jsp"
		</script>
<%	} %>
</body>
</html>