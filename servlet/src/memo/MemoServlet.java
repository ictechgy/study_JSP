package memo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemoServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setContentType("text/html; charset=euc-kr");
		String id=req.getParameter("id");
		String email=req.getParameter("email");
		String memo=req.getParameter("memo");
		PrintWriter out = resp.getWriter();
		
		MemoDAO dao = new MemoDAO();
		int res=0;
		try {
			res=dao.insertMemo(id, email, memo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			out.println("<script type='text/javascript'>");
			out.println("alert('메모등록 성공!')");
			out.println("location.href='list.do");
			out.println("</script>");
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('메모등록 실패!')");
			out.println("location.href='memo.html");
			out.println("</script>");
		}
	}
	
}
