

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class First
 */
@WebServlet("/First")  // -> URL을 지정해주는 구문.. 다른 jsp파일과 이름이 겹치거나 하면 어찌 되지?
public class First extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public First() {
        super();
        // TODO Auto-generated constructor stub
    }

    //선생님은 생성자 없애버리셨는데.. 왜지? 이 페이지를 요구한 경우 생성자를 통해 뭔가 이루어지나? 이 페이지가 실질적으로 생성되는 시점이 이 페이지를 요구받고 이 페이지의 생성자가 작동되는 시점인가?
    //없애도 작동은 잘 하는 것 같았는데.
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());  요건 뭐길래 주석처리?
		response.setContentType("text/html; charset=euc-kr");  //html태그내의 한글출력하기 위해 설정. jsp파일에서 자주 보던 구문인데..
		PrintWriter out = response.getWriter();  //out객체 생성. import필요 -> jsp파일의 스크립틀릿에서는 out객체 쓸 때 그냥 썼는데.. 그건 이미 import가 되어있어서인가. 이건 java파일이다보니 깐깐해서 따로 import해줘야 함?
		out.print("<html>");						//그러면 오류부분에 대해 더 잘 알려주려나.. 물론 처리해야할 것이 더 많아지겠지만? 예외처리라던지 등...
		out.print("<head>");
		out.print("<title>제목줄 표시</title>");
		out.print("<body>");
		out.print("survlet을 통해 웹페이지 제작");
		out.print("</body>");
		out.print("</head>");
		out.print("</html>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response); //이 안에 doGet이 있네??
		//사용자가 post방식으로 이 페이지를 요청한 경우 작동될 코드들 작성
	}
	//doGet이든 doPost이든 반환형이 없는 메소드방식

}//jsp가 나오기 전에 썼던 서블릿. 자바파일을 이용하는건데 저 안에 html을 쓰다보니 복잡해서 jsp파일을 만들게 됨
//아파치 - 서버, 톰캣 - jsp문법을 번역해주는 번역기(서로 다르게 설치가능)
//서버에서 파일을 받으면 JSP컨테이너에서는 서블릿으로 jsp파일을 변환하고 클래스파일로 변환하여 사용자에게 던져줌
//우리가 만든 파일들은 E:\JSP안진홍\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\jstl\org\apache\jsp   -> 안에 보면 jsp컨테이너를 통해 jsp파일이 java파일 및
//클래스파일로 변환되어있는 것을 볼 수 있다. class파일은 클라이언트로 던져져서 클라이언트에서는 이를 해석하는 것 같은데.. 그럼 클라이언트에는 class파일이 어디에 있게 되는걸까?

//jsp의 장점. 서버동적페이지구성과 서버를 꾸미는 것을 따로 구현할 수 있고 구분이 편하다.

//하이퍼링크를 타고 페이지가 바뀔때에는 post형식 사용불가?