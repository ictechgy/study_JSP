<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	//request.getParameter()반환형은 무조건 String
	//일단 그리고 한글처리 안했음
%>
<script type="text/javascript">
	alert("<%=name%>님의 나이는 <%=age%>입니다.")
</script>

</body>
</html>