package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {//1. HttpServlet Ŭ������ ��ӹ޴´�.

	//2. doGet(), doPost(), service() �޼ҵ� �� �ϳ� �̻��� �������̵� �Ѵ�.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = resp.getWriter();
		out.println("�ȳ��ϼ���");
		out.println("<br>Hello");
		out.close();
	}  

	//3. web.xml�� ���� �� ���������� ��Ͻ�Ų��. web.xml�� ������ �����ɶ� ���� �ö󰣴�.
	
	
}
