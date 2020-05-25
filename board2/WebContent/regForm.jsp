<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="reg.jsp" method="post">
		<input type="text" name="title" placeholder="제목"><br>
		<input type="submit" value="등록">
	</form>

일단 데이터베이스에 있어서 칼럼에는 게시글의 번호인 num과 제목인 title 그리고 등록날짜인 pdate와 조회수인 count가 있다.
여기서 게시글에 넘버링을 부여하는 것을 sequence test_num으로 부여를 한다고 하셨는데
그러면 게시글이 삭제됐거나 그런 경우 num값이 중복될 수 있는 거 아닌가?
ex) 10개의 게시글이 작성되고 test.num이 10인데 여기서 중간 글 하나 삭제된 경우 다음 num은 11이 되야하는데 test.num은 
	게시글삭제로 9가 되면서 게시글넘버를 10 주려고 하게 되는거 아닌가?
	그냥 num은 따로 운용해야할 것 같은데 -> 시퀀스는 중복되지 않는 고유한 칼럼값
	
한글 깨짐문제에 대하여.. 여기서 한글을 입력하는 경우 깨져서 입력되는거같은데, reg.jsp쪽에서 request.setCharacterEncoding("utf-8");로도 해결이 안되는 듯한 모양이다..
흠. DAO쪽이나 다른쪽에서 뭘 해줘야하나

</body>
</html>