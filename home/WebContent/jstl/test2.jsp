<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL ���� 2</title>
</head>
<body>
<c:set var="country" value="${'korea'}" />
<c:if test="${country != null }">
	������ : <c:out value="${country }"/>
</c:if>
<br>
<c:choose>
	<c:when test="${country=='korea' }">
		<c:out value="${country }"/>�� ������ ���� ���ϴ�.
	</c:when>
	<c:when test="${country=='russia' }">
		<c:out value="${country }"/>�� �ܿ��� ���.
	</c:when>
	<c:otherwise>
		�� �� ������ �� �� �����ϴ�.
	</c:otherwise>
</c:choose>
<br>
<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="100"> <!-- step�� ���ָ� 1�� �ڵ� ���� -->
	<c:if test="${i%2==0 }">
		<c:set var="sum" value="${sum+i}" />
	</c:if>
</c:forEach>
1~100���� ¦���� �� : ${sum }
<br>
<c:forTokens var="color" items="red,yellow,black" delims=",">
	<c:out value="${color }"/><br>
</c:forTokens>
</body>
</html>