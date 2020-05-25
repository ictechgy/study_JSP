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
<jsp:include page="../default/main.jsp"/>
<jsp:include page="../default/footer.jsp"/>

</body>
</html>

<!-- 기본적으로 클라이언트가 서버에 접속하면 index.jsp를 보게 됨. 서버설정상 그렇게 되어있다.
나는 main.jsp에서 header.jsp와 footer.jsp를 include시키고, 이 페이지에서는 < jsp:forward >를 사용함
 -->