<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	document.write("<table border=\"1\">")
	document.write("<tr>")
	document.write("<td>a<td>b<td>!a<td>a&&b<td>a||b<td>a^b</tr>")
	document.write("<tr>")
	var a=0, b=0
	document.write("<td>0<td>0<td>"+(!a)+"<td>"+(a&&b)+"<td>"+(a||b)+"<td>"+(a^b)+"</tr>")
	document.write("<tr>")
	a=0, b=1
	document.write("<td>0<td>1<td>"+(!a)+"<td>"+(a&&b)+"<td>"+(a||b)+"<td>"+(a^b)+"</tr>")
	document.write("<tr>")
	a=1, b=0
	document.write("<td>1<td>0<td>"+(!a)+"<td>"+(a&&b)+"<td>"+(a||b)+"<td>"+(a^b)+"</tr>")
	document.write("<tr>")
	a=1, b=1
	document.write("<td>1<td>1<td>"+(!a)+"<td>"+(a&&b)+"<td>"+(a||b)+"<td>"+(a^b)+"</tr>")
	document.write("</table>")
</script>
</head>
<body>

</body>
</html>