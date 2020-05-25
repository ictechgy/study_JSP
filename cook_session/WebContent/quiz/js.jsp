<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
	function display(){
		alert("click 이벤트 발생")
	}
	function chkData(){
		if(document.getElementById('name22').value==""){
			alert("이름은 필수 사항 입니다")
		}else{
			fo.submit()
			//document.fo.submit()
		}
	}
	function pwchk(){
		inPut = document.getElementById('inPut').value
		document.getElementById('outPut').value=inPut
		document.getElementById('inPut').value=""
		document.getElementById('label').innerHTML="잘 들어 가나"
	}
</script>
</head>
<body>
	<hr>
	<input type="text" id="inPut" onchange="pwchk()"><br>
	<input type="text" id="outPut"><br>
	<input type="text"><br>
	<label id="label">안녕하세요</label>
	<hr>
	
	<form id="fo" action="test.jsp" method="post">
		<input type="text" id="name22" name="name" placeholder="이름">(*필수항목)<br>
		<input type="submit" value="입력" onclick="chkData()">
	</form>

	<table><tr><td onclick="location.href='test.jsp'">클릭</td></tr></table>
	<input type="button" value="버튼" onclick="display()"><br>
	<button type="button" onclick="display()">클릭</button><br>



	<input type="text" id="demo" size="50">
	
	<script type="text/javascript">
	/*
		demo.value="안녕하세요"
		var a=100
		b = "test"
			document.write(a)
			document.write(b)
	
		var a = confirm('처음 방문 입니까.,??')
		document.write('a : '+a+"<br>화면에 <br>출력할 값")
		if(a == true)
			alert('환영합니다~~~')
		else
			alert('저리가~~~')
	*/
	</script>
	
	
</body>
</html>











