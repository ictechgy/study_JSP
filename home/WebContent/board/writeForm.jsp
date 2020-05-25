<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert('이름을 입력하세요')
			f.writer.focus()
			return false;
		}
		if (f.subject.value==""){
			alert('제목을 입력하세요')
			f.subject.focus()
			return false;
		}
		if (f.content.value==""){
			alert('글 내용을 입력하세요')
			f.content.focus()
			return false;
		}
		if (f.passwd.value==""){
			alert('비밀번호를 입력하세요')
			f.passwd.focus()
			return false;
		}
		return true;
	}
	//필수입력값은 그냥 태그 안에 required 넣어서 처리 가능
</script>
<%
	int num=0, re_step=0, re_level=0;
	String snum=request.getParameter("num");
	if(snum !=null){  //답글을 달려고 한다면
		num=Integer.parseInt(snum);
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>
<div align="center">
<form name="f" action="writePro.jsp" method="post" onsubmit="return check()"> <!-- check()메소드가 반환해주는 값에 따른 submit 실행 -->
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="re_step" value="<%=re_step %>">
<input type="hidden" name="re_level" value="<%=re_level %>">
	<table border="1" width="99%" height="90%">
		<tr>
			<th colspan="2">글 쓰 기</th>
		</tr>
		<tr>
			<th>이름</th><td><input type="text" name="writer"></td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<th>이메일</th><td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th>글내용</th><td><textarea name="content" cols="50" rows="10"></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th><td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글등록">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="javascript:location.href='list.jsp'">
				<!-- 강의에서는 onclick="window.location='list.jsp'" 로 만들었다. -->
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp" %>