<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function m_over(str){
		document.form1.text.value=str
	}
	function m_out(){
		document.form1.text.value="마우스를 그림에"
	}
</script>
</head>
<body>
<center>
	<form name="form1">
		<input type="text" name="text" size="55">
	</form>
	<a href="coffe.html" onmouseover="m_over('그림감상')" onmouseout="m_out()">
		<img src="coffe.jpg">
	</a>
</center>

</body>
</html>