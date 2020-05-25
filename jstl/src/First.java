

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
@WebServlet("/First")  // -> URL�� �������ִ� ����.. �ٸ� jsp���ϰ� �̸��� ��ġ�ų� �ϸ� ���� ����?
public class First extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public First() {
        super();
        // TODO Auto-generated constructor stub
    }

    //�������� ������ ���ֹ����̴µ�.. ����? �� �������� �䱸�� ��� �����ڸ� ���� ���� �̷������? �� �������� ���������� �����Ǵ� ������ �� �������� �䱸�ް� �� �������� �����ڰ� �۵��Ǵ� �����ΰ�?
    //���ֵ� �۵��� �� �ϴ� �� ���Ҵµ�.
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());  ��� ���淡 �ּ�ó��?
		response.setContentType("text/html; charset=euc-kr");  //html�±׳��� �ѱ�����ϱ� ���� ����. jsp���Ͽ��� ���� ���� �����ε�..
		PrintWriter out = response.getWriter();  //out��ü ����. import�ʿ� -> jsp������ ��ũ��Ʋ�������� out��ü �� �� �׳� ��µ�.. �װ� �̹� import�� �Ǿ��־�ΰ�. �̰� java�����̴ٺ��� ����ؼ� ���� import����� ��?
		out.print("<html>");						//�׷��� �����κп� ���� �� �� �˷��ַ���.. ���� ó���ؾ��� ���� �� ������������? ����ó������� ��...
		out.print("<head>");
		out.print("<title>������ ǥ��</title>");
		out.print("<body>");
		out.print("survlet�� ���� �������� ����");
		out.print("</body>");
		out.print("</head>");
		out.print("</html>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response); //�� �ȿ� doGet�� �ֳ�??
		//����ڰ� post������� �� �������� ��û�� ��� �۵��� �ڵ�� �ۼ�
	}
	//doGet�̵� doPost�̵� ��ȯ���� ���� �޼ҵ���

}//jsp�� ������ ���� ��� ����. �ڹ������� �̿��ϴ°ǵ� �� �ȿ� html�� ���ٺ��� �����ؼ� jsp������ ����� ��
//����ġ - ����, ��Ĺ - jsp������ �������ִ� ������(���� �ٸ��� ��ġ����)
//�������� ������ ������ JSP�����̳ʿ����� �������� jsp������ ��ȯ�ϰ� Ŭ�������Ϸ� ��ȯ�Ͽ� ����ڿ��� ������
//�츮�� ���� ���ϵ��� E:\JSP����ȫ\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\jstl\org\apache\jsp   -> �ȿ� ���� jsp�����̳ʸ� ���� jsp������ java���� ��
//Ŭ�������Ϸ� ��ȯ�Ǿ��ִ� ���� �� �� �ִ�. class������ Ŭ���̾�Ʈ�� �������� Ŭ���̾�Ʈ������ �̸� �ؼ��ϴ� �� ������.. �׷� Ŭ���̾�Ʈ���� class������ ��� �ְ� �Ǵ°ɱ�?

//jsp�� ����. �������������������� ������ �ٹ̴� ���� ���� ������ �� �ְ� ������ ���ϴ�.

//�����۸�ũ�� Ÿ�� �������� �ٲ𶧿��� post���� ���Ұ�?