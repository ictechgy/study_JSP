<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSTL 예제 2</title>
</head>
<body>
<c:set var="country" value="${'korea'}" />
<c:if test="${country != null }">
	국가명 : <c:out value="${country }"/>
</c:if>
<br>
<c:choose>
	<c:when test="${country=='korea' }">
		<c:out value="${country }"/>의 여름은 덥고 습하다.
	</c:when>
	<c:when test="${country=='russia' }">
		<c:out value="${country }"/>의 겨울은 춥다.
	</c:when>
	<c:otherwise>
		그 외 지역은 알 수 없습니다.
	</c:otherwise>
</c:choose>
<br>
<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="100"> <!-- step은 안주면 1로 자동 설정 -->
	<c:if test="${i%2==0 }">
		<c:set var="sum" value="${sum+i}" />
	</c:if>
</c:forEach>
1~100까지 짝수의 합 : ${sum }
<br>
<c:forTokens var="color" items="red,yellow,black" delims=",">
	<c:out value="${color }"/><br>
</c:forTokens>
</body>
</html>