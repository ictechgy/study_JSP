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
	Cookie[] cks = request.getCookies(); //사용자의 모든 쿠키를 꺼내와봄
	if (cks != null || cks.length !=0){
		for(int i=0; i<cks.length; i++){
			String name = cks[i].getName();
			String value = cks[i].getValue();
			out.println("쿠키 이름 : "+name+", 쿠키값 : "+value);
		}
	}
%>

</body>
</html>