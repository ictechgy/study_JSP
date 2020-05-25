<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
include 지시자
다른 페이지로 이동을 하더라도 상단과 하단은 그대로 존재하는 페이지들
페이지를 이동해도 변하지 않는 고정적인 부분에 대한 설정을 할 때 사용

 <%@ include file='header.jsp' %>
<h1> 인클루드 사이에 들어갈 내용</h1>
 <%@ include file='footer.jsp' %>
 
모든 값을 포함시키겠다는 include
CSS는 header에만 적용시켰지만 include를 통해 전부다 포함시켰기때문에
main에서 전부 적용됨. 즉 밑에서 include시킨 footer.jsp값까지 적용된다. 

CSS Style이 include를 통해 다같이 적용된다? 그러면 다른 것들 중 다같이 적용되는건 또 뭐가 있을까..
header에서 에러페이지에 대해 페이지지시자를 통해 지정해놓는다면 그건 이 main에서도 적용이 되는걸까?

페이지 지시자중에서 isErrorPage는 어디에 쓰는지 궁금한데.. 만약 에러페이지에 대해서 web.xml에서 적용시키면.. 여러 프로젝트에 대해서 에러jsp가 있을 수 있는데 뭘 실행시킬지 몰라서 오류뜨려나
그 xml에 쓰는거 보니까 프로젝트명은 안쓰더만

만약 에러페이지를 지정했는데 해당 에러페이지에서 isErrorPage='false'하면 어찌되려나?

</body>
</html>