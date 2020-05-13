

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lotto")
public class LottoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 이동 성공");
		/*여기서 대충 랜덤값 7갠가 만들엉서 response해주면 되지않나*/
		response.setContentType("text/html;charset=euc-kr");
		int numbers[] = new int[7]; //로또번호 7개
		Random rd = new Random();
		System.out.println(rd.nextInt(45)+1); //1~45 랜덤수
		PrintWriter out=response.getWriter();
		out.println("<html>"+"<body>");
		for(int i=0; i<numbers.length; i++) {
			numbers[i] = rd.nextInt(45)+1;
			System.out.println(i+1+"번째 숫자 >>"+numbers[i]);
			out.print(numbers[i]+"      ");
		}
		out.println("<a href='lotto.jsp'>돌아가기</a>");
		out.println("</body>"+"</html>");
		
	}

}
