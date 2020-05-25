package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {//1. HttpServlet 클래스를 상속받는다.

	//2. doGet(), doPost(), service() 메소드 중 하나 이상을 오버라이드 한다.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = resp.getWriter();
		out.println("안녕하세요");
		out.println("<br>Hello");
		out.close();
	}  

	//3. web.xml을 통해 이 서블릿파일을 등록시킨다. web.xml은 서버가 구동될때 먼저 올라간다.
	
	
}
