<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
	function chk(){
		id = document.getElementById('id').value   //name������ �̿��Ϸ��� getElementsByNames��µ� �۵� ���ϳ�
		pw = document.getElementById('pwd').value  //�ش� ������ ����Ű�� ���ϻ��̹Ƿ� .value�ڵ� �߰� �ʿ�
													//�ƴϸ� �׳� name�̳� id�̸������� ~~.value��� �� �� ���� �ʴ���?..
		if (id==''){
			alert("���̵� �Է��Ͻʽÿ�")
		}
		else if (pw ==''){
			alert("��й�ȣ�� �Է��Ͻʽÿ�")
		}
		else{
			log.submit()
		}
	}
</script>


</head>
<body>

<h1 style="color:skyblue;">CARE LAB</h1>
<h2>���� ����Ʈ�� �湮���ּż� �����մϴ�.</h2>

<form action='chkLogin.jsp' method='post' id='log'>
	<input type='text' placeholder='���̵�' name='id' id='id'><br>
	<input type='password' placeholder='��й�ȣ' name='pwd' id='pwd'><br>
	<input type='button' value='�α���' onclick='chk()'>
</form>


<%
	boolean bool = false;
	Cookie[] cookieArr = request.getCookies();
	
	if(cookieArr != null){
		for(Cookie c : cookieArr ){
			if(c.getName().equals("kies")){
				bool=true;
			}
		}
	}
	
	if(bool == false){
%>
<script>
	window.open("popup.jsp", "new", "width=500 height=500 left=200 top=200")
</script>
<%} %>



���� ������ �ȸ���� include ������ ��� ����(�ٸ� �׷���� ��� ����)

<%
	if (session.getAttribute("logeduser")!=null){
		response.sendRedirect("interval.jsp");
	}
%>
���� �̹� �α����� ������ �� �α����������� ��û�ϸ� �ٸ� �������� ������ ����




</body>
</html>