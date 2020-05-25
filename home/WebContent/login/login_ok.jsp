<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 요청시 처리페이지</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="check" class="home.login.loginCheck"></jsp:useBean>
<jsp:setProperty property="*" name="check"/>
<%
	if (check.getId()==null||check.getId().trim().equals("")){
		response.sendRedirect("login.jsp");
		return;
		//이 페이지에 바로 접근하는 등의 비정상적 상황에 대한 유효성검증
	}
	
	String msg=null;
	String url="login.jsp";
	int res=check.loginChecking();
	if (res==check.OK){
		msg=check.getId()+"님 로그인 되었습니다.";
		url=request.getContextPath()+"/index.jsp";
		session.setAttribute("id", check.getId()); //로그인 성공시 세션생성. 또는 check객체를 session scope로 만들어도 되지 않을까 한다.
		String saveId = request.getParameter("saveId"); //체크가 되어있으면 on으로 넘어오고 안되어있으면 null로 넘어온다.
		Cookie idCookie = new Cookie("saveId", check.getId());
		if(saveId!=null){
			idCookie.setMaxAge(24*60*60);
		}else{
			idCookie.setMaxAge(0);
		}
		response.addCookie(idCookie);
	}else if(res==check.NOT_ID){
		msg="존재하지 않는 ID입니다.";
	}else if(res==check.NOT_PW){
		msg="비밀번호가 틀렸습니다. 확인 후 다시 로그인해주세요";
	}else if(res==check.ERROR){
		msg="서버 오류 발생. 관리자에게 문의하세요";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>')
	location.href="<%=url%>"
</script>
</body>
</html>