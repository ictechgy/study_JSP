<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

문자타입이나 인코딩방식에 있어서 EUC-KR과 UTF-8의 어떤 속도차이같은것도 있을라나

<h1 align='center' style="color:blue;">뚜나라</h1><p>


<table border='2'>
	<tr>
		<th>게시글 이름</th><th>조회수</th><th>작성자</th>
	</tr>

	<tr>
		<td><a href='post1.jsp'>띠?</a></td>
		<td align='center'>
		<%
			if ( application.getAttribute("hits") == null){  //.value 안썼음.. 음..getter가 Object형으로 반환하기는 하는거같던데..그래서 cast형변환도 쓰기도 하고.. 아.. .value쓰는건 자바스크립트 getElement쪽이었음..거기서 꼭 .value써야하나?
				application.setAttribute("hits", 0);         //getter메소드가 Object형으로 반환하는건 맞음. 이런 메소드들은 어떤 자료형을 반환하게 될지 모르니까 Object형으로 반환하도록 만든 듯 
			}												 //getElement들은?
		out.print( application.getAttribute("hits") );
		%>
		
		
		</td>
		<td>뚜비뚜밥</td>
	</tr>

</table>

document.write 자바스크립트 출력문
document.getElementById() 태그에 부여된 이름을 이용하여 해당 공간의 값을 자바스크립트에서 사용. 그리고 뒤에 .value꼭 써야하나
물론 그냥 id.value같은거 써도 되는 것 같은데.. name.value같은거..
근데 역시나 getter가 있는 이유는 접근제한자가 있을 수 있어서인가?? 그럴수가 있나.. 훔..


script문은 위에쓰든 앞에쓰든 페이지 구성 끝나기 전에 실행되는 것 같네/.



<script type='text/javascript'>
	var verify=confirm("뚜나라에 처음오셨습니까?")
	
	if(verify){  //조건식은 verify==true해도 되긴함
		alert("뚜나라에 방문하신것을 환영합니다!!")
	}
	else{
		alert("재방문을 환영합니다!!")
	}
</script>




</body>
</html>