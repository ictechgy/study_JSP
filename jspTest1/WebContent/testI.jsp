<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("su"));
	int sum = sum(num);
	
	out.println("1~"+num+"������ �� : " + sum);
%>
<%!  //����(���� ��ũ��Ʋ��) - �Ϲݽ�ũ��Ʋ�����δ� �޼ҵ� ���� �Ұ���. ������ ������� ������� �ʳ�?
	public int sum(int num){
		int sum=0;
		for(int i=1; i<=num; i++){
			sum +=i;
		}
		return sum;
	}
%>

������ ���� ���� �޼ҵ�� �޼ҵ� �� ��ü�μ� ���������, �Ϲ� ��ũ��Ʋ���� �� ������� _jspService��� �޼ҵ�ȿ� ���� �ȴ�.
�޼ҵ� �ȿ� �޼ҵ带 ������ ���� �����Ƿ� �Ϲݽ�ũ��Ʋ���ȿ� �޼ҵ带 ���� �� ����.

���� �ȿ��� ����ʵ�(����)�� ������ �����ϸ� � �޼ҵ忡������ �����ٰ� �� �� �ִ�.
</body>
</html>