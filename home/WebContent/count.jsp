<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!	//�湮������ ���Ͽ� �����ϱ�
	int count=0; 
	String path="";
	public void jspInit(){
		path=this.getServletContext().getRealPath("count/count.txt");
		//���� ���񽺵Ǵ� ���� ������Ʈ���� count��� ������ ã�� �������� count.txt������ �����Ѵ�. - request.getContextPath()�� ����. page�� pageContext�ƴ�
		FileReader fr=null;
		BufferedReader br=null;
		try{
			fr = new FileReader(path);
			br = new BufferedReader(fr);
			String line = br.readLine();
			if(line!=null){
				count=Integer.parseInt(line.trim());  //�̹� ��ȸ������ ���ϳ��ο� �����Ѵٸ� �װ� �о����
			}
			br.close();
			fr.close();
		}catch(FileNotFoundException e){
			System.err.println(e.getMessage());
			countSaveFile();	//������ �������� �ʴ´ٸ� �޼ҵ� ����
		}catch(IOException e){
			System.err.println(e.getMessage());
			countSaveFile();
		}
	}
	public void countSaveFile(){
		FileWriter fw = null;
		BufferedWriter bw = null;
		PrintWriter pw = null;
		try{
			fw = new FileWriter(path);
			bw = new BufferedWriter(fw);
			pw = new PrintWriter(bw, true);
			pw.println(count);
			pw.close();
			fw.close();
		}catch(IOException e){
			System.err.println(e.getMessage());
		}
	}
	public void jspDestroy(){  //���α׷��� ����� ȣ��
		countSaveFile();
	}
	//jspInit()�� jspDestroy()�� �������̵尡 �����ϴ�. _jspService()�� �������̵� �Ұ���
%>
<%	//_jspService()�ȿ� �� �����
	if (session.isNew()){ //���ο� �������� ��û�Ǿ��� ��
		count++;	//count��� ���� �������� ���������� ����ִ� �������� �Ǵ� ��?
	}
	if(count%10==0){	//���÷� ���
		countSaveFile();
	}
%>
<b>�湮Ƚ�� :</b><br> <%=count %>
<%
	String countStr = String.valueOf(count);  //���ڰ��� String���� ��ȯ
	int len = countStr.length();
	for(int i=0; i<len; ++i){
		char ch = countStr.charAt(i);%>
		<img src="<%=request.getContextPath()%>/img/no<%=ch%>.gif">
<%	}%>