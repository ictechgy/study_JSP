<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
/* 	request.setCharacterEncoding("euc-kr");
	String name=request.getParameter("name"); */
	MultipartRequest mr =null;
	String upPath=config.getServletContext().getRealPath("/test3"); //업로드 경로
	try{
		mr = new MultipartRequest(request, upPath, 10*1024*1024, "euc-kr");  //mr의 크기는 10Mbytes
		out.println("파일업로드 성공!!");
	}catch(IOException e){
		out.println("파일업로드 실패!!");
		e.printStackTrace();
		return;
	}
	//실제 업로드되는 위치는 C:\Users\USER-PC\Desktop\JSP인강\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\home\test3
	
%>
<h3>올린이 : </h3><%=mr.getParameter("name") %><br>
<p>
<h3>파일명 : </h3><%=mr.getFilesystemName("filename") %><br>
<p>
<h3>파일크기 : </h3>
<%	File file = mr.getFile("filename");
	int filesize=0;
	if (file!=null) {
		filesize=(int)file.length();  //파일 크기 long형 반환
		}%>
<%=filesize %>Bytes
만약 파일 업로드 게시판을 만든다고 한다면 파일전용 데이터베이스 저장공간을 만들어야하지 않을까? 
파일을 업로드하는것 뿐만아니라 그 글 안에서 보여지게 하려면? 다운도 가능하게 하려면..
</body>
</html>