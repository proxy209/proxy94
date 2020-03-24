package mvc.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.bbsDAO;



public class deleteCommand implements CommandHandler {

	@Override
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b = request.getParameter("bID");
		int bID = Integer.parseInt(b);
		
		bbsDAO dao = new bbsDAO();
		dao.delete(bID);
		
 	   RequestDispatcher rd = request.getRequestDispatcher("board.jsp");
 	   rd.forward(request, response);
	}
}
