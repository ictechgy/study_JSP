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
	String upPath=config.getServletContext().getRealPath("/test3"); //���ε� ���
	try{
		mr = new MultipartRequest(request, upPath, 10*1024*1024, "euc-kr");  //mr�� ũ��� 10Mbytes
		out.println("���Ͼ��ε� ����!!");
	}catch(IOException e){
		out.println("���Ͼ��ε� ����!!");
		e.printStackTrace();
		return;
	}
	//���� ���ε�Ǵ� ��ġ�� C:\Users\USER-PC\Desktop\JSP�ΰ�\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\home\test3
	
%>
<h3>�ø��� : </h3><%=mr.getParameter("name") %><br>
<p>
<h3>���ϸ� : </h3><%=mr.getFilesystemName("filename") %><br>
<p>
<h3>����ũ�� : </h3>
<%	File file = mr.getFile("filename");
	int filesize=0;
	if (file!=null) {
		filesize=(int)file.length();  //���� ũ�� long�� ��ȯ
		}%>
<%=filesize %>Bytes
���� ���� ���ε� �Խ����� ����ٰ� �Ѵٸ� �������� �����ͺ��̽� ��������� ���������� ������? 
������ ���ε��ϴ°� �Ӹ��ƴ϶� �� �� �ȿ��� �������� �Ϸ���? �ٿ �����ϰ� �Ϸ���..
</body>
</html>