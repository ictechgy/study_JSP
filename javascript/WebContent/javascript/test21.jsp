<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	var kor, eng, sum, avg, hak
	kor=prompt("국어점수")
	eng=prompt("영어점수")
	sum=eval(kor)+eval(eng)	//문자값으로 들어온 것을 숫자값으로 변환해주는 내장함수
	avg=sum/2.0
	if(avg>=90){
		document.write("국어 :" + kor + "영어 :" +eng+"<br>")
		document.write("합계 :"+sum+"평균:"+avg+"학점:A<br>")
	}else if(avg>=80){
		document.write("국어 :" + kor + "영어 :" +eng+"<br>")
		document.write("합계 :"+sum+"평균:"+avg+"학점:B<br>")
	}else if(avg>=70){
		document.write("국어 :" + kor + "영어 :" +eng+"<br>")
		document.write("합계 :"+sum+"평균:"+avg+"학점:C<br>")
	}else if(avg>=60){
		document.write("국어 :" + kor + "영어 :" +eng+"<br>")
		document.write("합계 :"+sum+"평균:"+avg+"학점:D<br>")
	}else{
		document.write("국어 :" + kor + "영어 :" +eng+"<br>")
		document.write("합계 :"+sum+"평균:"+avg+"학점:F<br>")
	}
	
</script>
</head>
<body>

</body>
</html>