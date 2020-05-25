<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function question(){
		qu=confirm("당신은 성인입니까?")
		if(qu==true){
			alert("저희 사이트를 방문해주셔서 감사합니다.")
		}else{
			alert("저희 사이트는 성인전용사이트입니다.\n이용하실 수 없습니다.")
		}
	}
</script>
</head>
<body>
<form>
	<input type="button" value="선택하세요" onclick="question()">
</form>

</body>
</html>