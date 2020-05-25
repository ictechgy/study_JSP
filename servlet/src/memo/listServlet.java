package memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class listServlet
 */
@WebServlet("/list.do")
public class listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=euc-kr");
		MemoDAO dao = new MemoDAO();
		PrintWriter out = response.getWriter();
		ArrayList<MemoDTO> list = null;
		try {
			list = dao.listMemo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("<div align='center'>");
		out.println("<table border='1'>");
		out.println("<tr bgcolor='#DEFEFD'>");
		out.println("<th width='600'>ID</th><th width='1000'>Email</th><th width='2000'>Memo</th>");
		out.println("</tr>");
		for(MemoDTO dto:list) {
			out.println("<tr>");
			out.println("<th>"+dto.getId()+"</th><th>"+dto.getEmail()+"</th><th>"+dto.getMemo()+"</th>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("<p>");
		out.println("<a href='memo.html'>메모쓰러가기</a>");
		out.println("</div>");
	}

}
