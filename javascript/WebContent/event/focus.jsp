<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function display(data){
		windows.status=data
	}
</script>
</head>
<body>
<center>
	<form>
		<input type="text" size="50" onFocus="display('커서')">
	</form>
</center>

</body>
</html>