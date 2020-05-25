<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ��û�� ó��������</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="check" class="home.login.loginCheck"></jsp:useBean>
<jsp:setProperty property="*" name="check"/>
<%
	if (check.getId()==null||check.getId().trim().equals("")){
		response.sendRedirect("login.jsp");
		return;
		//�� �������� �ٷ� �����ϴ� ���� �������� ��Ȳ�� ���� ��ȿ������
	}
	
	String msg=null;
	String url="login.jsp";
	int res=check.loginChecking();
	if (res==check.OK){
		msg=check.getId()+"�� �α��� �Ǿ����ϴ�.";
		url=request.getContextPath()+"/index.jsp";
		session.setAttribute("id", check.getId()); //�α��� ������ ���ǻ���. �Ǵ� check��ü�� session scope�� ���� ���� ������ �Ѵ�.
		String saveId = request.getParameter("saveId"); //üũ�� �Ǿ������� on���� �Ѿ���� �ȵǾ������� null�� �Ѿ�´�.
		Cookie idCookie = new Cookie("saveId", check.getId());
		if(saveId!=null){
			idCookie.setMaxAge(24*60*60);
		}else{
			idCookie.setMaxAge(0);
		}
		response.addCookie(idCookie);
	}else if(res==check.NOT_ID){
		msg="�������� �ʴ� ID�Դϴ�.";
	}else if(res==check.NOT_PW){
		msg="��й�ȣ�� Ʋ�Ƚ��ϴ�. Ȯ�� �� �ٽ� �α������ּ���";
	}else if(res==check.ERROR){
		msg="���� ���� �߻�. �����ڿ��� �����ϼ���";
	}
%>
<script type="text/javascript">
	alert('<%=msg%>')
	location.href="<%=url%>"
</script>
</body>
</html>