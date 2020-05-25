<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border='1'>
	<tr>
		<th>제목</th><th>조회수</th>
	</tr>
	
	<tr>
		<td><a href='result.jsp'>안녕하세요</a></td>
		<td><%application.setAttribute("views",0);
			  int num = (int)application.getAttribute("views");
			  out.print(num); 
			  %></td>
	</tr>

</table>

속성값은 단순히 변수명을 가지고 호출할 수 없고 setter나 getter를 통해서만 조절할 수 있는건가

위와같이 작성하면.. 이 페이지가 요청되었을 때 views에 담긴 값은 계속 0만 될 것 같은데.. 0만 뜰거같음.
getAttribute의 반환형은 Object형이므로 사용시에는 캐스트형변환 필요


</body>
</html>