<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!	//방문객수를 파일에 저장하기
	int count=0; 
	String path="";
	public void jspInit(){
		path=this.getServletContext().getRealPath("count/count.txt");
		//실제 서비스되는 곳의 프로젝트안의 count라는 폴더를 찾고 폴더안의 count.txt파일을 지정한다. - request.getContextPath()와 동일. page의 pageContext아님
		FileReader fr=null;
		BufferedReader br=null;
		try{
			fr = new FileReader(path);
			br = new BufferedReader(fr);
			String line = br.readLine();
			if(line!=null){
				count=Integer.parseInt(line.trim());  //이미 조회수값이 파일내부에 존재한다면 그걸 읽어오기
			}
			br.close();
			fr.close();
		}catch(FileNotFoundException e){
			System.err.println(e.getMessage());
			countSaveFile();	//파일이 존재하지 않는다면 메소드 실행
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
	public void jspDestroy(){  //프로그램이 종료시 호출
		countSaveFile();
	}
	//jspInit()과 jspDestroy()는 오버라이드가 가능하다. _jspService()는 오버라이드 불가능
%>
<%	//_jspService()안에 들어갈 내용들
	if (session.isNew()){ //새로운 브라우저가 요청되었을 때
		count++;	//count라는 값은 서버에서 지속적으로 살아있는 변수값이 되는 듯?
	}
	if(count%10==0){	//수시로 백업
		countSaveFile();
	}
%>
<b>방문횟수 :</b><br> <%=count %>
<%
	String countStr = String.valueOf(count);  //숫자값을 String으로 변환
	int len = countStr.length();
	for(int i=0; i<len; ++i){
		char ch = countStr.charAt(i);%>
		<img src="<%=request.getContextPath()%>/img/no<%=ch%>.gif">
<%	}%>