<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL 예제 1</title>
</head>
<body>
browser변수값 설정<br>
<c:set var="browser" value="${header['User-Agent']}" /><br>
설정 후 browser : <c:out value="${browser}" /><p>

<c:remove var="browser" />
삭제 후 browser : <c:out value="${browser}" />
</body>
</html>