<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL ���� 1</title>
</head>
<body>
browser������ ����<br>
<c:set var="browser" value="${header['User-Agent']}" /><br>
���� �� browser : <c:out value="${browser}" /><p>

<c:remove var="browser" />
���� �� browser : <c:out value="${browser}" />
</body>
</html>