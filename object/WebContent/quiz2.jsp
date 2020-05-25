<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align='center'>

<h1>설문조사</h1>

<form action='views2.jsp'>

<table border='1'>
	<tr>
	<td align='center'>이름 :</td>
	<td> <input type='text' name='username' placeholder="이름입력"> </td>
	</tr>
	
	<tr>
	<td align='center'>성별 :</td>
	<td> <input type='radio' name='gen' value='남자'> 남자 <input type='radio' name='gen' value='여자' checked> 여자 </td>
	</tr>
	
	<tr>
	<td>좋아하는 계절:</td>
	<td> <input type='checkbox' name='season' value='봄'>봄
		 <input type='checkbox' name='season' value="여름">여름
		 <input type='checkbox' name='season' value="가을">가을
		 <input type='checkbox' name='season' value='겨울'>겨울
	 </td>
	</tr>
	
	<tr align='center'>
	<td> <input type='submit' value='전송'> </td>
	<td> <input type='reset' value='취소'> </td>
	</tr>
	
	


</table>
</form>
</div>



<p>
선생님풀이 </p>

<form action='views2.jsp' method='post'>
<table border='1'>
<tr>
	<td>이 름</td><td><input type='text' name='name'></td>
</tr>
<tr>
	<td>성 별</td>
	<td>
		남자<input type='radio' name='gender' value='남'>
		여자<input type='radio' name='gender' value='여'>	
	</td>
</tr>
<tr>
	<td>좋아하는 계절</td>
	<td>
		봄<input type='checkbox' name='season' value='봄'>
		여름<input type='checkbox' name='season' value='여름'>
		가을<input type='checkbox' name='season' value='가을'>
		겨울<input type='checkbox' name='season' value='겨울'>
	</td>
</tr>
<tr>
	<td><input type='submit' value='전송'></td>
	<td><input type='reset' value='취소'></td>
</tr>

</table>
</form>








</body>
</html>

<!-- 
tr - table row
th - table header
td - a cell within a table

hr - horizontal rule
 -->