<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%@ include file="../top.jsp" %>
<head>
<title>로그인페이지</title>
<script type="text/javascript">
	function loginCheck(){
		if (f.id.value==""||id==""){
			alert("아이디를 입력하세요!")
			id.focus()
			return
		}
		if (f.pw.value==""||pw==""){
			alert("비밀번호를 입력하세요!")
			pw.focus()
			return;
		}
		document.f.submit()
	}
	function searchMember(mode){
		window.open(""+<%=request.getContextPath()%>+"/login/search.jsp?mode="+mode, "search", "width=600, height=450")
	}
</script>
<%
	String name = null, value=null;
	Cookie[] cks = request.getCookies();
	if(cks!=null&&cks.length!=0){
		for(int i=0; i<cks.length; i++){
			name=cks[i].getName();
			if(name.equals("saveId")){
				value=cks[i].getValue();
				break;
			}
		}
	}
	//value값이 null이면 쿠키에 값이 존재하지 않는다. 즉 아이디저장을 체크하지 않음
%>
</head>
<body>
<br>
<br>
<p>
<img src="../img/tm_login.jpg" width="150" height="60" border="0" align="center" alt="회원로그인" style="padding-left:30px">
<form name="f" action="login_ok.jsp" method="post" id="f">
	<table width=60% align="center" height="100">
		<tr>
			<td align="right" width="30%">
				<img src="../img/id01.jpg" width="60" height="30" border="0" alt="아이디">
			</td>
			<td width="40%">
			<%if (value==null){ %>
				<input type="text" name="id" tabindex="1" id="id">
			<%}else{ %>
				<input type="text" name="id" tabindex="1" id="id" value="<%=value %>">
			<%} %>  <!-- 근데 굳이 이렇게 if-else로 나눌 필요는 없을 것 같은데. -->
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
					<img src="../img/bt_login.jpg" border="0" alt="로그인" width="100" height="90" tabindex="3"><br>
				</a>
			<nobr>
				<%if (value==null) {%>
				<input type="checkbox" name="saveId">
				<font face="굴림" size="2">아이디 기억하기</font>
				<%}else{ %>
				<input type="checkbox" name="saveId" checked>
				<font face="굴림" size="2">아이디 기억하기</font>
				<%} %>
			</nobr>
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="../img/pwd.jpg" width="60" height="30" alt="비밀번호">
			</td>
			<td>
				<input type="password" name="passwd" tabindex="2"  id="pw">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="javascript:checkMember()">
					<img src="../img/bt_join.jpg" width="80" height="40" border="0" alt="회원가입">
				</a>
				<a href="javascript:searchMember('id')">
					<img src="../img/bt_search_id.jpg" border="0" width="80" height="40" alt="아이디 찾기">
				</a>
				<a href="javascript:searchMember('pw')">
					<img src="../img/bt_search_pw.jpg" border="0" width="80" height="40" alt="비밀번호 찾기">
				</a>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../bottom.jsp" %>
</body>
</html>